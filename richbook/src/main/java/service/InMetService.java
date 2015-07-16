package service;

import java.util.List;

import model.InMet;

public interface InMetService {
	List<InMet> imtList (int memNo);
	int imtUp (InMet imt);
	InMet imtChk (InMet imt);
	void imtDel (int imtNo);
	void memdel(int memNo);
}
