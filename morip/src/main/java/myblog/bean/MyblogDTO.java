package myblog.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class MyblogDTO {
	private int blogboardtable_seq;
	private String nickname;
	private String email;
	private String subject;
	private String content;
	private String mainimage;
	private Date startdate;
	private Date enddate;
	private int hit;
	private int ref;
	private int step;
	private int pseq;
	private Date logtime;
	private String publicoption;
}
