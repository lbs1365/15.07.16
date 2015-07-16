package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ExDao;
import model.Ex;
@Service
public class ExServiceImpl implements ExService{
	@Autowired
	ExDao exd;
	public List<Ex> exList(Ex ex) {
		return exd.exList(ex);
	}
	public void exInsert(Ex ex) {
		exd.exInsert(ex);
	}
	public void exDel(int exNo) {
		exd.exDel(exNo);
		
	}
	public int exYearMonth_year(Ex ex) {
		
		return exd.exYearMonth_year(ex);
	}
	public int exYearMonth_month(Ex ex) {
		
		return exd.exYearMonth_month(ex);
	}
	public void memdel(int memNo) {
		exd.memdel(memNo);
	}
}
