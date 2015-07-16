package dao;

import java.util.List;

import model.Ex;

public interface ExDao {
	List<Ex> exList(Ex ex);
	void exInsert(Ex ex);
	void exDel(int exNo);
	int exYearMonth_year (Ex ex);
	int exYearMonth_month (Ex ex);
	void memdel(int memNo);

}
