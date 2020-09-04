package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardDTO {
	private int boardtable_seq;
	private String nickname;
	private String subject;
	private String content;
	
	private int hit; // 조회수
	private int ref; // 원글번호  boardtable_seq랑 같은거  정렬은 seq로
	private int step; // 댓글단계 
	private int pseq; //원글번호
	
	 @JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyy.MM.dd")
	 private Date logtime;
	 private String image;
}
