package myblog.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hashtag.bean.HashtagDTO;
import hashtag.service.HashtagService;
import member.bean.MemberDTO;
import member.service.MemberService;
import myblog.bean.FollowDTO;
import myblog.bean.LikeDTO;
import myblog.bean.MyblogDTO;
import myblog.service.MyblogService;

@Controller
public class MyblogController {
	@Autowired
	private MyblogService myblogService;
	@Autowired
	private HashtagService hashtagService;
	@Autowired
	private MemberService memberService;

	/********************* mypage.jsp ***********************/
	@RequestMapping(value = "/myblog/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model, @RequestParam(value = "nickname") String nickname,
			HttpServletResponse response) {
		// 쿠키
		if (nickname != null) {
			Cookie cookie = new Cookie("memHit", "ok");
			cookie.setMaxAge(30 * 60);
			cookie.setPath("/");
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// DB 에서 해당 유저에 대한 정보 및 작성한 모든 글 호출.
		MemberDTO memberDTO = myblogService.loadMember(nickname);
		// 배경 사진이 등록되지 않았을 경우

		if (memberDTO.getImage().equals("0")) {
			// 프로필사진이 비어있을 경우
			memberDTO.setImage("basicUserImg.png");
		} // 배경사진이 비어있을 경우
		if (memberDTO.getBackimage().equals("0")) {
			memberDTO.setBackimage("basicBgImg.jpg");
		}

		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("pageNickname", nickname);
		model.addAttribute("memEmail", (String) session.getAttribute("memEamil"));
		model.addAttribute("display", "/resources/myblog/mypage.jsp");
		return "/resources/main/index";
	}

	@RequestMapping(value = "/myblog/infinityScroll", method = RequestMethod.POST)
	public ModelAndView infinityScroll(Model model, @RequestParam(value = "pg") String pg,
			@RequestParam(value = "email") String email) {
		int endNum = Integer.parseInt(pg) * 9;
		int startNum = endNum - 8;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("endNum", endNum);
		map.put("startNum", startNum);
		map.put("email", email);

		List<MyblogDTO> list = myblogService.infinityScroll(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pg", pg);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/boardSize", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView boardSize(@RequestParam String email) {
		int size = myblogService.boardSize(email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("size", size);
		mav.setViewName("jsonView");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/myblog/bgImageSave", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String bgImageSave(HttpSession session, @RequestParam MultipartFile backgroundImg) {
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString() + "_" + backgroundImg.getOriginalFilename();
		String filePath = "E:\\spring\\gihwan\\morip\\morip\\src\\main\\webapp\\storage";
		String filePath2 = "E:\\spring\\gihwan\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\morip\\storage";
		File file = new File(filePath,fileName);
		File file2 = new File(filePath2,fileName);
		try {
			FileCopyUtils.copy(backgroundImg.getInputStream(), new FileOutputStream(file));
			FileCopyUtils.copy(backgroundImg.getInputStream(), new FileOutputStream(file2));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		fileName = file.getName();
		// memberTable 안에 베경 이미지 이름 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", (String) session.getAttribute("memEmail"));
		map.put("backimage", fileName);
		myblogService.updateBgImg(map);
		return fileName;
	}

	/*********************** writeBlog 부분(에세이 작성) **********************/
	@RequestMapping(value = "/myblog/writeBlog0", method = RequestMethod.GET)
	public ModelAndView writeBlog(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/main/index");
		mav.addObject("display", "/resources/myblog/writeBlog0.jsp");
		return mav;
	}

	@RequestMapping(value = "/myblog/writeBlog1", method = RequestMethod.GET)
	public ModelAndView writeBlog1(HttpSession session, @RequestParam(value = "startdate") String startdate,
			@RequestParam(value = "enddate") String enddate) throws ParseException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/main/index");
		mav.addObject("startdate", startdate);
		mav.addObject("enddate", enddate);
		mav.addObject("display", "/resources/myblog/writeBlog1.jsp");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/myblog/imageSave", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String imageSave(HttpSession session, @RequestParam(value = "backgroundImg") MultipartFile backgroundImg) {
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString() + "_" + backgroundImg.getOriginalFilename();
		String filePath = "E:\\spring\\gihwan\\morip\\morip\\src\\main\\webapp\\storage";
		String filePath2 = "E:\\spring\\gihwan\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\morip\\storage";
		File file = new File(filePath,fileName);
		File file2 = new File(filePath2,fileName);
		try {
			FileCopyUtils.copy(backgroundImg.getInputStream(), new FileOutputStream(file));
			FileCopyUtils.copy(backgroundImg.getInputStream(), new FileOutputStream(file2));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		fileName = file.getName();
		return fileName;
	}

	@RequestMapping(value = "/myblog/writeBlog2", method = RequestMethod.GET)
	public ModelAndView writeBlog2(HttpSession session, @RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("subject", map.get("subject"));
		mav.addObject("fileName", map.get("fileName"));
		mav.addObject("startdate", map.get("startdate"));
		mav.addObject("enddate", map.get("enddate"));
		mav.setViewName("/resources/main/index");
		mav.addObject("display", "/resources/myblog/writeBlog2.jsp");
		return mav;
	}

	/* 작성한 글 저장 */
	@ResponseBody
	@RequestMapping(value = "/myblog/save", method = { RequestMethod.POST })
	public void saveWriteBlog(HttpSession session, @RequestBody HashMap<String, String> map) {
		map.put("nickname", (String) session.getAttribute("nickname"));
		map.put("email", (String) session.getAttribute("memEmail"));
		String content = map.get("content");
		map.replace("content", content);
		myblogService.insertWriteBlog(map);
		if (map.get("hashtag") != null) {
			hashtagService.insertHashTag(map.get("hashtag"));
		}
	}

	@RequestMapping(value = "/myblog/imageUpload", method = { RequestMethod.POST })
	@ResponseBody
	public ModelAndView handleFileUpload(@RequestParam("file") MultipartFile file) throws IOException {
		UUID uid = UUID.randomUUID();
		String fileName=uid.toString() + "_" + file.getOriginalFilename();
		String filePath = "E:\\spring\\gihwan\\morip\\morip\\src\\main\\webapp\\storage";
		String filePath2 = "E:\\spring\\gihwan\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\morip\\storage";
		File file1 = new File(filePath,fileName);
		File file2 = new File(filePath2,fileName);
		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(file1));
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(file2));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", "../storage/" + file1.getName());
		mav.addObject("fileName" + fileName);
		mav.setViewName("jsonView");
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	// *********************view 부분*****************************
	@RequestMapping(value = "/myblog/view", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam(value = "seq") String seq, HttpSession session,
			@CookieValue(value = "memHit", required = false) Cookie cookie, HttpServletResponse response) {
		// 쿠키 - 조회수 증가
		if (cookie != null) {
			myblogService.boardHit(seq); // 조회수 증가

			// 쿠키삭제
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		MyblogDTO myblogDTO = myblogService.viewPage(Integer.parseInt(seq));
		MemberDTO memberDTO = memberService.checkNickname(myblogDTO.getNickname());
		ModelAndView mav = new ModelAndView();
		mav.addObject("myblogDTO", myblogDTO);
		mav.addObject("memberDTO", memberDTO);
		mav.addObject("nickname", (String) session.getAttribute("nickcname"));
		mav.addObject("seq", seq);
		mav.setViewName("/resources/main/index");
		mav.addObject("display", "/resources/myblog/view.jsp");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/myblog/deleteBlogBoard", method = RequestMethod.GET)
	public void deleteBlogBoard(@RequestParam Map<String, String> map) {
		myblogService.deleteBlogBoard(map);
	}

	@RequestMapping(value = "/myblog/insertReply", method = { RequestMethod.POST })
	public @ResponseBody void insertReply(HttpSession session, @RequestParam Map<String, String> map) {
		map.put("nickname", (String) session.getAttribute("nickname"));
		map.put("email", (String) session.getAttribute("memEmail"));
		myblogService.insertReply(map);
	}

	@RequestMapping(value = "/myblog/loadReply", method = { RequestMethod.POST })
	public ModelAndView loadReply(HttpSession session, @RequestParam(value = "ref") String ref) {
		ModelAndView mav = new ModelAndView();
		List<MyblogDTO> list = myblogService.loadReply(Integer.parseInt(ref));
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/selectReply", method = RequestMethod.GET)
	public ModelAndView selectReply(@RequestParam(value = "seq") String seq) {
		MyblogDTO myblogDTO = myblogService.viewPage(Integer.parseInt(seq));
		ModelAndView mav = new ModelAndView();
		mav.addObject("myblogDTO", myblogDTO);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/updateReply", method = { RequestMethod.GET })
	public @ResponseBody void updateReply(HttpSession session, @RequestParam Map<String, String> map) {
		myblogService.updateReply(map);
	}

	@RequestMapping(value = "/myblog/boardWriteCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView boardWriteCheck(@RequestParam Map<String, String> map, HttpSession session) {
		MyblogDTO myblogDTO = myblogService.boardWriteCheck(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memEmail", (String) session.getAttribute("memEmail"));
		mav.addObject("myblogDTO", myblogDTO);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/like", method = RequestMethod.POST)
	@ResponseBody
	public void like(@RequestParam Map<String, String> map) {
		myblogService.like(map);
	}

	@RequestMapping(value = "/myblog/unlike", method = RequestMethod.POST)
	@ResponseBody
	public void unlike(@RequestParam Map<String, String> map) {
		myblogService.unlike(map);
	}

	@RequestMapping(value = "/myblog/likeCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView likeCheck() {
		List<LikeDTO> list = myblogService.likeCheck();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/likeViewCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView likeViewCheck(@RequestParam Map<String, String> map, HttpSession session) {
		String memEmail = (String) session.getAttribute("memEmail");
		map.put("memEmail", memEmail);
		LikeDTO likeDTO = myblogService.likeViewCheck(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("likeDTO", likeDTO);
		mav.addObject("memEmail", memEmail);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/likeSize", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView likeSize(@RequestParam Map<String, String> map) {
		int likeSize = myblogService.likeSize(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("likeSize", likeSize);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/likeListSize", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView likeListSize() {
		List<MyblogDTO> list = myblogService.likeListSize();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/follow", method = RequestMethod.POST)
	@ResponseBody
	public void follow(@RequestParam Map<String, String> map) {
		myblogService.follow(map);
	}

	@RequestMapping(value = "/myblog/unfollow", method = RequestMethod.POST)
	@ResponseBody
	public void unfollow(@RequestParam Map<String, String> map) {
		myblogService.unfollow(map);
	}

	@RequestMapping(value = "/myblog/followCheck", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView followCheck(@RequestParam Map<String, String> map, HttpSession session) {
		FollowDTO followDTO = myblogService.followCheck(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("followDTO", followDTO);
		mav.addObject("email", (String) session.getAttribute("memEmail"));
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/followClick", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView followClick(@RequestParam String email) {
		List<FollowDTO> list = myblogService.followClick(email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/followingClick", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView followingClick(@RequestParam String follow_email) {
		List<FollowDTO> list = myblogService.followingClick(follow_email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/followerSize", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView followerSize(@RequestParam String follow_email) {
		int size = myblogService.followerSize(follow_email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("size", size);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/followingSize", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView followingSize(@RequestParam String email) {
		int size = myblogService.followingSize(email);
		ModelAndView mav = new ModelAndView();
		mav.addObject("size", size);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "/myblog/replySize", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView replySize(@RequestParam String seq) {
		int size = myblogService.replySize(seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("size", size);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/myblog/loadHashtagList", method = { RequestMethod.POST })
	public ModelAndView loadHashtagList(@RequestParam(value = "seq") String seq) {
		ModelAndView mav = new ModelAndView();
		List<HashtagDTO> list = myblogService.loadHashtag(seq);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	/**********************************
	 * modifyForm.jsp
	 **************************************/
	@RequestMapping(value = "/myblog/modifyForm", method = RequestMethod.GET)
	public ModelAndView modifyForm(@RequestParam(value = "seq") String seq, HttpSession session) {
		MyblogDTO myblogDTO = myblogService.viewPage(Integer.parseInt(seq));
		ModelAndView mav = new ModelAndView();
		mav.addObject("myblogDTO", myblogDTO);
		mav.addObject("nickname", (String) session.getAttribute("nickcname"));
		mav.addObject("seq", seq);
		mav.setViewName("/resources/main/index");
		mav.addObject("display", "/resources/myblog/modifyForm.jsp");
		return mav;
	}

	/* 작성한 글 저장 */
	@RequestMapping(value = "/myblog/modify", method = { RequestMethod.POST })
	public @ResponseBody void modify(HttpSession session, @RequestBody HashMap<String, String> map)
			throws UnsupportedEncodingException {
		map.put("nickname", (String) session.getAttribute("nickname"));
		map.put("email", (String) session.getAttribute("memEmail"));
		String content = map.get("content");
		myblogService.modifyBoard(map);
		//해쉬태그 저장
		String hashtag = map.get("hashtag");
		myblogService.modifyHashtag(Integer.parseInt(map.get("seq")), hashtag);
	}
	
	/* 미리보기 preview.jsp */
	@RequestMapping(value = "/myblog/preview", method = RequestMethod.GET)
	public ModelAndView preview(HttpSession session, @RequestParam Map<String, String> map) {
		MemberDTO memberDTO = memberService.checkNickname((String)session.getAttribute("nickname"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("startdate", map.get("startdate"));
		mav.addObject("enddate", map.get("enddate"));
		mav.addObject("subject", map.get("subject"));
		mav.addObject("backgroundImg", map.get("backgroundImg"));
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("/resources/myblog/preview");
		return mav;
	}

	// 베스트작가 가져오기
	@RequestMapping(value="/myblog/bestWriter", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView bestWriter() {
		//베스트작가 가져오기
		List<String> list = myblogService.bestWriter();
		//베스트작가의 정보 불러오기
		MemberDTO memberDTO = memberService.getMember2(list.get(0));			
		ModelAndView mav = new ModelAndView();		
		mav.addObject("memberDTO", memberDTO);
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 베스트작가의 베스트글 3개 가져오기
	@RequestMapping(value="/myblog/bestTrip", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView bestTrip(@RequestParam String nickname) {			
		Map<String, String> map = new HashMap<String, String>();
		map.put("nickname", nickname);			
		map.put("startNum", "1");
		map.put("endNum", "3");			
		//베스트글 3개 가져오기
		List<MyblogDTO> list = myblogService.bestTrip(map);			
		ModelAndView mav = new ModelAndView();	
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
}
