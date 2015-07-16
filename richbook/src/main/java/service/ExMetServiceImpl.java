package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ExMetDao;
import model.ExMet;
@Service
public class ExMetServiceImpl implements ExMetService{
	
	@Autowired
	ExMetDao exmd;
	public List<ExMet> emtList(int memNo) {
		
		return exmd.emtList(memNo);
	}
	public int emtUp(ExMet emt) {
		return exmd.emtUp(emt);
	}
	public ExMet emtChk(ExMet emt) {
		
		return exmd.emtChk(emt);
	}
	public void emtDel(int emtNo) {
		exmd.emtDel(emtNo);
	}
	public void memdel(int memNo) {
		exmd.memdel(memNo);
	}
}

	