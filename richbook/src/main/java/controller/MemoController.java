package controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import model.Member;
import model.Memo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import service.MemoService;

@Controller
@SessionAttributes("userid")
public class MemoController {
	@Autowired
	MemoService memos;
	
	@RequestMapping(value="MemoList")	//value값은 .do가 연결되어 있음 주소
	public String MemoList(Memo memo, Model model, HttpSession session) {//주소집
		Member userid = (Member) session.getAttribute("userid");
		memo.setMemNo(userid.getMemNo());
		List<Memo> memoList = memos.MemoList(userid.getMemNo());
		model.addAttribute("MemoList",memoList);
		
		//비교할 현재 날짜 보내기
		SimpleDateFormat DateFormat =new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
		Date currentTime = new Date();
		String nowDate =DateFormat.format(currentTime);
		model.addAttribute("nowDate",nowDate);
		model.addAttribute("memo","memo");
		return "forward:datelist.do";//집에서 내보냄
	}
	@RequestMapping(value="MemoInsert")
	public String MemoInsert(String memoDate,String content,Memo memo , Model model,HttpSession session){
		Member userid = (Member) session.getAttribute("userid");
		memo.setMemNo(userid.getMemNo());
		memo.setContent(content);
		memo.setMemoDate(memoDate);
		memos.MemoInsert(memo);
		
		return "redirect:MemoList.do";
	}
	@RequestMapping(value="MemoDel")
	public  String MemoDel(Memo memo,int memoNo, Model model){
		memo.setMemoNo(memoNo);
		memos.MemoDel(memoNo);
		
		return "redirect:MemoList.do";
	}
}
