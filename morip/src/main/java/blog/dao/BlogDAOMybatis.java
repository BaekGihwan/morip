package blog.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import myblog.bean.MyblogDTO;

@Repository
@Transactional
public class BlogDAOMybatis implements BlogDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MyblogDTO> blogAllList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
	    map.put("endNum", endNum);
		return sqlSession.selectList("blogSQL.blogAllList",map);
	}
}