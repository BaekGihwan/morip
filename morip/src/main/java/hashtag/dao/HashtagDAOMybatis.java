package hashtag.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("hashtagDAO")
public class HashtagDAOMybatis implements HashtagDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertHashTag(String hashtag) {
		sqlSession.insert("hashtagSQL.insertHashTag",hashtag);
		
	}

}
