<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="path.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
<link href="<%=path %>/resources/css/main_.css" rel="stylesheet">
<style type="text/css">
	#memIn{
		border: 1px solid #bcbcbc;
		margin: 30px;
	}
</style>
<script type="text/javascript">	
	$(function () {
		/* $('#idChk').click(function() {
			var mail = $('#id').val();
			if(mail.indexOf('@')!=-1){
				window.open('IdEmailChk.do?mailAddr='+mail,'분류 추가','width=1000,height=1000');
				
			}else{
				alert("올바른 e-mail 주소를 입력하세요");
			}
		}); */
		
		/* 	$('#cb').click(function() {
			if($(this).attr('class')!= 'cb'){
				$(this).addClass("cb");		
				window.open('IdEmailChk.do','분류 추가','width=1000,height=1000');
			}else{
				$(this).removeClass("cb");				
			}			
		}); */
	});	
</script>
</head>
<body>

<form 
	<c:if test="${idChk.equals('null') }">
		action="IdChk.do" 
	</c:if>
	<c:if test="${idChk.equals('인증완료') }">
		action="memInsert.do"
	</c:if>
method="post">
	<h2>회원가입을 환영합니다~</h2>
<table id="memIn">
	<c:if test="${idChk.equals('null') }">
		<tr>
			<td style="font-size: 20px;">아이디(e-mail)</td>
			<td>		
				<input type="email" id="id" name="id" required="required">
				<input type="hidden" name="pass" value="no">
				<input type="submit" id="idChk" value="아이디(이메일확인)">			
			</td>
		</tr>	
	</c:if>				
		<!-- <input type="checkbox" id="cb"> -->		
	<c:if test="${idChk.equals('인증완료') }">
	<tr>
		<td>아이디(e-mail)</td>
		<td><input type="hidden" name="id" value="${id }">${id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${idChk}</td>			
	</tr>
	<tr>
		<td>비밀번호</td><td><input type="password" name="pw" required="required"></td>
	</tr>
	<tr>
		<td>이름</td><td><input type="text" name="name" required="required"></td>
	</tr>
	<tr>
		<td>생년월일</td><td><input type="date" name="birth" required="required"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<input type="radio" name="gen" value="man" checked="checked">남
			<input type="radio" name="gen" value="woman">여
		</td>
	</tr>
	<tr>
		<td>직업</td>
		<td>
			<select name="job">
				<option value="worker" selected="selected">직장인</option>
				<option value="indiv">자영업자</option>
				<option value="student">학생</option>
				<option value="player">백수</option>
				<option value="housekeeper">주부</option>
				<option value="etc">기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<td><input type="submit" value="가입"></td>
	</tr>
	</c:if>	
</table>
<font color="red" style="margin: 30px;">${msg}</font>
</form>
</body>
</html>