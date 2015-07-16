<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="path.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path %>/resources/js/jquery.js" type="text/javascript"></script>
<style type="text/css">
h2{
		font-size: 24px; 
		border-bottom: 1px solid; 
		border-left: 10px solid #000;
		padding: 0px 0px 5px 10px; 
		margin: 5px 0px 10px 0px;
	
	}
</style>
<title>Insert title here</title>
</head>
<body>
<h2>암호 찾기</h2>
<p>
<form action="IdChk.do">
	아이디(e-mail) : <input type="email" name="id" required="required">
	<input type="hidden" name="pass" value="pass"> &nbsp;&nbsp;&nbsp;
	<input type="submit" value="찾기">
</form>
	<p><font color="red">${passmsg}</font>
</body>
</html>