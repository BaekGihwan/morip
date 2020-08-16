package serviceCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceCenterController {
	@RequestMapping(value="/serviceCenter/serviceCenterList", method=RequestMethod.GET)
	public String boardList(Model model) {
		model.addAttribute("display", "/resources/serviceCenter/serviceCenterList.jsp");
		return "/resources/main/index";
	}
}
