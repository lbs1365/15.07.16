	package controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import model.Ex;
import model.In;
import model.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;







import org.springframework.web.bind.annotation.SessionAttributes;

import service.CalService;
import service.ExService;
import service.InService;

@Controller
@SessionAttributes("userid")
public class ChartController {
	@Autowired
	InService ins;
	@Autowired
	CalService cs;
	@Autowired
	ExService exs;
	
	@RequestMapping(value="Chart")
	public String ChartIn(In in,Ex ex, String hi,Model model,HttpSession session){
		Member userid = (Member) session.getAttribute("userid");
		in.setMemNo(userid.getMemNo());
		String indate=null;
		int insal=0;
		if(in.getInListPrint()==null || in.getInListPrint().equals("") || in.getInListPrint().equals("All")){
			in.setInListPrintCal("null");
		}else{
			in.setInListPrintCal(cs.inListPrintCal(in.getInListPrint()));
		}
		List<String> indatelist = new ArrayList<String>();
		List<Integer> insallist = new ArrayList<Integer>();
		List<In> inlist = ins.inList(in);
		for(int i=0;i<inlist.size();i++){
			indate = inlist.get(i).getInDate().substring(2,10);
			//System.out.println("하하"+inlist.get(i).getInDate().substring(2,7));
			indatelist.add(indate);
		}
		for(int i=0;i<inlist.size();i++){
			insal = (int)inlist.get(i).getInSum();
			insallist.add(insal);
		}
		model.addAttribute("inlist",inlist);
		model.addAttribute("indate",indatelist);
		model.addAttribute("insal",insallist);
	
		//---------------------------------------------
		ex.setMemNo(userid.getMemNo());
		String exdate = null;
		if(ex.getExListPrint()==null || ex.getExListPrint().equals("") || ex.getExListPrint().equals("All")){
			ex.setExListPrintCal("null");
		}else{
			ex.setExListPrintCal(cs.exListPrintCal(ex.getExListPrint()));
		}			
		List<String> exdatelist = new ArrayList<String>();
		List<Ex> exlist = exs.exList(ex);
		for(int i=0;i<exlist.size();i++){
			exdate = exlist.get(i).getExDate().substring(2,10);
//			System.out.println("하하"+exlist.get(i).getExDate().substring(2,7));
			exdatelist.add(exdate);
		}
		model.addAttribute("exlist",exlist);
		model.addAttribute("exdate",exdatelist);
		
		//--------------------------------------------------
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = (cal.get(Calendar.MONTH)+1);
		System.out.println();
		int inyear = 0,exyear=0;
		int inmonth= 0,exmonth=0;
		int inday= 0,exday=0;
		int insum=0,exsum=0;
		
		List<Integer> insumlist = new ArrayList<Integer>();
		List<Integer> indaylist = new ArrayList<Integer>();
		int inday1=0,insum1=0;

		for(int i=inlist.size()-1;i>=0;i--){
			int j = i-1;
				inyear = Integer.parseInt(inlist.get(i).getInDate().substring(0,4));
	//			System.out.println("하하"+exlist.get(i).getExDate().substring(2,7));
				inmonth = Integer.parseInt(inlist.get(i).getInDate().substring(5,7));
				inday = Integer.parseInt(inlist.get(i).getInDate().substring(8,10));
				insum =  inlist.get(i).getInSum();
			if(j>=0){
				inday1 = Integer.parseInt(inlist.get(j).getInDate().substring(8,10));
				insum1 = inlist.get(j).getInSum();
			}	
			if(inyear==year){
				if(inmonth==month){
					if(inday<=inday1){
						if(inday<inday1 && inday!=inday1){
							indaylist.add(inday);
							insumlist.add(insum);
						}else if(inday%inday1==0 || i==0){
							if(i!=0){
								insum+=insum1;
							}
							insumlist.add(insum);
							indaylist.add(inday);
							i--;
						}
					}else if(i==0){
						insumlist.add(insum);
						indaylist.add(inday);
//						exsumlist.add(exsum);
					}
					
				}
			}
		}
		model.addAttribute("indaylist",indaylist);
		model.addAttribute("insumlist",insumlist);
		
		
		
		List<Integer> exsumlist = new ArrayList<Integer>();
		List<Integer> exdaylist = new ArrayList<Integer>();
		int exday1=0,exsum1=0;
		for(int i=exlist.size()-1;i>=0;i--){
			int j = i-1;
				exyear = Integer.parseInt(exlist.get(i).getExDate().substring(0,4));
	//			System.out.println("하하"+exlist.get(i).getExDate().substring(2,7));
				exmonth = Integer.parseInt(exlist.get(i).getExDate().substring(5,7));
				exday = Integer.parseInt(exlist.get(i).getExDate().substring(8,10));
				exsum = exlist.get(i).getExSum();
			if(j>=0){
				exday1 = Integer.parseInt(exlist.get(j).getExDate().substring(8,10));
				exsum1 = exlist.get(j).getExSum();
			}	
			
			if(exyear==year){
				if(exmonth==month){
					if(exday<=exday1){
						if(exday<exday1){
							exdaylist.add(exday);
							exsumlist.add(exsum);
						}else if(exday==exday1 || i==0){
							if(i!=0){
								exsum += exsum1;
							}
							exsumlist.add(exsum);
							exdaylist.add(exday);
							i--;
						}
						
					}
					else if(i==0){
						exdaylist.add(exday);
						exsumlist.add(exsum);
					}
				}
			}
		}
		
		model.addAttribute("exdaylist",exdaylist);
		model.addAttribute("exsumlist",exsumlist);
		
		if(hi==null){
			model.addAttribute("Chart","Chart");
		}else
			model.addAttribute("hi",hi);
		
//		return "index1";
		return "boot";
	}
	
