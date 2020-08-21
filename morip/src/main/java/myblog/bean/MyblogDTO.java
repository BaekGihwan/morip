package myblog.bean;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	private String publicoption;
	private int likecount;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy.MM.dd")
	private Date logtime;
}