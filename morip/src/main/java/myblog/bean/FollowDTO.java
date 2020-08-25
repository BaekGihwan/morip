package myblog.bean;

import lombok.Data;

@Data
public class FollowDTO {
	
	private int membertable_seq;
	private String nickname;
	private String email;
	private String follow_email;
	private String image;

}
