package dao;

import model.Member;

public interface MemDao {	
	int insert(Member mem);	
	Member login(String id);
	void memdel(int memNo);
}
