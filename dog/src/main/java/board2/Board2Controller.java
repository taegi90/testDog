package board2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class Board2Controller {
	
	@Autowired
	Board2Service board2Service;
	
	
	/**
	 * 커맨드객체
	 * 사용자에서 전송되어 오는 값(파라미터)
	 * get : index.do?page=1&id=2
	 * post : form (method="post") 안에 
	 * name과 value 쌍으로
	 * spring 자동으로 바인드(setter메서드를 통해) 값을 넣어줌.(파라미터 이름과 vo 필드 이름이 같으면)
	 */

	@RequestMapping("/board2/index.do")
	public String board2Index(Model model, Board2VO vo) { // model(값을 담아둘 공간), 커맨드객체
		// 서비스 호출
		int[] listcount = board2Service.board2Count();	// 전체 갯수와 총페이지수
		List<Board2VO> list = board2Service.board2Index(vo);
		
		// 모델이 저장(뷰에서 쓸려고)
		model.addAttribute("listcount", listcount[0]);
		model.addAttribute("totalpage", listcount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "board/board2_list";
	}
	@RequestMapping("/board2/write.do")
	public String board2Write() {
		return "board/board2_write";
	}
	@RequestMapping("/board2/insert.do")
	public String board2Insert(
			Model model,
			Board2VO vo,
			@RequestParam("board_file_frm") MultipartFile file,
			HttpServletRequest request) {
		//서비스 호출
		int r = board2Service.board2Insert(vo, file, request.getRealPath("/images/"));
		
		// r 값에 따라서 alert 메세지르 다르게 처리
		// 저장이 잘되면 '정상적으로 등록되었습니다.' 목록으로 이동
		// 저장이 안되면 '저장되지 않았습니다.' 쓰기폼으로 이동
		String msg="";
		String url="";
		if(r > 0) { //파일이 1개 이상 저장이 되면
			msg = "정상적으로 등록되었습니다.";
			url = "/dog/board2/index.do";
		} else { //저장이 안되면 
			msg = "저장되지 않았습니다..";
			url = "/dog/board2/wirte.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "include/alert";
	}
	@RequestMapping("/board2/view.do")
	public String board2View(Model model, @RequestParam("board_num") int board_num, @RequestParam("page") String page) {
		Board2VO data = board2Service.board2Detail(board_num);	// 서비스 호출
		model.addAttribute("data", data);
		model.addAttribute("page", page);
		return "board/board2_view";
	}
	
	@RequestMapping("board2/edit.do")
	public String board2ModifyForm(Model model, @RequestParam("board_num") int board_num) {
		Board2VO vo = board2Service.board2View(board_num);
		model.addAttribute("vo", vo);
		
		return "board/board2_edit";
		
	}
	@RequestMapping("board2/update.do")
	public String board2Update(Model model,Board2VO vo) {
		int r = board2Service.board2Update(vo);
		String msg = "";
		String url = "";
		if( r > 0) {
			msg = "정상적으로 수정되었습니다.";
			url = "index.do?page="+vo.getPage();
		}else {
			msg = "수정 중 에러가 발생했습니다. 관리자에게 문의하세요.";
			url = "edit.do?board_num="+vo.getBoard_num();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "include/alert";
		//return "redirect:index.do?page="+vo.getPage();
	}
	//삭제 폼
	@RequestMapping("board2/deleteForm.do")
	public String board2DeleteForm(Model model, Board2VO vo) {
		model.addAttribute("vo",vo);
		return "board/board2_deleteForm";
	}
	//삭제 처리
	@RequestMapping("board2/delete.do")
	public String board2Delete(Model model, Board2VO vo) {
		//비밀번호가 맞는지 확인(db에서 데이터 조회, 사용자가 입력한 비밀번호가 같은지 확인)
		Board2VO data = board2Service.board2View(vo.getBoard_num());
		//db의 비밀번호 : data.getBoard_pass()가 안에 있음
		//사용자가 입력한 비밀번호 : vo.getBoard_pass()
		String msg = "";
		String url = "";
		if(data.getBoard_pass().equals(vo.getBoard_pass())) { //같은지 비교
			//비밀번호가 일치
			board2Service.board2Delete(vo.getBoard_num());
			msg = "정상적으로 삭제되었습니다.";
			url = "index.do?page="+vo.getPage();
		}else {
			//비밀번호가 틀림
			msg = "비밀번호가 올바르지 않습니다.";
			url = "deleteForm.do?page="+vo.getBoard_num()+"&page="+vo.getPage();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "include/alert";
	}
	@RequestMapping("board2/replyForm.do")
	public String replyForm(Model model, Board2VO vo) {
		Board2VO data = board2Service.board2View(vo.getBoard_num());
		model.addAttribute("data",data);
		model.addAttribute("vo",vo);
		
		return "board/board2_reply";
	}
	@RequestMapping("/board2/replyProcess.do")
	public String replyProcess(Model model, Board2VO vo) {
		int r = board2Service.replyProcess(vo);
		String msg = "";
		String url = "";
		if( r > 0) {
			msg = "답변이 저장되었습니다.";
			url = "index.do?page="+vo.getPage();
		}else {
			msg = "답변 저장실패";
			url = "replyForm.do?board_num="+vo.getBoard_num()+"&page="+vo.getPage();
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "include/alert";
		
	}
}

	