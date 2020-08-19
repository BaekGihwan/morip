package myblog.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import hashtag.service.HashtagService;
import myblog.bean.FollowDTO;
import myblog.bean.LikeDTO;
import myblog.bean.MyblogDTO;
import myblog.service.MyblogService;

@Controller
public class MyblogController {
	@Autowired
	public MyblogService myblogService;
	
	@Autowired
	private HashtagService hashtagService;
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
	/***********************writeBlog 부분(에세이 작성)**********************/
	@RequestMapping(value="/myblog/writeBlog1", method=RequestMethod.GET)
	public ModelAndView writeBlog1(HttpSession session) {
		System.out.println("writeBlog1 들어옴");
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("/resources/main/index"); 
		mav.addObject("display", "/resources/myblog/writeBlog1.jsp");
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/myblog/imageSave", method=RequestMethod.POST)
	public String imageSave(HttpSession session,@RequestParam(value="backgroundImg") MultipartFile backgroundImg) {
		String nickname = (String) session.getAttribute("nickname");
		UUID uid = UUID.randomUUID();
		String fileName = uid.toString() + "_" + backgroundImg.getOriginalFilename();
		String filePath = "E:\\spring\\gihwan\\morip\\morip\\src\\main\\webapp\\storage\\";
		File file = new File(filePath,fileName);
		try {
			FileCopyUtils.copy(backgroundImg.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		fileName = file.getName();
		System.out.println("save 들어옴: "+nickname+","+fileName);
		System.out.println("실제폴더:"+filePath);
		return fileName;
	}
	@RequestMapping(value="/myblog/writeBlog2", method=RequestMethod.GET)
	public ModelAndView writeBlog2(HttpSession session , @RequestParam Map <String, String> map){
		System.out.println("writeBlog 접속 완료"+session.getAttribute("nickname")+map.get("fileName"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("subject", map.get("subject"));
		mav.addObject("fileName", map.get("fileName"));
		mav.setViewName("/resources/main/index"); 
		mav.addObject("display", "/resources/myblog/writeBlog2.jsp");
		return mav;
	}
	/*작성한 글 저장*/
	@RequestMapping(value="/myblog/save", method= {RequestMethod.POST})
	public @ResponseBody void saveWriteBlog(HttpSession session, @RequestParam Map <String , String> map) throws UnsupportedEncodingException {
		String email = (String) session.getAttribute("memEmail");
		String nickname = (String) session.getAttribute("nickname");
		
		map.put("email", email);
		map.put("nickname", nickname);

		String content = URLDecoder.decode(map.get("content"), "UTF-8");
		map.replace("content", content);
		System.out.println("작성자"+session.getAttribute("nickname"));
		System.out.println(map.get("subject")+","+map.get("content")+","+map.get("nickname"));
		myblogService.insertWriteBlog(map);
		hashtagService.insertHashTag(map.get("hashtag"));
		System.out.println("save 들어와서 저장하는 중...");
	}
	
	@RequestMapping(value="/myblog/imageUpload", method= {RequestMethod.POST})
    @ResponseBody
    public ModelAndView handleFileUpload(@RequestParam("file") MultipartFile file) throws IOException {
		UUID uid = UUID.randomUUID();
		String fileName=uid.toString() + "_" + file.getOriginalFilename();
		String filePath1 = "E:\\spring\\gihwan\\morip\\morip\\src\\main\\webapp\\storage\\";
		//String filePath2 = "D:\\spring\\MORIP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\MORIP_myblogTeam\\storage";
		File file1 = new File(filePath1,fileName);
		//File file2 = new File(filePath2,fileName);
		try {
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(file1));
			//FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(file2));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("getname()"+file1.getName());
		ModelAndView mav = new ModelAndView();
		mav.addObject("url","../storage/"+file1.getName());
		mav.addObject("fileName"+fileName);
		mav.setViewName("jsonView");
        try {
            //UploadFile uploadedFile = imageService.store(file);
            //return ResponseEntity.ok().body("../storage/"+file1.getName());
        } catch (Exception e) {
            e.printStackTrace();
            //return ResponseEntity.badRequest().build();s  
        }return mav;
    }
	
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite1", method=RequestMethod.GET)
	public ModelAndView travlesWrite1() {
		System.out.println("travlesWrite1 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/main/index"); 
		mav.addObject("display", "/resources/myblog/travlesWrite1.jsp");
		return mav;
	}
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite2", method=RequestMethod.GET)
	public ModelAndView travlesWrite2() {
		System.out.println("travlesWrite2 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/main/index"); 
		mav.addObject("display", "/resources/myblog/travlesWrite2.jsp");
		return mav;
	}
	
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite3", method=RequestMethod.GET)
	public ModelAndView travlesWrite3() {
		System.out.println("travlesWrite3 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/main/index"); 
		mav.addObject("display", "/resources/myblog/travlesWrite3.jsp");
		return mav;
	}
	
	//travlesWrite 부분
	@RequestMapping(value="/myblog/travlesWrite4", method=RequestMethod.GET)
	public ModelAndView travlesWrite4() {
		System.out.println("travlesWrite4 들어옴");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/resources/main/index"); 
		mav.addObject("display", "/resources/myblog/travlesWrite4.jsp");
		return mav;
	}
	
	//*********************view 부분*****************************
		@RequestMapping(value="/myblog/view", method=RequestMethod.GET)
		public ModelAndView view(@RequestParam(value="seq") String seq, HttpSession session) {
			System.out.println("view 들어옴");
			System.out.println(seq);
			MyblogDTO myblogDTO= myblogService.viewPage(Integer.parseInt(seq));
			ModelAndView mav = new ModelAndView();
			mav.addObject("myblogDTO", myblogDTO);
			System.out.println(myblogDTO.getStartdate());
			mav.addObject("nickname", (String) session.getAttribute("nickcname"));
			mav.addObject("seq", seq);
			mav.setViewName("/resources/main/index"); 
			mav.addObject("display", "/resources/myblog/view.jsp");
			return mav;
		}
		
		@ResponseBody
		@RequestMapping(value="/myblog/deleteBlogBoard", method=RequestMethod.GET)
		public void deleteBlogBoard(@RequestParam Map <String , String> map) {
			System.out.println("deleteBlogBoard 들어옴");
			myblogService.deleteBlogBoard(map);
		}
		
		@RequestMapping(value="/myblog/insertReply", method= {RequestMethod.POST})
		public @ResponseBody void insertReply(HttpSession session, @RequestParam Map <String , String> map) {
			map.put("email",(String)session.getAttribute("memEmail"));
			map.put("nickname", (String)session.getAttribute("nickname"));
			System.out.println("작성자"+session.getAttribute("email"));
			myblogService.insertReply(map);
			System.out.println("insertReply 들어와서 저장하는 중...");
		}
		
		@RequestMapping(value="/myblog/loadReply", method= {RequestMethod.POST})
		public ModelAndView loadReply(HttpSession session, @RequestParam(value="ref") String ref) {
			System.out.println("작성자"+session.getAttribute("email"));
			ModelAndView mav = new ModelAndView();
			System.out.println(ref);
			List <MyblogDTO> list = myblogService.loadReply(Integer.parseInt(ref));
			mav.addObject("list", list);
			System.out.println("loadReply 들어와서 저장하는 중...");
			mav.setViewName("jsonView");
			return mav;
		}
		
		@RequestMapping(value="/myblog/selectReply", method=RequestMethod.GET)
		public ModelAndView selectReply(@RequestParam(value="seq") String seq) {
			System.out.println("댓글 수정을 위한 데이터 불러오는중...");
			System.out.println(seq);
			MyblogDTO myblogDTO= myblogService.viewPage(Integer.parseInt(seq));
			ModelAndView mav = new ModelAndView();
			mav.addObject("myblogDTO",myblogDTO);
			mav.setViewName("jsonView");
			return mav;
		}
		
		@RequestMapping(value="/myblog/updateReply", method= {RequestMethod.GET})
		public @ResponseBody void updateReply(HttpSession session, @RequestParam Map <String , String> map) {
			myblogService.updateReply(map);
			System.out.println("insertReply 들어와서 저장하는 중...");
		}
		
		@RequestMapping(value="/myblog/boardWriteCheck", method=RequestMethod.POST)
		@ResponseBody
		public ModelAndView boardWriteCheck(@RequestParam Map<String, String> map, HttpSession session) {
			
			MyblogDTO myblogDTO = myblogService.boardWriteCheck(map);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("memEmail", (String) session.getAttribute("memEmail"));
			mav.addObject("myblogDTO", myblogDTO);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/like", method = RequestMethod.POST)
		@ResponseBody
		public void like(@RequestParam Map<String, String> map) {
			
			myblogService.like(map);
			
		}
		
		@RequestMapping(value="/myblog/unlike", method = RequestMethod.POST)
		@ResponseBody
		public void unlike(@RequestParam Map<String, String> map) {
			
			myblogService.unlike(map);
			
		}
		
		@RequestMapping(value="/myblog/likeCheck", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView likeCheck() {
			
			List<LikeDTO> list = myblogService.likeCheck();
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/likeViewCheck", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView likeViewCheck(@RequestParam Map<String, String> map, HttpSession session) {
			System.out.println("라이크뷰체크");
			
			String memEmail = (String) session.getAttribute("memEmail");
			System.out.println("세션 메일: " + memEmail );
			map.put("memEmail", memEmail);
			
			LikeDTO likeDTO = myblogService.likeViewCheck(map);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("likeDTO", likeDTO);
			mav.addObject("memEmail", memEmail);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/likeSize", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView likeSize(@RequestParam Map<String, String> map) {
			int likeSize = myblogService.likeSize(map);
			ModelAndView mav = new ModelAndView();
			mav.addObject("likeSize", likeSize);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/likeListSize", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView likeListSize() {
			
			List<MyblogDTO> list = myblogService.likeListSize();
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/follow", method = RequestMethod.POST)
		@ResponseBody
		public void follow(@RequestParam Map<String, String> map) {
			
			myblogService.follow(map);
			
		}
		
		@RequestMapping(value="/myblog/unfollow", method = RequestMethod.POST)
		@ResponseBody
		public void unfollow(@RequestParam Map<String, String> map) {
			
			myblogService.unfollow(map);
			
		}
		
		@RequestMapping(value="/myblog/followCheck", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView followCheck(@RequestParam Map<String, String> map) {
			
			FollowDTO followDTO = myblogService.followCheck(map);
			//System.out.println(followDTO.getFollow_nickname()+", "+followDTO.getNickname());
			String email = "hana@naver.com";
			ModelAndView mav = new ModelAndView();
			if(followDTO != null) {
				mav.addObject("getNickname", "");
			}
			mav.addObject("email", email);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/followClick", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView followClick(@RequestParam String email) {
			
			List<FollowDTO> list = myblogService.followClick(email);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/followingClick", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView followingClick(@RequestParam String follow_email) {
			
			List<FollowDTO> list = myblogService.followingClick(follow_email);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/followerSize", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView followerSize(@RequestParam String follow_email) {
			
			int size = myblogService.followerSize(follow_email);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("size", size);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/followingSize", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView followingSize(@RequestParam String email) {
			
			int size = myblogService.followingSize(email);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("size", size);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/boardSize", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView boardSize(@RequestParam String email) {
			
			int size = myblogService.boardSize(email);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("size", size);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
		@RequestMapping(value="/myblog/replySize", method = RequestMethod.POST)
		@ResponseBody
		public ModelAndView replySize(@RequestParam String seq) {
			
			int size = myblogService.replySize(seq);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("size", size);
			mav.setViewName("jsonView");
			
			return mav;
		}
		
}
