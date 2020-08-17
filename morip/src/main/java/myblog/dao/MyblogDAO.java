package myblog.dao;

import java.util.List;
import java.util.Map;

import myblog.bean.MyblogDTO;

public interface MyblogDAO {
	List <MyblogDTO> infinityScroll(Map<String, Integer> map);

	void insertWriteBlog(Map<String, String> map);

	MyblogDTO getView(int seq);

	void deleteBlogBoard(Map<String, String> map);

	void insertReply(Map<String, String> map);

	List<MyblogDTO> loadReply(int ref);

	void updateReply(Map<String, String> map);
}
