package admin.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.MonthDTO;
import admin.bean.TodayDTO;
import admin.bean.WeekDTO;
import admin.service.AdminService;
import member.bean.MemberDTO;


@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
  
	@RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int man = adminService.totalMan();		
		int woman = adminService.totalWoman();	
		WeekDTO weekDTO = adminService.getWeekData();
		MonthDTO monthDTO = adminService.getMonthData();
		mav.addObject("man", man);
		mav.addObject("woman", woman);
		mav.addObject("weekDTO", weekDTO);
		mav.addObject("monthDTO", monthDTO);
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
	
	// 관리자 페이지 메인 일일방문자, 게시판 작성, 블로그작성, 회원가입, 회원탈퇴
	@RequestMapping(value = "/admin/dashboard", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView dashboard() {
		// DB
		TodayDTO todayDTO = adminService.dashboard();
		ModelAndView mav = new ModelAndView();
		mav.addObject("todayDTO", todayDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 전체 회원수 뽑아오기
	@RequestMapping(value = "/admin/totalmember", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView totalmember() {
		// DB
		int totalmember = adminService.totalmember();		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalmember", totalmember);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 전체 블로그수 뽑아오기
	@RequestMapping(value = "/admin/totalblog", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView totalblog() {
		// DB
		int totalblog = adminService.totalblog();		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalblog", totalblog);
		mav.setViewName("jsonView");
		return mav;
	}	
	
	// 전체 게시판수 뽑아오기 공지제외!
	@RequestMapping(value = "/admin/totalboard", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView totalboard() {
		// DB
		int totalboard = adminService.totalboard();		
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalboard", totalboard);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 전체 맛집수 뽑아오기
	@RequestMapping(value = "/admin/totalmatzip", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView totalmatzip() {
		// DB
		int totalmatzip = adminService.totalmatzip();
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalmatzip", totalmatzip);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/admin/getWeekData", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getWeekData() {
		// DB
		WeekDTO weekDTO = adminService.getWeekData();
		ModelAndView mav = new ModelAndView();
		mav.addObject("weekDTO", weekDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 회원리스트
	@RequestMapping(value = "/admin/getMemberList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getMemberList() {
		List<MemberDTO> list =  adminService.getMemberList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 회원삭제
	@RequestMapping(value="/admin/deleteMember", method=RequestMethod.POST)
	@ResponseBody
	public String deleteMember(@RequestParam int seq) {
		adminService.deleteMember(seq);
		return "../admin/memberDB";
	}
	
	// 공지사항리스트
	@RequestMapping(value = "/admin/getBoardList", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getBoardList(@RequestParam String nickname) {
		List<MemberDTO> list =  adminService.getBoardList(nickname);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 공지사항삭제
		@RequestMapping(value="/admin/deleteBoard", method=RequestMethod.POST)
		@ResponseBody
		public String deleteBoard(@RequestParam int seq) {
			adminService.deleteBoard(seq);
			return "../admin/communityDB";
		}
}
