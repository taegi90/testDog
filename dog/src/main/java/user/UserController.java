package user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/user/join.do")
	public String join() {
		return "user/join";
	}
	
	@RequestMapping("/user/idCheck.do")
	public String idCheck(Model model, @RequestParam("id") String id) {
		int cnt = userService.idCheck(id);
		model.addAttribute("value", cnt);
		return "include/return";
	}
	
	@RequestMapping("/user/joinProcess.do")
	public String insert(Model model, UserVO vo) {
		int r = userService.insert(vo);
		String msg = "";
		String url = "";
		if (r > 0) {
			msg = "정상적으로 가입되었습니다.";
			url = "/dog/board2/index.do";
		} else {
			msg = "회원가입 실패";
			url = "/dog/user/joinForm.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "include/alert";
	}
	
	
	
}
