package blog.service;

import java.util.List;

import myblog.bean.MyblogDTO;

public interface BlogService {

	List<MyblogDTO> blogAllList(int pg);

}
