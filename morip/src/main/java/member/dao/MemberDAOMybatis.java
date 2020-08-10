package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Repository
@Transactional
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO snsLogin(String email, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", pwd);
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.snsLogin", map);
		return memberDTO;
	}
	
	@Override
	public void moripWrite(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.moripWrite", memberDTO);
	}

	@Override
	public void changePwd(Map<String, String> map) {
		sqlSession.update("memberSQL.changePwd", map);
	}

	@Override
	public MemberDTO checkUser(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.checkUser", map);
	}
	
	@Override
	public MemberDTO checkId(String email) {
		return sqlSession.selectOne("memberSQL.checkId", email);
	}

	@Override
	public MemberDTO checkNickname(String nickname) {
		return sqlSession.selectOne("memberSQL.checkNickname", nickname);
	}
}
