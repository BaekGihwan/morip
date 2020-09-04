package admin.dao;

import admin.bean.MonthDTO;
import admin.bean.TodayDTO;
import admin.bean.WeekDTO;

public interface AdminDAO {

	public void countEnter();

	public TodayDTO dashboard();

	public int totalmember();

	public int totalblog();

	public int totalboard();

	public int totalmatzip();

	public int totalMan();

	public int totalWoman();

	public void resetToday();

	public void resetWeek();

	public void countWeek(String dayOfWeek);

	public void countMonth(String month);

	public WeekDTO getWeekData();

	public MonthDTO getMonthData();

}
