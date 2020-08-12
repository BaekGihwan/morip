package myblog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import myblog.bean.MyblogDTO;

@Repository
@Transactional
public class MyblogDaoMybatis implements MyblogDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List <MyblogDTO> infinityScroll(Map<String, Integer> map) {
		return sqlSession.selectList("myblogSQL.infinityScroll", map);
	}
}
