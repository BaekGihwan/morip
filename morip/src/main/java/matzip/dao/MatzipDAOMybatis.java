package matzip.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import matzip.bean.MatzipDTO;
import myblog.bean.MyblogDTO;

@Transactional
@Repository("matzipDAO")
@ComponentScan("matzip.conf")
public class MatzipDAOMybatis implements MatzipDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MatzipDTO> matzipList(String address) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("matzipSQL.matzipList",address);
	}

	@Override
	public List<MatzipDTO> matzipList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("matzipSQL.matzipList2");
	}

	@Override
	public MatzipDTO getMatzipView(String title) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("matzipSQL.getMatzipView", title);
	}
	
	@Override
	public List<MatzipDTO> matzipThreeList() {
		return sqlSession.selectList("matzipSQL.matzipThreeList");
	}

	@Override
	public List<MatzipDTO> matzipAllList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
	    map.put("endNum", endNum);
		return sqlSession.selectList("matzipSQL.matzipAllList",map);
	}

	@Override
	public List<MyblogDTO> getMatzipReview(String title, int startNum, int endNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", title);
		//System.out.println(map.get("keyword"));
		map.put("startNum", startNum);
	    map.put("endNum", endNum);
	    //List<MyblogDTO> list = sqlSession.selectList("matzipSQL.getMatzipReview",map);
	    //System.out.println(list.get(0).getSubject());
		return sqlSession.selectList("matzipSQL.getMatzipReview",map);
	}

	@Override
	public String getReviewCount(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("matzipSQL.getReviewCount",keyword);
	}
}
