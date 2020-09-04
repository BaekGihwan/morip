package member.dao;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberDAO {
	
	public MemberDTO snsLogin(String email, String pwd);

	public void moripWrite(MemberDTO memberDTO);

	public MemberDTO getMember(String email, String checkid);

	public void changePwd(Map<String, String> map);

	public MemberDTO checkUser(Map<String, String> map);

	public MemberDTO checkNickname(String nickname);

	public void memberModify(Map<String, String> map);

	public void dropMorip(String email, String checkid);

	public void memberModify2(Map<String, String> map);

	public MemberDTO getMember2(String email);

}
