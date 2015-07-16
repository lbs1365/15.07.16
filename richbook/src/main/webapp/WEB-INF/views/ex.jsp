<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="path.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path %>/resources/css/table.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
<script type="text/javascript">
	$(function(){
		$('.exDel').css('cursor', 'pointer');
		$('.exDel').click(function() {
			var exNo = $(this).attr('id');			
			location.href='ExDel.do?exNo='+exNo;
		});
		$('.exDate').css('cursor', 'pointer');
		$('.exDate').click(function() {
			var exSort = $(this).attr('class');
			var exArr = $(this).attr('id');			
			var exListPrint = $(':radio[name="exListPrint"]:checked').val();
			var exYearMonth_year = $('#exYearMonth_year').val();
			var exYearMonth_month = $('#exYearMonth_month').val();
			var exSearchCho = $('#exSearchCho').val();
			var exSearch = $('#exSearch').val();	
			if(exListPrint != 'YearMonth'){
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='+exListPrint;				
			}else if(exSearch != null){
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='
						+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month
						+'&exSearch='+exSearch+'&exSearchCho='+exSearchCho;
			}else{
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='
				+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month;				
			}
		});
		$('.emtNo').css('cursor', 'pointer');
		$('.emtNo').click(function() {
			var exSort = $(this).attr('class');
			var exArr = $(this).attr('id');
			var exListPrint = $(':radio[name="exListPrint"]:checked').val();
			var exYearMonth_year = $('#exYearMonth_year').val();
			var exYearMonth_month = $('#exYearMonth_month').val();
			var exSearchCho = $('#exSearchCho').val();
			var exSearch = $('#exSearch').val();	
			if(exListPrint != 'YearMonth'){
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='+exListPrint;				
			}else if(exSearch != null){
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='
				+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month
				+'&exSearch='+exSearch+'&exSearchCho='+exSearchCho;
			}else{
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='
						+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month;
			}
		});	
		$('.exSum').css('cursor', 'pointer');
		$('.exSum').click(function() {
			var exSort = $(this).attr('class');
			var exArr = $(this).attr('id');
			var exListPrint = $(':radio[name="exListPrint"]:checked').val();
			var exYearMonth_year = $('#exYearMonth_year').val();
			var exYearMonth_month = $('#exYearMonth_month').val();
			var exSearchCho = $('#exSearchCho').val();
			var exSearch = $('#exSearch').val();	
			if(exListPrint != 'YearMonth'){
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='+exListPrint;				
			}else if(exSearch != null){
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='
				+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month
				+'&exSearch='+exSearch+'&exSearchCho='+exSearchCho;
			}else{
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='
						+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month;
			}
		});	
		$('.exCon').css('cursor', 'pointer');
		$('.exCon').click(function() {
			var exSort = $(this).attr('class');
			var exArr = $(this).attr('id');	
			var exListPrint = $(':radio[name="exListPrint"]:checked').val();
			var exYearMonth_year = $('#exYearMonth_year').val();
			var exYearMonth_month = $('#exYearMonth_month').val();
			var exSearchCho = $('#exSearchCho').val();
			var exSearch = $('#exSearch').val();	
			if(exListPrint != 'YearMonth'){
				location.href='Ex.do?exArr='+exArr+'&exSort='+exSort+'&exListPrint='+exListPrint;				
			}else if(exSearch != null){
				location.href='Ex.do?inArr='+exArr+'&exSort='+exSort+'&exListPrint='
				+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month
				+'&exSearch='+exSearch+'&exSearchCho='+exSearchCho;
			}else{
				location.href='Ex.do?inArr='+exArr+'&exSort='+exSort+'&exListPrint='
						+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month;
			}
		});
		$(':radio[name="exListPrint"]').click(function() {
			var exListPrint = $(this).val();
			location.href='Ex.do?exListPrint='+exListPrint;
		});
		$('#exYearMonth_year').change(function() {
			var exYearMonth_year = $(this).val();
			var exListPrint = $(':radio[name="exListPrint"]:checked').val();
			location.href='Ex.do?exListPrint='+exListPrint+'&exYearMonth_year='+exYearMonth_year;
		});		
		$('#exYearMonth_month').change(function() {
			var exYearMonth_month = $(this).val();
			var exYearMonth_year = $('#exYearMonth_year').val();
			var exListPrint = $(':radio[name="exListPrint"]:checked').val();
			location.href='Ex.do?exListPrint='+exListPrint+'&exYearMonth_year='+exYearMonth_year+'&exYearMonth_month='+exYearMonth_month;
		});
		$('#exSearch').keydown(function(e) {
			var exSearchCho = $('#exSearchCho').val();
			var exSearch = $('#exSearch').val();
			var exListPrint = $(':radio[name="exListPrint"]:checked').val();
			var exYearMonth_year = $('#exYearMonth_year').val();
			var exYearMonth_month = $('#exYearMonth_month').val();
			if(exListPrint != 'YearMonth'){
				if(e.keyCode===13){
					location.href='Ex.do?exListPrint='+exListPrint+'&exSearch='+exSearch
							+'&exSearchCho='+exSearchCho;	
				}
			}else{
				if(exYearMonth_month != null){
					if(e.keyCode===13){
						location.href='Ex.do?exSearch='+exSearch+'&exSearchCho='+exSearchCho
							+'&exListPrint='+exListPrint+'&exYearMonth_year='+exYearMonth_year
							+'&exYearMonth_month='+exYearMonth_month;							
					}				
				}else{
					if(e.keyCode===13){
						location.href='Ex.do?exSearch='+exSearch+'&exSearchCho='+exSearchCho
						+'&exListPrint='+exListPrint+'&exYearMonth_year='+exYearMonth_year;							
					}
				}
			}
		});
	});	
