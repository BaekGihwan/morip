package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.MonthDTO;
import admin.bean.TodayDTO;
import admin.bean.WeekDTO;
import member.bean.MemberDTO;

@Repository
@Transactional
public class AdminDAOMybatis implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	// 일일방문자수 업데이트
	@Override
	public void countEnter() {
		sqlSession.update("adminSQL.countEnter");
	}
	// todaytable 가져오기
	@Override
	public TodayDTO dashboard() {
		return sqlSession.selectOne("adminSQL.dashboard");
	}
	// 전체 회원수 가져오기
	@Override
	public int totalmember() {
		return sqlSession.selectOne("adminSQL.totalmember");
	}
	// 전체 블로그수 가져오기
	@Override
	public int totalblog() {
		return sqlSession.selectOne("adminSQL.totalblog");
	}
	// 전체 게시판수 가져오기
	@Override
	public int totalboard() {
		return sqlSession.selectOne("adminSQL.totalboard");
	}
	// 전체 맛집수 가져오기
	@Override
	public int totalmatzip() {
		return sqlSession.selectOne("adminSQL.totalmatzip");
	}
	// 남자회원수 가져오기
	@Override
	public int totalMan() {
		return sqlSession.selectOne("adminSQL.totalMan");
	}
	// 여자회원수 가져오기
	@Override
	public int totalWoman() {
		return sqlSession.selectOne("adminSQL.totalWoman");
	}
	@Override
	public void resetToday() {
		sqlSession.update("adminSQL.resetToday");
	}
	@Override
	public void resetWeek() {
		sqlSession.update("adminSQL.resetWeek");
	}
	@Override
	public void countWeek(String dayOfWeek) {
		sqlSession.update("adminSQL.countWeek",dayOfWeek);
		
	}
	@Override
	public void countMonth(String month) {
		sqlSession.update("adminSQL.countMonth",month);
	}
	@Override
	public WeekDTO getWeekData() {
		return sqlSession.selectOne("adminSQL.getWeekData");
	}
	@Override
	public MonthDTO getMonthData() {
		return sqlSession.selectOne("adminSQL.getMonthData");
	}
	// 회원리스트
	@Override
	public List<MemberDTO> getMemberList() {
		return sqlSession.selectList("adminSQL.getMemberList");
	}
	// 회원삭제
	@Override
	public void deleteMember(int seq) {
		sqlSession.update("adminSQL.deleteMember", seq);
	}
	// 공지사항리스트
	@Override
	public List<MemberDTO> getBoardList(String nickname) {
		return sqlSession.selectList("adminSQL.getBoardList", nickname);
	}
	// 공지사항삭제
	@Override
	public void deleteBoard(int seq) {
		sqlSession.update("adminSQL.deleteBoard", seq);
	}
}
