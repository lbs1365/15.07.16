package service;

import model.Member;

public interface MemService {
	int insert(Member mem);
	Member login(String id);
	void memdel(int memNo);
}