</script>
</head>
<body>
	<a href="#"	class="listAtag" onclick="window.open('EmtUpList.do','분류 추가','width=300,height=500,left=250,top=150')"
	>분류 추가</a><br><br>
	<input type="radio" name="exListPrint" value="All" 
		<c:if test="${ex.exListPrint == null || ex.exListPrint.equals('All')}">
		checked="checked"</c:if>>전체
	<input type="radio" name="exListPrint" value="Week"
		<c:if test="${ex.exListPrint.equals('Week')}">
		checked="checked"</c:if>>7일
	<input type="radio" name="exListPrint" value="Month" 
		<c:if test="${ex.exListPrint.equals('Month')}">
		checked="checked"</c:if>>30일
	<input type="radio" name="exListPrint" value="ThreeMonth" 
		<c:if test="${ex.exListPrint.equals('ThreeMonth')}">
		checked="checked"</c:if>>90일
	<input type="radio" name="exListPrint" value="YearMonth" 
		<c:if test="${ex.exListPrint.equals('YearMonth')}">
		checked="checked"</c:if>>년&amp;월
	<c:if test="${ex.exListPrint.equals('YearMonth')}">	
		<select name="exYearMonth_year" id="exYearMonth_year">		
			<c:forEach var="year" items="${year }">
				<option value="${year}" 
				<c:if test="${ex.exYearMonth_year == year}">selected="selected"</c:if>
				>${year}</option>
			</c:forEach>
		</select>
		<select name="exYearMonth_month" id="exYearMonth_month">
			<option value="0">월 선택</option>
			<c:forEach var="month" items="${month }">
				<option value="${month}"
				<c:if test="${ex.exYearMonth_month == month}">selected="selected"</c:if>
				>${month}월</option>
			</c:forEach>
		</select>
	</c:if>		
