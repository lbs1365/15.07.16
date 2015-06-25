package dao;

import java.util.List;

import model.In;

public interface InDao {
	List<In> inList (In in);
	void inInsert (In in);
	void inDel (int inNo);
	int inYearMonth (In in);
}
