package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Memo;
@Repository
public class MemoDaoImpl implements MemoDao{
	@Autowired
	private SqlSession session;
	public List<Memo> MemoList(int memNo) {
		return session.selectList("MemoList",memNo);
		//세션 들어간게 xml에서 root-context.xml에서 데이터 베이스와 연결 
		//뒤의 MemoList는 controller와 연결된다. 
	}

	public void MemoInsert(Memo memo) {
		session.insert("MemoInsert", memo);
	}

	public void MemoDel(int MemoNo) {
		session.delete("MemoDel", MemoNo);
	}
	public void memdel(int memNo) {
		session.delete("memomemdel", memNo);
	}
}