<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	<div id="searchdiv">
		<select id="exSearchCho">
			<option value="emtName" 
				<c:if test="${ex.exSearchCho.equals('emtName')}"> selected="selected"</c:if>
			>분류</option>		
			<option value="exCon"
				<c:if test="${ex.exSearchCho.equals('exCon')}"> selected="selected"</c:if>
			>내역</option>
		</select>
		<input type="search" id="exSearch" value="${ex.exSearch}" required="required">					
	</div><br><br>
	<form action="ExInsert.do" method="post">
		<table border="1"  id="insert">
			<tr>
				<th><div align="center">No</div></th>				
				<c:if test="${ex.exSort == null || ex.exSort.equals('exDate')}">
					<th>
						<c:if test="${ex.exArr == null}">
							<div class="exDate" id="Asc" align="center">날짜 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="exDate" id="Asc" align="center">날짜 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="exDate" id="Desc" align="center">날짜 ▲</div>
						</c:if>						
					</th>
					<th><div class="emtNo" id="Desc" align="center">분류</div></th>
					<th><div class="exSum" id="Desc" align="center">금액</div></th>
					<th><div class="exCon" id="Desc" align="center">내역</div></th>			
				</c:if>								
				<c:if test="${ex.exSort.equals('emtNo')}">
					<th><div class="exDate" id="Desc" align="center">날짜</div></th>
					<th>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="emtNo" id="Asc" align="center">분류 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="emtNo" id="Desc" align="center">분류 ▲</div>
						</c:if>
					</th>
					<th><div class="exSum" id="Desc" align="center">금액</div></th>
					<th><div class="exCon" id="Desc" align="center" >내역</div></th>			
				</c:if>
				<c:if test="${ex.exSort.equals('exSum')}">
					<th><div class="exDate" id="Desc" align="center">날짜</div></th>	
					<th><div class="emtNo" id="Desc" align="center">분류</div></th>		
					<th>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="exSum" id="Asc" align="center">금액 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="exSum" id="Desc" align="center">금액 ▲</div>
						</c:if>
					</th>
					<th><div class="exCon" id="Desc" align="center">내역</div></th>
				</c:if>
				<c:if test="${ex.exSort.equals('exCon')}">
					<th><div class="exDate" id="Desc" align="center">날짜</div></th>
					<th><div class="emtNo" id="Desc" align="center">분류</div></th>
					<th><div class="exSum" id="Desc" align="center">금액</div></th>
					<th>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="exCon" id="Asc" align="center">내역 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="exCon" id="Desc" align="center">내역 ▲</div>
						</c:if>
					</th>
				</c:if>
				<th><div align="center">기타</div></th>				
				<th><div align="center">추가&삭제</div></th>
			</tr>
			<tr>
				<td>입력</td>
				<td><input type="date" name="exDate" required="required" id="datenum"></td>
				<td><select name="emtNo" required="required" id="emtNo">
							<option value="" disabled selected>분류추가 해주세요.</option>
						<c:forEach var="emtlist" items="${emtlist }">
							<option value="${emtlist.emtNo }">${emtlist.emtName }</option>
						</c:forEach>
				</select></td>
				<td><input type="number" name="exSum" min="0" required="required"></td>
				<td><input type="text" name="exCon" required="required"></td>
				<td><input type="text" name="exEtc"></td>
				<td align="center"><input type="submit" value="추가"></td>
			</tr>
			<c:set var="i" value="${exlist.size() }" />		
			<c:forEach var="exlist" items="${exlist }">
				<tr>
					<td>${i }</td>
					<td>
						<fmt:parseDate value="${exlist.exDate }" pattern ="yyyy-MM-dd" var="date"/>						
						<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
					</td>
					<td><c:forEach var="emtlist" items="${emtlist }">
							<c:if test="${exlist.emtNo == emtlist.emtNo }">${emtlist.emtName }</c:if>
						</c:forEach></td>
					<td><fmt:formatNumber pattern="#,###">${exlist.exSum }</fmt:formatNumber>원</td>
					<td>${exlist.exCon }</td>
					<td>${exlist.exEtc }</td>					
					<td align="center"><div class="exDel" id="${exlist.exNo}">x</div></td>
				</tr>
				<c:set var="i" value="${i-1 }" />				
			</c:forEach>						
		</table>		
	</form>		
</body>
</html>