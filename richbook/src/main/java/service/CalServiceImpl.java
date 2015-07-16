package service;

import java.util.Calendar;

import org.springframework.stereotype.Service;
@Service
public class CalServiceImpl implements CalService{
	int year;
	int month;
	int day;
	int lastDay, TwolastDay;
	int calDay;
	int lastcalDay;
	int inListPrintCal;
	int exListPrintCal;
	public String inListPrintCal(String inListPrint){
		Calendar cal = Calendar.getInstance();
		day = cal.get(Calendar.DATE);
		if(inListPrint.equals("Week")){
			calDay = day - 6;
		}else if(inListPrint.equals("Month")){
			calDay = day - 29;
		}else if(inListPrint.equals("ThreeMonth")){
			calDay = day - 89;
		}		
		if(calDay <= 0 && calDay >= -28 ){
			month = cal.get(Calendar.MONTH);				
			year = cal.get(Calendar.YEAR);
			if(month == 0){
				year = year - 1;
				month = 12;
				lastDay = 31;
			}else{
				cal.set(Calendar.MONTH, month-1);
				lastDay = cal.getActualMaximum(Calendar.DATE);
			}
			lastcalDay = lastDay + calDay;
			if(lastcalDay <= 0){
				cal.set(Calendar.MONTH, month-2);
				lastDay = cal.getActualMaximum(Calendar.DATE);
				calDay = lastcalDay;
				month = month - 1;
			}
			lastcalDay = lastDay + calDay;			
		}else if(calDay <=-29){
			month = cal.get(Calendar.MONTH);				
			year = cal.get(Calendar.YEAR);
			if(month == 4){
				cal.set(Calendar.MONTH, month-2);
				TwolastDay = cal.getActualMaximum(Calendar.DATE);
				calDay = calDay + TwolastDay + 31;
				if(calDay <= 0){					
					month = 1;
					lastDay = 31;
					lastcalDay = lastDay + calDay;
				}else {
					month = 2;
					lastcalDay = calDay;
				}			
			}else if(month == 3){				
				cal.set(Calendar.MONTH, month-1);
				TwolastDay = cal.getActualMaximum(Calendar.DATE);
				calDay = calDay + TwolastDay + 31;
				if(calDay <= 0){
					year = year - 1;
					month = 12;
					lastDay = 31;
					lastcalDay = lastDay + calDay;
				}else {
					month = 1;
					lastcalDay = calDay;
				}			
			}else if(month == 2){				
				calDay = calDay + 62;
				year = year - 1;
				if(calDay <= 0){
					month = 11;
					lastDay = 30;
					lastcalDay = lastDay + calDay;
				}else {					
					month = 12;
					lastcalDay = calDay;
				}
			}else if(month == 1){				
				calDay = calDay + 61;
				year = year - 1;
				if(calDay <= 0){
					month = 10;
					lastDay = 31;
					lastcalDay = lastDay + calDay;
				}else {					
					month = 11;
					lastcalDay = calDay;
				}
			}else if(month == 9){				
				calDay = calDay + 62;			
				if(calDay <= 0){
					month = 6;
					lastDay = 30;
					lastcalDay = lastDay + calDay;
				}else {					
					month = 7;
					lastcalDay = calDay;
				}
			}else {
				calDay = calDay + 61;
				if(calDay <= 0){
					cal.set(Calendar.MONTH, month-1);
					lastDay = cal.getActualMaximum(Calendar.DATE);
					month = month-2;
					lastcalDay = lastDay + calDay;
				}else {					
					month = month - 2;
					lastcalDay = calDay;
				}
			}
		}else{
			year = cal.get(Calendar.YEAR);
			month = (cal.get(Calendar.MONTH)+1);				
			lastcalDay = calDay;
		}
		String inListPrintCal = year +"-"+ month +"-"+ lastcalDay;
		return inListPrintCal;		
	}
	public int inYearMonthListPrintCal(String YearMonth) {
		Calendar cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR);
		inListPrintCal = year;
		return inListPrintCal;
	}
	public String exListPrintCal(String exListPrint) {
		Calendar cal = Calendar.getInstance();
		day = cal.get(Calendar.DATE);
		if(exListPrint.equals("Week")){
			calDay = day - 6;
		}else if(exListPrint.equals("Month")){
			calDay = day - 29;
		}else if(exListPrint.equals("ThreeMonth")){
			calDay = day - 89;
		}		
		if(calDay <= 0 && calDay >= -28 ){
			month = cal.get(Calendar.MONTH);				
			year = cal.get(Calendar.YEAR);
			if(month == 0){
				year = year - 1;
				month = 12;
				lastDay = 31;
			}else{
				cal.set(Calendar.MONTH, month-1);
				lastDay = cal.getActualMaximum(Calendar.DATE);
			}
			lastcalDay = lastDay + calDay;
			if(lastcalDay <= 0){
				cal.set(Calendar.MONTH, month-2);
				lastDay = cal.getActualMaximum(Calendar.DATE);
				calDay = lastcalDay;
				month = month - 1;
			}
			lastcalDay = lastDay + calDay;			
		}else if(calDay <=-29){
			month = cal.get(Calendar.MONTH);				
			year = cal.get(Calendar.YEAR);
			if(month == 4){
				cal.set(Calendar.MONTH, month-2);
				TwolastDay = cal.getActualMaximum(Calendar.DATE);
				calDay = calDay + TwolastDay + 31;
				if(calDay <= 0){					
					month = 1;
					lastDay = 31;
					lastcalDay = lastDay + calDay;
				}else {
					month = 2;
					lastcalDay = calDay;
				}			
			}else if(month == 3){				
				cal.set(Calendar.MONTH, month-1);
				TwolastDay = cal.getActualMaximum(Calendar.DATE);
				calDay = calDay + TwolastDay + 31;
				if(calDay <= 0){
					year = year - 1;
					month = 12;
					lastDay = 31;
					lastcalDay = lastDay + calDay;
				}else {
					month = 1;
					lastcalDay = calDay;
				}			
			}else if(month == 2){				
				calDay = calDay + 62;
				year = year - 1;
				if(calDay <= 0){
					month = 11;
					lastDay = 30;
					lastcalDay = lastDay + calDay;
				}else {					
					month = 12;
					lastcalDay = calDay;
				}
			}else if(month == 1){				
				calDay = calDay + 61;
				year = year - 1;
				if(calDay <= 0){
					month = 10;
					lastDay = 31;
					lastcalDay = lastDay + calDay;
				}else {					
					month = 11;
					lastcalDay = calDay;
				}
			}else if(month == 9){				
				calDay = calDay + 62;			
				if(calDay <= 0){
					month = 6;
					lastDay = 30;
					lastcalDay = lastDay + calDay;
				}else {					
					month = 7;
					lastcalDay = calDay;
				}
			}else {
				calDay = calDay + 61;
				if(calDay <= 0){
					cal.set(Calendar.MONTH, month-1);
					lastDay = cal.getActualMaximum(Calendar.DATE);
					month = month-2;
					lastcalDay = lastDay + calDay;
				}else {					
					month = month - 2;
					lastcalDay = calDay;
				}
			}
		}else{
			year = cal.get(Calendar.YEAR);
			month = (cal.get(Calendar.MONTH)+1);				
			lastcalDay = calDay;
		}
		String exListPrintCal = year +"-"+ month +"-"+ lastcalDay;
		return exListPrintCal;		
	}
	
	public int exYearMonthListPrintCal(String YearMonth) {
		
		Calendar cal = Calendar.getInstance();
		year = cal.get(Calendar.YEAR);
		exListPrintCal = year;
		return exListPrintCal;
	}
	
}
