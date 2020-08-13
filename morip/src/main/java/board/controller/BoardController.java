package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@RequestMapping(value="/board/boardList", method=RequestMethod.GET)
	public String boardList(Model model) {
		model.addAttribute("display", "/resources/board/boardList.jsp");
		return "/resources/main/index";
	}
}
