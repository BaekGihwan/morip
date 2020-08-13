package myblog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import myblog.bean.MyblogDTO;
import myblog.service.MyblogService;

@Controller
public class MyblogController {
	@Autowired
	public MyblogService myblogService;
	//mypage 부분
	/*
	@RequestMapping(value="/myblog/mypage", method=RequestMethod.GET)
	public ModelAndView mypage() {
		System.out.println("mypage 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myblog/mypage"); 
		return mav;
	}
	*/
	
	@RequestMapping(value="/myblog/mypage", method=RequestMethod.GET)
	public String mypage(Model model) {
		model.addAttribute("display", "/resources/myblog/mypage.jsp");
		return "/resources/main/index";
	}
	
	
	@RequestMapping(value="/myblog/infinityScroll", method=RequestMethod.POST)
	public ModelAndView infinityScroll(Model model, int pg) {
		System.out.println("infinityScroll 실행됨"+pg);
		int endNum = pg * 9;
		int startNum = endNum - 8;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);

		List <MyblogDTO> list = myblogService.infinityScroll(map);
		System.out.println(list.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		
		return mav;
	}
	//writeBlog 부분
	@RequestMapping(value="/myblog/writeBlog", method=RequestMethod.GET)
	public ModelAndView writeBlog() {
		System.out.println("writeBlog 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myblog/writeBlog"); 
		return mav;
	}
	
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite1", method=RequestMethod.GET)
	public ModelAndView travlesWrite1() {
		System.out.println("travlesWrite1 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myblog/travlesWrite1"); 
		return mav;
	}
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite2", method=RequestMethod.GET)
	public ModelAndView travlesWrite2() {
		System.out.println("travlesWrite2 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myblog/travlesWrite2"); 
		return mav;
	}
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite3", method=RequestMethod.GET)
	public ModelAndView travlesWrite3() {
		System.out.println("travlesWrite3 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myblog/travlesWrite3"); 
		return mav;
	}
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite4", method=RequestMethod.GET)
	public ModelAndView travlesWrite4() {
		System.out.println("travlesWrite4 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/myblog/travlesWrite4"); 
		return mav;
	}
}
