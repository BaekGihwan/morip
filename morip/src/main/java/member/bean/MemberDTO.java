package member.bean;

import lombok.Data;

@Data
public class MemberDTO {
	private int membertable_seq;
	private String email;
	private String pwd;
	private String name;
	private String nickname;
	private String idCardNumber1;
	private String idCardNumber2;
	private String gender;
	private String image;
	private String backimage;
	private String checkid;
}