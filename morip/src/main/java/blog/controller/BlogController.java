package blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="blog")
public class BlogController {
	
	// 블로그 리스트 이동
	@RequestMapping(value="blogList", method=RequestMethod.GET)
	public String blogList(Model model) {
		model.addAttribute("display", "/resources/blog/blogList.jsp");
		return "/resources/main/index";
	}
}
