package member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private BoardDAO boardDAO;
	
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
	public MemberDTO getMember(String email, String checkid) {
		return memberDAO.getMember(email, checkid);
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

	@Override
	public void dropMorip(String email, String checkid) {
		memberDAO.dropMorip(email, checkid);
	}
	
	@Override
	public void memberModify(Map<String, String> map) {
		memberDAO.memberModify(map);
	}
	@Override
	public void memberModify2(Map<String, String> map) {
		memberDAO.memberModify2(map);		
	}
}