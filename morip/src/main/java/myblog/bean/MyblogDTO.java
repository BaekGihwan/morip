package myblog.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class MyblogDTO {
	private int seq;
	private String id;
	private String subject;
	private String content;
	private String email;
	private int ref;
	private int lev;
	private int step;
	private int pseq;
	private int reply;
	private int hit;
	private Date logtime;
	private String backgroundimg;
	private String userlike;
	private Date startdate;
	private Date enddate;
}
