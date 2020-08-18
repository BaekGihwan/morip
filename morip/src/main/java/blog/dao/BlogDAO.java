package blog.dao;

import java.util.List;

import myblog.bean.MyblogDTO;

public interface BlogDAO {

	List<MyblogDTO> blogAllList(int startNum, int endNum);

}
