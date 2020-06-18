package board2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import util.FileUtil;

@Service
public class Board2Service {

	// 의존객체 자동 주입
	@Autowired
	Board2DAO board2DAO;

	public List<Board2VO> board2Index(Board2VO vo) {

		List<Board2VO> list = board2DAO.list(vo);
		return list;
	}

	public int[] board2Count() {
		int listcount = board2DAO.count(); // 전체 갯수
		int totalpage = listcount / 10; // 총페이지수
		if (listcount % 10 > 0)
			totalpage++;

		int[] pagecount = new int[2];
		pagecount[0] = listcount;
		pagecount[1] = totalpage;

		return pagecount;
	}

	// 파일유틸에서 파일객체와 파일경로를 받아오기에 파라미터가 추가
	// 처리하는 걸 호출하면됨
	public int board2Insert(Board2VO vo, MultipartFile file, String uploadPath) {
		// 파일 업로드 처리
		FileUtil f = new FileUtil();// 객체생성
		f.fileUpload(file, uploadPath);// 호출만 하면 자동
		// 이름을 셋
		vo.setBoard_file(f.fileName);// 해당파일명을 넣어줌 내가첨부한 파일이름

		int r = board2DAO.insert(vo);
		// insert 쿼리 실행 후에 vo객체 board_num필드값이 방금 저장된 pk값
		board2DAO.refUpdate(r); // update 추가
		return r;
	}
	public Board2VO board2Detail(int board_num) {
		// 조회수 증가
		board2DAO.updateReadcount(board_num);
		return board2DAO.view(board_num);
	}
	
	public Board2VO board2View(int board_num) {
		Board2VO vo = board2DAO.view(board_num);
		return vo;
	}

	public int board2Update(Board2VO param) {
		
		return board2DAO.update(param);
	}
	public int board2Delete(int board_num) {
		int r = board2DAO.delete(board_num); //이 메서드 안에서 지역변수 사용 보드 넘의 값이 들어옴 서비스와 같을 필요없음
		return r;
	}
	public int replyProcess(Board2VO vo) {
		//원글의 seq보다 크고 ref가 같은 모든 글을 seq+1을 해줘야 함.
		//vo에다가 ref=원글의 ref를, lev=원글의 lev+1, seq=원글의 seq+1을 
		//insert해주면 됨.
		 board2DAO.replySeq(vo);
		// lev , seq 1증가     ref는 jsp 있기에 자동으로 들어옴 
		vo.setBoard_re_lev(vo.getBoard_re_lev()+1);
		vo.setBoard_re_seq(vo.getBoard_re_seq()+1);
		
		return board2DAO.replyInsert(vo);
		
	}
	
}
