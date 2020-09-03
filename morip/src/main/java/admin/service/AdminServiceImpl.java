package admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import admin.bean.MonthDTO;
import admin.bean.TodayDTO;
import admin.bean.WeekDTO;
import admin.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;	
	// 일일방문자수 업데이트
	@Override
	public void countEnter() {
		adminDAO.countEnter();
	}
	// todaytable 가져오기
	@Override
	public TodayDTO dashboard() {
		return adminDAO.dashboard();
	}
	// 전체 회원수 가져오기
	@Override
	public int totalmember() {
		return adminDAO.totalmember();
	}
	// 전체 블로그수 가져오기
	@Override
	public int totalblog() {
		return adminDAO.totalblog();
	}
	// 전체 게시판수 가져오기
	@Override
	public int totalboard() {
		return adminDAO.totalboard();
	}
	// 전체 맛집수 가져오기
	@Override
	public int totalmatzip() {
		return adminDAO.totalmatzip();
	}
	// 남자회원수 가져오기
	@Override
	public int totalMan() {
		return adminDAO.totalMan();
	}
	// 여자회원수 가져오기
	@Override
	public int totalWoman() {
		return adminDAO.totalWoman();
	}
	@Override
	@Scheduled(cron="0 0 0 * * *")
	public void resetToday() {
		System.out.println("resetToday 스케줄러 실행");
		adminDAO.resetToday();
		
	}
	@Override
	@Scheduled(cron="0 0 0 * * MON")
	public void resetWeek() {
		System.out.println("resetWeek 스케줄러 실행");
		adminDAO.resetWeek();
	}
	@Override
	public void countWeek(String dayOfWeek) {
		adminDAO.countWeek(dayOfWeek);
		
	}
	@Override
	public void countMonth(String month) {
		adminDAO.countMonth(month);
	}
	@Override
	public WeekDTO getWeekData() {
		return adminDAO.getWeekData();
	}
	@Override
	public MonthDTO getMonthData() {
		return adminDAO.getMonthData();
	}


}
