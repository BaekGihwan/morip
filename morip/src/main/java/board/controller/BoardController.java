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

	@RequestMapping(value = "getBoardList", method = RequestMethod.POST)
	public ModelAndView getBoardList(@RequestParam String pg, HttpSession session, HttpServletResponse response) {
		String nickname = (String) session.getAttribute("nickname");

		// 쿠키
		if (nickname != null) {
			Cookie cookie = new Cookie("memHit", "ok");
			cookie.setMaxAge(30 * 60);
			cookie.setPath("/");
			response.addCookie(cookie);// 클라이언트에게 보내기
		}

		// 1페이지당 5개씩
		List<BoardDTO> list = boardService.getBoardList(pg);

		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.addObject("nickname", nickname);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "boardWrite", method = RequestMethod.POST)
	@ResponseBody
	public void boardWrite(@RequestParam Map<String, String> map, HttpSession session) {
		String nickname = (String) session.getAttribute("nickname");
		String image = (String) session.getAttribute("image");
		map.put("nickname", nickname);
		map.put("image", image);
		boardService.boardWrite(map);

	}

	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView(@RequestParam String boardtable_seq, @RequestParam String pg, Model model) {

		model.addAttribute("boardtable_seq", boardtable_seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/resources/board/boardView.jsp");
		return "/resources/main/index";
	}

	@RequestMapping(value = "getBoardView", method = RequestMethod.POST)
	public ModelAndView getBoardView(@RequestParam String boardtable_seq,
			@CookieValue(value = "memHit", required = false) Cookie cookie, HttpServletResponse response,
			HttpSession session) {

		String nickname = (String) session.getAttribute("nickname");
		String image = (String) session.getAttribute("image");

		// 쿠키 - 조회수 증가
		if (cookie != null) {
			boardService.boardHit(boardtable_seq); // 조회수 증가

			// 쿠키삭제
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		BoardDTO boardDTO = boardService.getBoard(boardtable_seq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("nickname", nickname);
		mav.addObject("image", image);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "getBoardSearch", method = RequestMethod.GET)
	public ModelAndView getBoardSearch(@RequestParam Map<String, String> map) {
		List<BoardDTO> list = boardService.getBoardSearch(map);

		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "boardModifyForm", method = RequestMethod.POST)
	public String boardModifyForm(@RequestParam String boardtable_seq, @RequestParam String pg, Model model) {

		BoardDTO boardDTO = boardService.getBoard(boardtable_seq);
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("boardtable_seq", boardtable_seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/resources/board/boardModifyForm.jsp");
		return "/resources/main/index";
	}

	@RequestMapping(value = "boardModify", method = RequestMethod.POST)
	@ResponseBody
	public void boardModify(@RequestParam Map<String, String> map) {
		boardService.boardModify(map);

	}

	@RequestMapping(value = "boardDelete", method = RequestMethod.POST)
	public String boardDelete(@RequestParam String boardtable_seq, Model model) {
		boardService.boardDelete(boardtable_seq);
		model.addAttribute("display", "/resources/board/boardDelete.jsp");
		return "/resources/main/index";
	}

	// 댓글 삭제 controller
	@ResponseBody
	@RequestMapping(value = "deleteReplyBoard", method = RequestMethod.GET)
	public void deleteReplyBoard(@RequestParam Map<String, String> map) {
		boardService.deleteReplyBoard(map);
	}

	// 댓글 입력 controller
	@RequestMapping(value = "insertReply", method = { RequestMethod.POST })
	public @ResponseBody void insertReply(HttpSession session, @RequestParam Map<String, String> map) {
		String nickname = (String) session.getAttribute("nickname");
		String image = (String) session.getAttribute("image");

		map.put("nickname", nickname);
		map.put("image", image);
		boardService.insertReply(map);
	}

	// 댓글 전부 불러오기
	@RequestMapping(value = "loadReply", method = { RequestMethod.POST })
	public ModelAndView loadReply(HttpSession session, @RequestParam(value = "ref") String ref) {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> list = boardService.loadReply(Integer.parseInt(ref));
		String image = (String) session.getAttribute("image");
		mav.addObject("image", image);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}

	// 댓글 수정 시 하나의 댓글만 DB 에서 불러오기
	@RequestMapping(value = "selectReply", method = RequestMethod.GET)
	public ModelAndView selectReply(@RequestParam(value = "boardtable_seq") String boardtable_seq) {
		BoardDTO boardDTO = boardService.viewPage(Integer.parseInt(boardtable_seq));
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", boardDTO);
		mav.setViewName("jsonView");
		return mav;
	}

	// 댓글 수정 controller
	@RequestMapping(value = "updateReply", method = { RequestMethod.GET })
	public @ResponseBody void updateReply(HttpSession session, @RequestParam Map<String, String> map) {
		boardService.updateReply(map);
	}

}
