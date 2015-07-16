<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
<script type="text/javascript">
	opener.location.reload();
	$(function(){
		$('.emtDel').css('cursor', 'pointer');
		$('.emtDel').click(function() {
			var emtNo = $(this).attr('id');
			location.href='EmtDel.do?emtNo='+emtNo;
		});		
	});	
</script>
</head>
<body>
<h2>분류 설정</h2>
${msg }
<form action="EmtUp.do" method="post">
<table border="1">
	<tr>
		<th>No</th><th>분류명</th><th>삭제</th>
	</tr>
	<c:set var="i" value="1"/>
	<c:forEach items="${emtlist }" var="emtlist">
		<tr>
			<td>${i }</td>				
			<td>${emtlist.emtName }</td>
			<td align="center"><div class="emtDel" id="${emtlist.emtNo}">x</div></td>
		</tr>
		<c:set var="i" value="${i+1 }"/>
	</c:forEach>
	<tr>
		<td>${emtlist.size()+1 }</td>
		<td>
			<input type="hidden" name="memNo" value="${memno}">
			<input type="text" name="emtName" required="required">
		</td>
		<td colspan="2"><input type="submit" value="추가"></td>
	</tr>	
</table>
</form>
</body>
</html>