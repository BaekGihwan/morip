package member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDTO snsLogin(String email, String pwd) {
		MemberDTO memberDTO = memberDAO.snsLogin(email, pwd);
		return memberDTO;
	}
	
	@Override
	public void moripWrite(MemberDTO memberDTO) {
		memberDAO.moripWrite(memberDTO);
	}

	@Override
	public MemberDTO getMember(String email) {
		return memberDAO.checkId(email);
	}

	@Override
	public void changePwd(Map<String, String> map) {
		memberDAO.changePwd(map);
	}

	@Override
	public MemberDTO checkUser(Map<String, String> map) {
		return memberDAO.checkUser(map);
	}

	@Override
	public MemberDTO checkNickname(String nickname) {
		return memberDAO.checkNickname(nickname);
	}
}