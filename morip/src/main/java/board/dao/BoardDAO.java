package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	public void boardWrite(Map<String, String> map);

	public List<BoardDTO> getBoardList(Map<String, Integer> map);

	public int getBoardTotalA();

	public BoardDTO getBoard(String boardtable_seq);

	public List<BoardDTO> getBoardSearch(Map<String, String> map);

	public int getBoardSearchTotalA(Map<String, String> map);


}
