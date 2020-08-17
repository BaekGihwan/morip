package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/resources/board/boardList.jsp");
		return "/resources/main/index";
	}
	
	@RequestMapping(value="getBoardList", method=RequestMethod.POST)
	public ModelAndView getBoardList(@RequestParam String pg,
									 HttpSession session,
									 HttpServletResponse response) {
		String memNickName = (String) session.getAttribute("memNickName");
		
		//쿠키
		if(memNickName != null) {
			Cookie cookie = new Cookie("memHit", "ok");
			cookie.setMaxAge(30*60);
			cookie.setPath("/");
			response.addCookie(cookie);//클라이언트에게 보내기
		}
		
		//1페이지당 5개씩
		List<BoardDTO> list = boardService.getBoardList(pg);
		
		//페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("memNickName", memNickName);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "boardWrite" , method=RequestMethod.POST) 
	@ResponseBody
	public void boardWrite(@RequestParam Map<String, String> map) {
		//System.out.println(map.get("subject"));
		//System.out.println(map.get("content"));
		map.put("nickname", "테스트");
		boardService.boardWrite(map); 
		
	}
	
	 @RequestMapping(value="boardView", method=RequestMethod.GET) 
	 public String boardView(@RequestParam String boardtable_seq,
			 				 @RequestParam String pg,
			 				 Model model) {
		 BoardDTO boardDTO = boardService.getBoard(boardtable_seq);
		 model.addAttribute("boardDTO", boardDTO);
		 model.addAttribute("memNickName", "테스트");
		 
		 model.addAttribute("boardtable_seq", boardtable_seq); 
		 model.addAttribute("pg", pg);
		 model.addAttribute("display", "/resources/board/boardView.jsp"); 
		 return "/resources/main/index";
	 }
	 

	 @RequestMapping(value="getBoardView", method=RequestMethod.POST)
		public ModelAndView getBoardView(@RequestParam String boardtable_seq,
										 @CookieValue(value="memHit", required=false) Cookie cookie,      
										 HttpServletResponse response,
										 HttpSession session) {
		 	System.out.println("겟보드뷰");
		 	System.out.println(boardtable_seq);
			BoardDTO boardDTO = boardService.getBoard(boardtable_seq);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("boardDTO", boardDTO);
			mav.addObject("memNickName", "테스트");
			mav.setViewName("jsonView");
			return mav;
		}
	 
		@RequestMapping(value="getBoardSearch", method=RequestMethod.GET)
		public ModelAndView getBoardSearch(@RequestParam Map<String,String> map) {
			List<BoardDTO> list = boardService.getBoardSearch(map);
			
			//페이징 처리
			BoardPaging boardPaging = boardService.boardPaging(map);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("pg", map.get("pg"));
			mav.addObject("list", list);
			mav.addObject("boardPaging", boardPaging);
			mav.setViewName("jsonView");
			return mav;
		}
		/*
		@RequestMapping(value="boardModifyForm", method=RequestMethod.POST)
		public String boardModifyForm(@RequestParam String boardtable_seq,
									  @RequestParam String pg,
									  Model model) {
			model.addAttribute("boardtable_seq", boardtable_seq); 
			model.addAttribute("pg", pg);
			model.addAttribute("display", "/board/boardModifyForm.jsp");
			return "/main/index";
		}
	*/

}
