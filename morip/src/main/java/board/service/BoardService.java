package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;
import board.bean.BoardPaging;

public interface BoardService {

	public void boardWrite(Map<String, String> map);

	public List<BoardDTO> getBoardList(String pg);

	public BoardPaging boardPaging(String pg);

	public BoardDTO getBoard(String boardtable_seq);
	
	public List<BoardDTO> getBoardSearch(Map<String, String> map);

	public BoardPaging boardPaging(Map<String, String> map);

	public void boardModify(Map<String, String> map);

	public void boardDelete(String boardtable_seq);

	public void boardHit(String boardtable_seq);

	public List<BoardDTO> loadReply(int parseInt);//댓글 전부 불러오기

	public void insertReply(Map<String, String> map);//댓글 입력 controller

	public void deleteReplyBoard(Map<String, String> map);

	public BoardDTO viewPage(int parseInt);

	public void updateReply(Map<String, String> map);


}
