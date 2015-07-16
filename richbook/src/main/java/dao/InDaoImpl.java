package dao;

import java.util.List;

import model.In;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InDaoImpl implements InDao{
	@Autowired
	private SqlSession session;
	public List<In> inList (In in) {		
		return session.selectList("InList", in);	
	}	
	public void inInsert(In in) {
		session.insert("InInsert", in);
	}
	public void inDel(int inNo) {
		session.delete("InDel", inNo);
	}
	public int inYearMonth_year(In in) {		
		return session.selectOne("InYearMonth_year", in);
	}
	public int inYearMonth_month(In in) {
		return session.selectOne("InYearMonth_month", in);
	}
	public void memdel(int memNo) {
		session.delete("inmemdel", memNo);
	}
}
