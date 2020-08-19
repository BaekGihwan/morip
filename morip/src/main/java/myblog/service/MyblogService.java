package myblog.service;

import java.util.Map;

import member.bean.MemberDTO;

import java.util.List;

import myblog.bean.MyblogDTO;

public interface MyblogService {

	public List<MyblogDTO> infinityScroll(Map<String, Object> map);

	public void insertWriteBlog(Map<String, String> map);

	public MyblogDTO viewPage(int seq);

	public void deleteBlogBoard(Map<String, String> map);

	public void insertReply(Map<String, String> map);

	public List<MyblogDTO> loadReply(int ref);

	public void updateReply(Map<String, String> map);

	public MemberDTO loadMember(String nickname);

	int boardSize(String email);

}
