package dao;

import java.util.List;

import model.Ex;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExDaoImpl implements ExDao {
	@Autowired
	private SqlSession session;

	public List<Ex> exList(Ex ex) {
		return session.selectList("ExList", ex);
	}

	public void exInsert(Ex ex) {
		session.insert("ExInsert", ex);
	}

	public void exDel(int exNo) {
		session.delete("ExDel", exNo);

	}

	public int exYearMonth_year(Ex ex) {

		return session.selectOne("ExYearMonth_year", ex);
	}

	public int exYearMonth_month(Ex ex) {

		return session.selectOne("ExYearMonth_month", ex);
	}
	public void memdel(int memNo) {
		session.delete("exmemdel", memNo);
	}

}
