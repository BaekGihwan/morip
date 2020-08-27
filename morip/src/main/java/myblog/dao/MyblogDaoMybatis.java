package myblog.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import hashtag.bean.HashtagDTO;
import member.bean.MemberDTO;
import myblog.bean.FollowDTO;
import myblog.bean.LikeDTO;
import myblog.bean.MyblogDTO;

@Repository
@Transactional
public class MyblogDaoMybatis implements MyblogDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MyblogDTO> infinityScroll(Map<String, Object> map) {
		return sqlSession.selectList("myblogSQL.infinityScroll", map);
	}

	@Override
	public void insertWriteBlog(Map<String, String> map) {
		sqlSession.update("myblogSQL.insertWriteBlog", map);
	}

	@Override
	public MyblogDTO getView(int seq) {
		return sqlSession.selectOne("myblogSQL.getView", seq);
	}

	@Override
	public void deleteBlogBoard(Map<String, String> map) {
		sqlSession.delete("myblogSQL.deleteBlogBoard", map);
		sqlSession.delete("myblogSQL.deleteHashtag", map.get("seq"));
	}

	@Override
	public void insertReply(Map<String, String> map) {
		sqlSession.insert("myblogSQL.insertReply", map);
	}

	@Override
	public List<MyblogDTO> loadReply(int ref) {
		return sqlSession.selectList("myblogSQL.loadReply", ref);
	}

	@Override
	public void updateReply(Map<String, String> map) {
		sqlSession.update("myblogSQL.updateReply", map);
	}

	@Override
	public MyblogDTO boardWriteCheck(Map<String, String> map) {

		return sqlSession.selectOne("myblogSQL.boardWriteCheck", map);
	}

	@Override
	public void like(Map<String, String> map) {

		sqlSession.insert("myblogSQL.like", map);
	}

	@Override
	public void unlike(Map<String, String> map) {

		sqlSession.delete("myblogSQL.unlike", map);
	}

	@Override
	public List<LikeDTO> likeCheck(String email) {

		List<LikeDTO> list = null;

		list = sqlSession.selectList("myblogSQL.likeCheck", email);

		return list;
	}

	@Override
	public LikeDTO likeViewCheck(Map<String, String> map) {
		LikeDTO likeDTO = null;
		try {
			likeDTO = sqlSession.selectOne("myblogSQL.likeViewCheck", map);
		} catch (NullPointerException e) {
			likeDTO = null;
		}

		return likeDTO;
	}

	@Override
	public int likeSize(Map<String, String> map) {

		return sqlSession.selectOne("myblogSQL.likeSize", map);
	}

	@Override
	public List<MyblogDTO> likeListSize() {

		return sqlSession.selectList("myblogSQL.likeListSize");
	}

	@Override
	public void follow(Map<String, String> map) {

		sqlSession.insert("myblogSQL.follow", map);
	}

	@Override
	public void unfollow(Map<String, String> map) {

		sqlSession.delete("myblogSQL.unfollow", map);
	}

	@Override
	public FollowDTO followCheck(Map<String, String> map) {

		FollowDTO followDTO = null;

		try {
			followDTO = sqlSession.selectOne("myblogSQL.followCheck", map);
		} catch (NullPointerException e) {
			followDTO = null;
		}

		return followDTO;
	}

	@Override
	public List<FollowDTO> followClick(String email) {

		List<FollowDTO> list = null;

		list = sqlSession.selectList("myblogSQL.followClick", email);

		return list;
	}

	@Override
	public List<FollowDTO> followingClick(String follow_email) {

		List<FollowDTO> list = null;

		list = sqlSession.selectList("myblogSQL.followingClick", follow_email);

		return list;
	}

	@Override
	public int followerSize(String follow_email) {

		return sqlSession.selectOne("myblogSQL.followerSize", follow_email);
	}

	@Override
	public int followingSize(String email) {

		return sqlSession.selectOne("myblogSQL.followingSize", email);
	}

	@Override
	public int boardSize(String email) {

		return sqlSession.selectOne("myblogSQL.boardSize", email);
	}

	@Override
	public int replySize(String seq) {
		return sqlSession.selectOne("myblogSQL.replySize", seq);
	}

	@Override
	public MemberDTO loadMember(String nickname) {
		return sqlSession.selectOne("myblogSQL.loadMember", nickname);
	}

	@Override
	public void updateBgImg(Map<String, String> map) {
		sqlSession.update("myblogSQL.updateBgImg", map);
	}

	@Override
	public void modifyBoard(Map<String, String> map) {
		sqlSession.update("myblogSQL.modifyBoard", map);
	}

	@Override
	public void boardHit(String seq) {
		sqlSession.update("myblogSQL.boardHit", Integer.parseInt(seq));
	}

	@Override
	public List<HashtagDTO> loadHashtag(int seq) {
		return sqlSession.selectList("myblogSQL.loadHashtag", seq);
	}

	@Override
	public void modifyHashtag(Map<String, Object> map) {
		
		String [] ar = (String[]) map.get("ar");
		int seq = (Integer) map.get("seq");
		//기존에 있던 해쉬태그 전부 지우기
		sqlSession.delete("myblogSQL.deleteHashtag", seq);
		//해쉬태그 다시 입력
		for(int i=0;i<ar.length;i++) {
			Map <String, Object> map1 = new HashMap<String , Object>();
			map1.put("seq", seq);
			map1.put("hashtag", ar[i]);
			sqlSession.insert("myblogSQL.modifyHashtag", map1);
		}
		
	}

}
