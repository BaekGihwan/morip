package admin.dao;

import admin.bean.TodayDTO;

public interface AdminDAO {

	public void countEnter();

	public TodayDTO dashboard();

	public int totalmember();

	public int totalblog();

	public int totalboard();

	public int totalmatzip();

	public int totalMan();

	public int totalWoman();

}
