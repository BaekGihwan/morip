package admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {
	@RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/admin/dashboard");
		return mav;
	}
	
	@RequestMapping(value = "/admin/matzipWriteForm", method = RequestMethod.GET)
	public ModelAndView matzipWriteForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/admin/matzipWriteForm");
		return mav;
	}
	
	@RequestMapping(value = "/admin/matzipDB", method = RequestMethod.GET)
	public ModelAndView matzipDB(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/admin/matzipDB");
		return mav;
	}
	
	@RequestMapping(value = "/admin/blogDB", method = RequestMethod.GET)
	public ModelAndView blogDB(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/admin/blogDB");
		return mav;
	}
	
	@RequestMapping(value = "/admin/communityDB", method = RequestMethod.GET)
	public ModelAndView communityDB(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/admin/communityDB");
		return mav;
	}
	
	@RequestMapping(value = "/admin/communityWriteForm", method = RequestMethod.GET)
	public ModelAndView communityWriteForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/admin/communityWriteForm");
		return mav;
	}
	
	@RequestMapping(value = "/admin/memberDB", method = RequestMethod.GET)
	public ModelAndView memberDB(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/admin/memberDB");
		return mav;
	}
}
