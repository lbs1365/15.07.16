package dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Member;
@Repository
public class MemDoaImpl implements MemDao{
	@Autowired
	private SqlSession session;
	public int insert(Member mem) {			
			return session.insert("insert",mem);		}
	}

