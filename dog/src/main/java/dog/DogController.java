package dog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;




@Controller
public class DogController {

	@Autowired
	DogService dogService;
	
	
	@RequestMapping("/dog/list.do")
	public String list(Model model) {
	List<DogVO> list = dogService.dogList();
	model.addAttribute("dogList",list);
		return "dog/dogList";
	}
	@RequestMapping("/dog/registForm.do")
	public String registForm(Model model) {
		return "dog/dogRegistForm";
	}
	@RequestMapping("/dog/insert.do")
	public String insert(DogVO vo, @RequestParam("image_tmp") MultipartFile file, HttpServletRequest request) {
		dogService.dogInsert(vo, file, request);
		return "redirect:/dog/list.do";
	}
	@RequestMapping("/dog/dogView.do")
	public String dogView(Model model,@RequestParam("id") int id) {
		DogVO vo = dogService.dogView(id);
		model.addAttribute("vo", vo);
		return "dog/dogView";
	}
	
	
}
