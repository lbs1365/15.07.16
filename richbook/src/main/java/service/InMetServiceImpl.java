package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.InMetDao;
import model.InMet;
@Service
public class InMetServiceImpl implements InMetService{
	@Autowired
	InMetDao imd;
	public List<InMet> imtList(int memNo) {		
		return imd.imtList(memNo);
	}
	public int imtUp(InMet imt) {		
		return imd.imtUp(imt);
	}
	public InMet imtChk(InMet imt) {		
		return imd.imtChk(imt);
	}
	public void imtDel(int imtNo) {
		imd.imtDel(imtNo);
	}
	public void memdel(int memNo) {
		imd.memdel(memNo);
	}
}
