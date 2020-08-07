package main.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Component
public class IndexController {
	@RequestMapping(value="/main/index", method=RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("display", "/template/main.jsp");
		return "/main/index";
	}
}
