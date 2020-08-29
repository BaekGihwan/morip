package blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blog.dao.BlogDAO;
import myblog.bean.MyblogDTO;

@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
	private BlogDAO blogDAO;
	
	// 전체 인피니티스크롤
	@Override
	public List<MyblogDTO> blogAllList(int pg, String content) {
		int endNum = pg*8;
		int startNum = endNum-7;
		List<MyblogDTO> list = blogDAO.blogAllList(startNum,endNum,content);
		return list;
	}
}
