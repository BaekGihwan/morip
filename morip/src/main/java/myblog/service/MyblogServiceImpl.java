package myblog.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import myblog.bean.MyblogDTO;
import myblog.dao.MyblogDAO;

@Service
public class MyblogServiceImpl implements MyblogService {
	@Autowired
	private MyblogDAO myblogDAO;
	
	@Override
	public List <MyblogDTO> infinityScroll(Map<String, Integer> map) {
		
		return myblogDAO.infinityScroll(map);
	}

	@Override
	public void insertWriteBlog(Map<String, String> map) {
		myblogDAO.insertWriteBlog(map);
	}

	@Override
	public MyblogDTO viewPage(int seq) {
		return myblogDAO.getView(seq);
	}

	@Override
	public void deleteBlogBoard(Map<String, String> map) {
		myblogDAO.deleteBlogBoard(map);
	}

	@Override
	public void insertReply(Map<String, String> map) {
		myblogDAO.insertReply(map);
		
	}
	@Override
	public List<MyblogDTO> loadReply(int ref) {
		return myblogDAO.loadReply(ref);
	}

	@Override
	public void updateReply(Map<String, String> map) {
		myblogDAO.updateReply(map);
	}
}
