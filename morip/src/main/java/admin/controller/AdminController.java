package admin.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.MonthDTO;
import admin.bean.TodayDTO;
import admin.bean.WeekDTO;
import admin.service.AdminService;
import matzip.bean.MatzipDTO;


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
	
	// 맛집 등록하기
	@RequestMapping(value="/admin/writematzip",method = RequestMethod.POST)
	@ResponseBody
	public void writematzip(@ModelAttribute MatzipDTO matzipDTO, @RequestParam Map<String,String> map,@RequestParam String matzipTitle,@RequestParam String matzipCategory,@RequestParam String matzipTelephone,@RequestParam String matzipRoadaddress,@RequestParam String matzipAddress,
			@RequestParam String matzipTime,@RequestParam String matzipLink, @RequestParam(value = "image") MultipartFile matzipImage) {
		
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString() + "_" + matzipImage.getOriginalFilename();
		String filePath = "E:\\spring\\gihwan\\morip\\morip\\src\\main\\webapp\\image\\matzip\\";
		File file = new File(filePath,fileName);
		try {
			FileCopyUtils.copy(matzipImage.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		matzipDTO.setImage1(fileName);
		matzipDTO.setImage2(fileName);
		matzipDTO.setImage3(fileName);
		matzipDTO.setImage4(fileName);
		matzipDTO.setTitle(matzipTitle);
		matzipDTO.setCategory(matzipCategory);
		matzipDTO.setLink(matzipLink);
		matzipDTO.setTelephone(matzipTelephone);
		matzipDTO.setRoadAddress(matzipRoadaddress);
		matzipDTO.setAddress(matzipAddress);
		matzipDTO.setTime(matzipTime);
		
		System.out.println(matzipDTO.getTitle());
		map.put("matzipTitle",matzipDTO.getTitle());
		map.put("matzipCategory",matzipDTO.getCategory());
		map.put("matzipLink",matzipDTO.getLink());
		map.put("matzipTelephone",matzipDTO.getTelephone());
		map.put("matzipRoadaddress",matzipDTO.getRoadAddress());
		map.put("matzipAddress",matzipDTO.getAddress());
		map.put("matzipTime",matzipDTO.getTime());
		map.put("matzipImage",matzipDTO.getImage1());		
		
		adminService.writematzip(map);		
	}
	
	// 공지 등록하기
	@RequestMapping(value = "/admin/communityWrite", method = RequestMethod.POST)
	@ResponseBody
	public void communityWrite(@RequestParam Map<String, String> map, HttpSession session) {
		String nickname = (String) session.getAttribute("nickname");
		String email = (String) session.getAttribute("memEmail");
		String image = (String) session.getAttribute("image");
		map.put("nickname", nickname);
		map.put("email", email);
		map.put("image", image);
		adminService.communityWrite(map);
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

}
