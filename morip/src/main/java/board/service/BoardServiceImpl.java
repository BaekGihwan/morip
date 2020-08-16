package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardPaging boardPaging;

	@Override
	public void boardWrite(Map<String, String> map) {
		boardDAO.boardWrite(map);
		
	}

	@Override
	public List<BoardDTO> getBoardList(String pg) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return boardDAO.getBoardList(map);
	}

	@Override
	public BoardPaging boardPaging(String pg) {
		int totalA = boardDAO.getBoardTotalA();//총글수
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}


	@Override
	public BoardDTO getBoard(String boardtable_seq) {
		return boardDAO.getBoard(boardtable_seq);
	}

	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		//1페이지당 5개씩
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		return boardDAO.getBoardSearch(map);
	}

	@Override
	public BoardPaging boardPaging(Map<String, String> map) {
		int totalA = boardDAO.getBoardSearchTotalA(map);//총글수
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

}
