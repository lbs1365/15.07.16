package service;

import java.util.List;

import model.ExMet;

public interface ExMetService {
	List<ExMet> emtList (int memNo);
	int emtUp (ExMet emt);
	ExMet emtChk (ExMet emt);
	void emtDel(int emtNo);
	void memdel(int memNo);
}
