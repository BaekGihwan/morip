package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	@RequestMapping(value="/admin/adminMain", method=RequestMethod.GET)
	public String adminMain(Model model) {
		model.addAttribute("display", "/resources/admin/adminMain.jsp");
		return "/resources/main/index";
	}
}
