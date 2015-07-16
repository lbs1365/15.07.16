<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="path.jsp" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="<%=path %>/resources/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(window).load(function() {
		alert("이메일 전송을 하였습니다.");
		 d.submit();
	});
</script>
	<form
		<c:if test="${pass.equals('null')}">
			action="IdEmailChk.do?id=${id}" 
		</c:if>
		<c:if test="${pass.equals('pass') }">
			action="PassEmail.do?id=${id}"
		</c:if> 
	name="d" method="post"></form>
	<div style="width: 100%; margin-top: 200px;" align="center">
		<img src="resources/css/images/loading.gif" width="400px;"/>
	</div>
</body>
</html>