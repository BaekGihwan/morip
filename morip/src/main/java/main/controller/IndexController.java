package main.controller;

import java.util.Calendar;

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
			Calendar cal = Calendar.getInstance();
			
			String dayOfWeek="";
			if(cal.get(Calendar.DAY_OF_WEEK)==1) {
				dayOfWeek="sun";
			}else if(cal.get(Calendar.DAY_OF_WEEK)==2) {
				dayOfWeek="mon";
			}else if(cal.get(Calendar.DAY_OF_WEEK)==3) {
				dayOfWeek="tue";
			}else if(cal.get(Calendar.DAY_OF_WEEK)==4) {
				dayOfWeek="wed";
			}else if(cal.get(Calendar.DAY_OF_WEEK)==5) {
				dayOfWeek="thur";
			}else if(cal.get(Calendar.DAY_OF_WEEK)==6) {
				dayOfWeek="fri";
			}else if(cal.get(Calendar.DAY_OF_WEEK)==7) {
				dayOfWeek="sat";
			}
			adminService.countWeek(dayOfWeek);
			
			String month="";
			if(cal.get(Calendar.MONTH)==0) {
				month="jan";
			}else if(cal.get(Calendar.MONTH)==1) {
				month="feb";
			}else if(cal.get(Calendar.MONTH)==2) {
				month="mar";
			}else if(cal.get(Calendar.MONTH)==3) {
				month="apr";
			}else if(cal.get(Calendar.MONTH)==4) {
				month="may";
			}else if(cal.get(Calendar.MONTH)==5) {
				month="jun";
			}else if(cal.get(Calendar.MONTH)==6) {
				month="jul";
			}else if(cal.get(Calendar.MONTH)==7) {
				month="aug";
			}else if(cal.get(Calendar.MONTH)==8) {
				month="sep";
			}else if(cal.get(Calendar.MONTH)==9) {
				month="oct";
			}else if(cal.get(Calendar.MONTH)==10) {
				month="nov";
			}else if(cal.get(Calendar.MONTH)==11) {
				month="dec";
			}
			adminService.countMonth(month);
		}
		model.addAttribute("display", "/resources/template/main.jsp");
		return "/resources/main/index";
	}
}
