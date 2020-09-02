package main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import admin.service.AdminService;

@Controller
@Component
public class IndexController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/main/index", method=RequestMethod.GET)
	public String index(Model model, HttpSession session) {
		String memEmail = (String) session.getAttribute("memEmail");		
		if(memEmail == null) {
			// 방문객수 증가
			adminService.countEnter();
		}
		model.addAttribute("display", "/resources/template/main.jsp");
		return "/resources/main/index";
	}
}
