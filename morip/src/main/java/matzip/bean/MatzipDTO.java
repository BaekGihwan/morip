package matzip.bean;

import org.springframework.context.annotation.ComponentScan;

import lombok.Data;
@Data
@ComponentScan("matzip.conf")
public class MatzipDTO {
	private String category;
	private String title;
	private String link;
	private String time;
	private String telephone;
	private String address;
	private String roadAddress;
	private String mapx;
	private String mapy;
	private String image1,image2,image3,image4;
	private int reviewCount;
}