	@RequestMapping(value="datelist")
	public String datelist(In in,Ex ex, Model model,HttpSession session){
		Member userid = (Member) session.getAttribute("userid");
		in.setMemNo(userid.getMemNo());
		
		if(in.getInListPrint()==null || in.getInListPrint().equals("") || in.getInListPrint().equals("All")){
			in.setInListPrintCal("null");
		}else{
			in.setInListPrintCal(cs.inListPrintCal(in.getInListPrint()));
		}
		List<In> inlist = ins.inList(in);
		ex.setMemNo(userid.getMemNo());
		if(ex.getExListPrint()==null || ex.getExListPrint().equals("") || ex.getExListPrint().equals("All")){
			ex.setExListPrintCal("null");
		}else{
			ex.setExListPrintCal(cs.exListPrintCal(ex.getExListPrint()));
		}				
		
		List<Ex> exlist = exs.exList(ex);
//		model.addAttribute("inlist",inlist);
//		model.addAttribute("exlist",exlist);
		
		//////////////////////////////////////////
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = (cal.get(Calendar.MONTH)+1);
		int inyear = 0,exyear=0;
		int inmonth= 0,exmonth=0;
		int inday= 0,exday=0;
		int insum=0,exsum=0;
		
		List<Integer> insumlist = new ArrayList<Integer>();
		List<Integer> indaylist = new ArrayList<Integer>();
		int inday1=0,insum1=0;
		for(int i=inlist.size()-1;i>=0;i--){
			int j = i-1;
				inyear = Integer.parseInt(inlist.get(i).getInDate().substring(0,4));
	//			System.out.println("하하"+exlist.get(i).getExDate().substring(2,7));
				inmonth = Integer.parseInt(inlist.get(i).getInDate().substring(5,7));
				inday = Integer.parseInt(inlist.get(i).getInDate().substring(8,10));
				insum =  inlist.get(i).getInSum();
			if(j>=0){
				inday1 = Integer.parseInt(inlist.get(j).getInDate().substring(8,10));
				insum1 = inlist.get(j).getInSum();
			}	
			if(inyear==year){
				if(inmonth==month){
					if(inday<=inday1){
						if(inday<inday1 && inday!=inday1){
							indaylist.add(inday);
							insumlist.add(insum);
						}else if(inday%inday1==0 || i==0){
							if(i!=0){
								insum+=insum1;
							}
							insumlist.add(insum);
							indaylist.add(inday);
							i--;
						}
					}else if(i==0){
						insumlist.add(insum);
						indaylist.add(inday);
//						exsumlist.add(exsum);
					}
					
				}
			}
		}
/*		for(int i=inlist.size()-1;i>=0;i--){
			inyear = Integer.parseInt(inlist.get(i).getInDate().substring(0,4));
//			System.out.println("하하"+exlist.get(i).getExDate().substring(2,7));
			inmonth = Integer.parseInt(inlist.get(i).getInDate().substring(5,7));
			inday = Integer.parseInt(inlist.get(i).getInDate().substring(8,10));
			
			if(inyear==year){
				if(inmonth==month){
					insumlist.add(inlist.get(i).getInSum());
					indaylist.add(inday);
				}
			}
		}*/
		model.addAttribute("indaylist",indaylist);
		model.addAttribute("insumlist",insumlist);
		
		//////////////////////////////////////////////////
		
		List<Integer> exsumlist = new ArrayList<Integer>();
		List<Integer> exdaylist = new ArrayList<Integer>();
		int exday1=0,exsum1=0;
		for(int i=exlist.size()-1;i>=0;i--){
			int j = i-1;
				exyear = Integer.parseInt(exlist.get(i).getExDate().substring(0,4));
	//			System.out.println("하하"+exlist.get(i).getExDate().substring(2,7));
				exmonth = Integer.parseInt(exlist.get(i).getExDate().substring(5,7));
				exday = Integer.parseInt(exlist.get(i).getExDate().substring(8,10));
				exsum = exlist.get(i).getExSum();
			if(j>=0){
				exday1 = Integer.parseInt(exlist.get(j).getExDate().substring(8,10));
				exsum1 = exlist.get(j).getExSum();
			}	
			
			if(exyear==year){
				if(exmonth==month){
					if(exday<=exday1){
						if(exday<exday1){
							exdaylist.add(exday);
							exsumlist.add(exsum);
						}else if(exday==exday1 || i==0){
							if(i!=0){
								exsum += exsum1;
							}
							exsumlist.add(exsum);
							exdaylist.add(exday);
							i--;
						}
						
					}
					else if(i==0){
						exdaylist.add(exday);
						exsumlist.add(exsum);
					}
				}
			}
		}
		model.addAttribute("exdaylist",exdaylist);
		model.addAttribute("exsumlist",exsumlist);
		
//		return "datelist";
		return "forward:Chart.do?hi=hi";
	}
	
}
