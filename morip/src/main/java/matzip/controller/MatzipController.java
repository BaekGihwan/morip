package matzip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import matzip.bean.MatzipDTO;
import matzip.bean.MatzipImageDTO;
import matzip.service.MatzipService;
import myblog.bean.MyblogDTO;

@Controller
@RequestMapping("matzip") /* 매번 /member/login처럼 /member를 붙일 필요가 없어진다 */
public class MatzipController {
	@Autowired
	private MatzipService matzipService;
	
	// 맛집 리스트 보여주기
	@RequestMapping(value="matzipListShow",method=RequestMethod.GET)
	public String matzipListShow(Model model) {
		model.addAttribute("display", "/resources/matzip/matzipList.jsp");
		return "/resources/main/index";
	}
	
	@RequestMapping(value="matzipList",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView matzipList(@RequestParam String pg, @RequestParam String address) {
		List<MatzipDTO> list =matzipService.matzipList(Integer.parseInt(pg), address);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="matzipView",method=RequestMethod.GET)
	public String test2(@RequestParam String title, Model model) {
//		model.addAttribute("display", "/board/boardWriteForm.jsp");
		model.addAttribute("title", title);
		//return "/matzip/matzipView";
		model.addAttribute("display", "/resources/matzip/matzipView.jsp");
		return "/resources/main/index";
	}
	
	@RequestMapping(value="getMatzipView",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMatzipView(@RequestParam String title) {
		MatzipDTO matzipDTO =matzipService.getMapzipView(title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("matzip", matzipDTO);
		mav.setViewName("jsonView");
		return mav;
		
	}
	
	@RequestMapping(value="matzipSearch",method=RequestMethod.POST)
	   @ResponseBody
	   public ModelAndView matzipSearch(@RequestParam(value="matzipText") String matzipText) {
	      List<MatzipDTO> list = matzipService.matzipSearch(matzipText);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("list",list);
	      mav.setViewName("jsonView");	      
	      return mav;
	}
	
	@RequestMapping(value="getMatzipView2",method=RequestMethod.POST)
	   @ResponseBody
	   public ModelAndView getMatzipView2(@RequestParam String title) {
		MatzipDTO matzipDTO =matzipService.getMapzipView2(title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("matzip", matzipDTO);
		mav.setViewName("jsonView");
		return mav;
	   }
	
	@RequestMapping(value="infinityScroll",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView infinityScroll(@RequestParam String pg) {
		
		List<MatzipDTO> list = matzipService.matzipAllList(Integer.parseInt(pg));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		//model.addAttribute("display", "/board/boardList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/matzipImage",method=RequestMethod.POST)
    @ResponseBody
    public ModelAndView matzipImage(@RequestParam(value="matzipTitle") String matzipTitle) { 
    List<MatzipImageDTO> list = matzipService.matzipImage(matzipTitle);
    
    ModelAndView mav = new ModelAndView();
    mav.addObject("list",list);
    mav.setViewName("jsonView");
    return mav;
	}
	
	// 메인창에 맛집 3개 뿌려주기
	@RequestMapping(value="matzipThreeList", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView matzipThreeList() {
		List<MatzipDTO> list = matzipService.matzipThreeList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;		
	}
	
	@RequestMapping(value="/getMatzipReview",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMatzipReview(@RequestParam String title, @RequestParam String pg) {
		
		List<MyblogDTO> list = matzipService.getMatzipReview(title,Integer.parseInt(pg));
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="getReviewCount",method=RequestMethod.POST)
	@ResponseBody
	public String getReviewCount(@RequestParam String keyword) {
		return matzipService.getReviewCount(keyword);
	}
	
	@RequestMapping(value="updateReviewCount",method=RequestMethod.POST)
	@ResponseBody
	public void updateReviewCount(@RequestParam String title, @RequestParam String reviewCount) {
		matzipService.updateReviewCount(title, reviewCount);
	}
	
}
