package controller;



import javax.servlet.http.HttpSession;

import model.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import service.ExMetService;
import service.ExService;
import service.InMetService;
import service.InService;
import service.MemService;
import service.MemoService;

@Controller
@SessionAttributes("userid")
public class MemController {
	@Autowired
	private MemService ms;
	@Autowired
	ExService exs;
	@Autowired
	ExMetService emts;
	@Autowired
	InService ins;
	@Autowired
	InMetService imts;
	@Autowired
	MemoService memos;
	@RequestMapping(value="boot")
	public String boot(Model model){
		return "boot";
	}
	@RequestMapping(value="main")
	public String main_(Model model){
		return "main";
	}
	@RequestMapping(value="logout")
	public String logout(Model model, SessionStatus session){
		session.setComplete();
		return "main";
	}
	@RequestMapping(value="memIn")	
	public String memIn(String mailChk, Model model) {
		if(mailChk.equals("noChk")){
			model.addAttribute("idChk","null");		
		}
		return "memIn";
	}
	@RequestMapping(value="IdChk")
	public String Idchk(String id,String pass,Model model){
		model.addAttribute("id", id);
		if(pass.equals("no")){
			model.addAttribute("pass", "null");
		}else{
			model.addAttribute("pass", pass);
		}
		return "loding";
	}
	@RequestMapping(value="mailChk")	
	public String mailChk(String mailChk, Model model) {
		Member mem = ms.login(mailChk);
		if(mem ==null || mem.equals("")){
			model.addAttribute("idChk","인증완료");
			model.addAttribute("id",mailChk);			
			return "forward:memIn.do";
		}else{
			model.addAttribute("msg","이미 가입된 ID 입니다.");
			model.addAttribute("idChk","null");	
			return "memIn";
		}
	}
	@RequestMapping(value="loginform")	
	public String memloginform(Model model) {
		return "login";
	}
	@RequestMapping(value="memInsert")
	public String insertMember(Member mem, Model model) {		
		int result = ms.insert(mem);
		if (result > 0) return "main_";
		else {
			model.addAttribute("msg","입력 실패 확인해 보세요");
			return "forward:memIn.do";
		}
	}
	@RequestMapping(value="login")
	public String login(String id, String pw, Model model){
		Member mem = ms.login(id);
		if(mem ==null || mem.equals("")){ 
			model.addAttribute("msg","아이디가 없습니다.");
			return "forward:main.do";
		}else if (pw.equals(mem.getPw())){
			model.addAttribute("userid", mem);
			return "forward:MemoList.do";
		}
		else {
			model.addAttribute("msg","암호가 틀렸습니다.");
			//return "forward:loginform.do";
			return "forward:main.do";
		}
	}
	@RequestMapping(value="Memdel")
	public String memdel(Model model, HttpSession session){
		Member userid = (Member) session.getAttribute("userid");
		System.out.println(userid.getMemNo());
		ms.memdel(userid.getMemNo());
		exs.memdel(userid.getMemNo());
		emts.memdel(userid.getMemNo());
		ins.memdel(userid.getMemNo());
		imts.memdel(userid.getMemNo());
		memos.memdel(userid.getMemNo());
		return "memdel";
	}
	@RequestMapping(value="PassChk")
	public String PassChk(){
		return "passchk";
	}
}
