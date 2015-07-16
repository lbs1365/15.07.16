package service;

import java.util.List;

import model.Memo;

public interface MemoService {
	List<Memo> MemoList(int memNo);
	void MemoInsert(Memo memo);
	void MemoDel(int MemoNo);
	void memdel(int memNo);
}
