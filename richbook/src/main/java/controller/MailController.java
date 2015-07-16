package controller;

import javax.annotation.Resource;

import model.MailChk;
import model.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.MailServiceImpl;
import service.MemServiceImpl;

@Controller
public class MailController {
	@Resource(name = "MailServiceImpl") //@Autowired 같은 기능
	private MailServiceImpl emailPublisherService;
	@Autowired
	MemServiceImpl ms;

	@RequestMapping(value = "IdEmailChk")
	public String sendMail(MailChk mc, Model model) throws Exception {		
		try {
			String mailAddr = mc.getId();				
			String mailCon = "<a href='http://211.183.2.120:8181/richbook/mailChk.do?mailChk="
					+mailAddr+"'>이메일 본인 확인</a>";
			emailPublisherService.mailSe(mailCon,mailAddr);
		    int addrcnt = mc.getId().indexOf("@");
		    String addr = mc.getId().substring(addrcnt,mc.getId().length());
		    model.addAttribute("addr", addr);
		    return "success";		
		} catch (Exception e) {
			throw e;
		}
	}
	@RequestMapping(value="PassEmail")
	public String pass(MailChk mc,Model model) throws Exception{
		try{
			String id = mc.getId();
			Member mem= ms.login(id);
			String id2 = mem.getId();
			if(id.equals(id2)){
				String pass =  "<h2>암호찾기메일입니다.<h2><br><br><font color='blue'>아이디 : "+id+"</font><p>"
						+ "<font color='red'> 암호 :"+mem.getPw()+"</font>";
				emailPublisherService.mailSe(pass,id);
				int addrcnt = mc.getId().indexOf("@");
			    String addr = mc.getId().substring(addrcnt,mc.getId().length());
			    model.addAttribute("addr", addr);
			    return "success";
			}else{
				model.addAttribute("passmsg", "존재하지않는 ID입니다.");
				return "passchk";
			}
		} catch (Exception e) {
			model.addAttribute("passmsg", "존재하지않는 ID입니다.");
			return "passchk";
		}
	}
	
}
