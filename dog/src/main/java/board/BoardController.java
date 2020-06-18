package board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/index.do")
	public String boardList(Model model, BoardVO vo){
		model.addAttribute(vo);
		
				return "board/qna_board_list";
	}
}
