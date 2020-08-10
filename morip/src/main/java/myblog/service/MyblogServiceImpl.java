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
}
