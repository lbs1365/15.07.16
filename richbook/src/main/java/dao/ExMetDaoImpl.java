package dao;

import java.util.List;

import model.ExMet;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ExMetDaoImpl implements ExMetDao{
	@Autowired
	SqlSession session;
	public List<ExMet> emtList(int memNo) {
		return session.selectList("ExMetList",memNo);
	}
	public int emtUp(ExMet emt) {
		return session.insert("EmtUp",emt);
	}

	public ExMet emtChk(ExMet emt) {
		return session.selectOne("EmtChk", emt);
	}
	public void emtDel(int emtNo) {
		session.delete("EmtDel", emtNo);
	}
	public void memdel(int memNo) {
		session.delete("exmmemdel", memNo);
	}

}
