package matzip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import matzip.bean.MatzipDTO;

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
}
