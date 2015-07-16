package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemDao;
import model.Member;
@Service
public class MemServiceImpl implements MemService{
	@Autowired
	private MemDao md;
	public int insert(Member mem) {		
		return md.insert(mem);
	}
	public Member login(String id) {
		return md.login(id);
	}
	public void memdel(int memNo) {
		md.memdel(memNo);
	}

}
