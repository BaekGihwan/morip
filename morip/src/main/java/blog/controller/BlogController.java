package blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import blog.service.BlogService;
import hashtag.bean.HashtagDTO;
import hashtag.service.HashtagService;
import myblog.bean.MyblogDTO;

@Controller
@RequestMapping(value="blog")
public class BlogController {
	@Autowired
	BlogService blogService;
	
	@Autowired
	HashtagService hashtagService;
	
	// 블로그 리스트 이동
	@RequestMapping(value="blogList", method=RequestMethod.GET)
	public String blogList(Model model) {
		model.addAttribute("display", "/resources/blog/blogList.jsp");
		return "/resources/main/index";
	}
	
	// 블로그 인피니티스크롤
	@RequestMapping(value="infinityScroll", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView infinityScroll(@RequestParam String pg, @RequestParam String content) {
		
		List<MyblogDTO> list = blogService.blogAllList(Integer.parseInt(pg), content);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//해쉬태그 검색
	@RequestMapping(value="hashtagSearch",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView hashtagSearch(@RequestParam(value="hashtagText") String hashtagText) {
		
		List<HashtagDTO> list = hashtagService.hashtagSearch(hashtagText);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
	
		return mav;
		
	}
	
	//해쉬태그 검색 리스트 뿌려주기
	@RequestMapping(value="hashtagBlogList",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView blogBoardSearchList(@RequestParam(value="ar[]") String[] ar) {
		
		List<MyblogDTO> list = hashtagService.hastagBlogList(ar);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
}
