package myblog.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import myblog.bean.FollowDTO;
import myblog.bean.LikeDTO;
import myblog.bean.MyblogDTO;
import myblog.dao.MyblogDAO;

@Service
public class MyblogServiceImpl implements MyblogService {
	@Autowired
	private MyblogDAO myblogDAO;
	
	@Autowired
	private HttpSession session;
	
	@Override
	public List <MyblogDTO> infinityScroll(Map<String,Object> map) {
		
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


	@Override
	public MemberDTO loadMember(String nickname) {
		return myblogDAO.loadMember(nickname);
	}

	@Override
	   public int boardSize(String email) {
	      
	      return myblogDAO.boardSize(email);
	   }

	
	@Override
	public MyblogDTO boardWriteCheck(Map<String, String> map) {
		
		return myblogDAO.boardWriteCheck(map);
	}
	
	@Override
	public void like(Map<String, String> map) {
		
		String email = (String) session.getAttribute("memEmail");
		map.put("email", email);
		
		myblogDAO.like(map);
	}
	
	@Override
	public void unlike(Map<String, String> map) {
		
		String email = (String) session.getAttribute("memEmail");
		map.put("email", email);
		
		myblogDAO.unlike(map);
	}
	
	@Override
	public List<LikeDTO> likeCheck() {
		
		String email = (String) session.getAttribute("memEmail");
		return myblogDAO.likeCheck(email);
	}
	
	@Override
	public LikeDTO likeViewCheck(Map<String, String> map) {
		
		System.out.println("서비스: " + map.get("memEmail"));
		return myblogDAO.likeViewCheck(map);
	}
	
	@Override
	public int likeSize(Map<String, String> map) {
		
		return myblogDAO.likeSize(map);
	}
	
	@Override
	public List<MyblogDTO> likeListSize() {
		
		return myblogDAO.likeListSize();
	}
	
	@Override
	public void follow(Map<String, String> map) {
		
		String email = (String) session.getAttribute("memEmail");
		map.put("email", email);
		
		myblogDAO.follow(map);
	}
	
	@Override
	public void unfollow(Map<String, String> map) {
		
		String email = (String) session.getAttribute("memEmail");
		map.put("email", email);
		
		myblogDAO.unfollow(map);
		
	}

	@Override
	public FollowDTO followCheck(Map<String, String> map) {
		
		String email = (String) session.getAttribute("memEmail");
		map.put("email", email);
		return myblogDAO.followCheck(map);
	}
	
	@Override
	public List<FollowDTO> followClick(String email) {
		
		return myblogDAO.followClick(email);
	}
	
	@Override
	public List<FollowDTO> followingClick(String follow_email) {
		
		return myblogDAO.followingClick(follow_email);
	}
	
	@Override
	public int followerSize(String follow_email) {
		
		return myblogDAO.followerSize(follow_email);
	}
	
	@Override
	public int followingSize(String email) {
		
		return myblogDAO.followingSize(email);
	}
	
	@Override
	public int replySize(String seq) {
		
		return myblogDAO.replySize(seq);
	}

	@Override
	public void updateBgImg(Map <String, String> map) {
		myblogDAO.updateBgImg(map);
		
	}

	@Override
	public void modifyBoard(Map<String, String> map) {
		myblogDAO.modifyBoard(map);
	}

	@Override
	public List<String> bestWriter() {
		return myblogDAO.bestWriter();
	}

	@Override
	public List<MyblogDTO> bestTrip(Map<String, String> map) {
		return myblogDAO.bestTrip(map);
	}



}
