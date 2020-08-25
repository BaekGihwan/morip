package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Repository
@Transactional
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite", map);

	}

	@Override
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("boardSQL.getBoardList", map);
	}

	@Override
	public int getBoardTotalA() {
		return sqlSession.selectOne("boardSQL.getBoardTotalA");
	}

	@Override
	public BoardDTO getBoard(String boardtable_seq) {
		return sqlSession.selectOne("boardSQL.getBoard", Integer.parseInt(boardtable_seq));
	}

	@Override
	public List<BoardDTO> getBoardSearch(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.getBoardSearch", map);
	}

	@Override
	public int getBoardSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getBoardSearchTotalA", map);
	}

	@Override
	public void boardModify(Map<String, String> map) {
		sqlSession.update("boardSQL.boardModify", map);

	}

	@Override
	public void boardDelete(String boardtable_seq) {
		sqlSession.delete("boardSQL.boardDelete", Integer.parseInt(boardtable_seq));

	}

	@Override
	public void boardHit(String boardtable_seq) {
		sqlSession.update("boardSQL.boardHit", Integer.parseInt(boardtable_seq));

	}

	@Override
	public void insertReply(Map<String, String> map) {
		sqlSession.insert("boardSQL.insertReply", map);

	}

	@Override
	public List<BoardDTO> loadReply(int parseInt) {
		return sqlSession.selectList("boardSQL.loadReply", parseInt);
	}

	@Override
	public void deleteReplyBoard(Map<String, String> map) {
		sqlSession.delete("boardSQL.deleteReplyBoard", map);

	}

	@Override
	public BoardDTO viewPage(int parseInt) {
		return sqlSession.selectOne("boardSQL.viewPage", parseInt);
	}

	@Override
	public void updateReply(Map<String, String> map) {
		sqlSession.update("boardSQL.updateReply", map);

	}

}
