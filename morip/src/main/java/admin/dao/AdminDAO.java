package admin.dao;


import java.util.List;
import java.util.Map;

import admin.bean.MonthDTO;
import admin.bean.TodayDTO;
import admin.bean.WeekDTO;

import member.bean.MemberDTO;


public interface AdminDAO {

	public void countEnter();

	public TodayDTO dashboard();

	public int totalmember();

	public int totalblog();

	public int totalboard();

	public int totalmatzip();

	public int totalMan();

	public int totalWoman();

	public void writematzip(Map<String, String> map);

	public void communityWrite(Map<String, String> map);

	public void resetToday();

	public void resetWeek();

	public void countWeek(String dayOfWeek);

	public void countMonth(String month);

	public WeekDTO getWeekData();

	public MonthDTO getMonthData();

	public List<MemberDTO> getMemberList();

	public void deleteMember(int seq);

	public List<MemberDTO> getBoardList(String nickname);

	public void deleteBoard(int seq);
}
