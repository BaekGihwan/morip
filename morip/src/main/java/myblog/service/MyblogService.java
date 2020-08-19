package myblog.service;

import java.util.Map;

import member.bean.MemberDTO;

import java.util.List;

import myblog.bean.FollowDTO;
import myblog.bean.LikeDTO;
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

	public int boardSize(String email);
	
	public void like(Map<String, String> map);

	public void unlike(Map<String, String> map);

	public List<LikeDTO> likeCheck();
	
	public LikeDTO likeViewCheck(Map<String, String> map);

	public int likeSize(Map<String, String> map);

	public List<MyblogDTO> likeListSize();
	
	public void follow(Map<String, String> map);

	public void unfollow(Map<String, String> map);

	public FollowDTO followCheck(Map<String, String> map);

	public List<FollowDTO> followClick(String email);

	public List<FollowDTO> followingClick(String follow_email);

	public int followerSize(String follow_email);

	public int followingSize(String email);

	public int replySize(String seq);

	public MyblogDTO boardWriteCheck(Map<String, String> map);



}
