package myblog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;
import myblog.bean.MyblogDTO;

@Repository
@Transactional
public class MyblogDaoMybatis implements MyblogDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List <MyblogDTO> infinityScroll(Map<String, Object> map) {
		return sqlSession.selectList("myblogSQL.infinityScroll", map);
	}

	@Override
	public void insertWriteBlog(Map<String, String> map) {
		sqlSession.update("myblogSQL.insertWriteBlog", map);
	}

	@Override
	public MyblogDTO getView(int seq) {
		return sqlSession.selectOne("myblogSQL.getView",seq);
	}

	@Override
	public void deleteBlogBoard(Map<String, String> map) {
		sqlSession.delete("myblogSQL.deleteBlogBoard",map);
	}

	@Override
	public void insertReply(Map<String, String> map) {
		sqlSession.insert("myblogSQL.insertReply",map);
	}

	@Override
	public List<MyblogDTO> loadReply(int ref) {
		return sqlSession.selectList("myblogSQL.loadReply", ref);
	}

	@Override
	public void updateReply(Map<String, String> map) {
		sqlSession.update("myblogSQL.updateReply",map);
	}

	@Override
	public MemberDTO loadMember(String nickname) {
		return sqlSession.selectOne("myblogSQL.loadMember",nickname);
	}
	
	@Override
	   public int boardSize(String email) {
	      
	      return sqlSession.selectOne("myblogSQL.boardSize", email);
	   }

}
