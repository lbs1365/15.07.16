package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.InMet;
@Repository
public class InMetDaoImpl implements InMetDao{
	@Autowired
	SqlSession session;
	public List<InMet> imtList(int memNo) {
		return session.selectList("InMetList",memNo);
	}
	public int imtUp(InMet imt) {		
		return session.insert("ImtUp",imt);
	}
	public InMet imtChk(InMet imt) {		
		return session.selectOne("ImtChk", imt);
	}
	public void imtDel(int imtNo) {		
		session.delete("ImtDel", imtNo);
	}
	public void memdel(int memNo) {
		session.delete("inmmemdel", memNo);
	}
}
