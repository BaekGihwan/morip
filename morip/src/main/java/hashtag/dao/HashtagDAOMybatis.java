package hashtag.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hashtag.bean.HashtagDTO;
import myblog.bean.MyblogDTO;

@Transactional
@Repository("hashtagDAO")
public class HashtagDAOMybatis implements HashtagDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertHashTag(String hashtag) {
		sqlSession.insert("hashtagSQL.insertHashTag",hashtag);		
	}
	
	@Override
	public List<HashtagDTO> hashtagSearch(String hashtagText) {		
		return sqlSession.selectList("hashtagSQL.hashtagSearch",hashtagText);
	}

	@Override
	public MyblogDTO hashtagBlogList(String seq) {		
		return sqlSession.selectOne("hashtagSQL.hashtagBlogList",Integer.parseInt(seq));
	}
}
