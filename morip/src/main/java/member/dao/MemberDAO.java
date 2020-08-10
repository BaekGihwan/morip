package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {
	
	public MemberDTO snsLogin(String email, String pwd);

	public void moripWrite(MemberDTO memberDTO);

	public MemberDTO checkId(String email);

	public void changePwd(Map<String, String> map);

	public MemberDTO checkUser(Map<String, String> map);

	public MemberDTO checkNickname(String nickname);
}
