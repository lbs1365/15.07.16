<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="path.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=path %>/resources/js/jquery.js" type="text/javascript"></script> 
<script type="text/javascript">
	$(function(){
		$('#passchk').click(function() {
			passchk().show();
		
		});
	});
	function passchk(){ 
		window.open("PassChk.do", "암호찾기" ,
				"width=600,height=700,location=no,toolbar=no,resizable=no,status=no,scrollbars=auto,menubar=no,left=250,top=200")
		}
	
</script>
</head>
<body>
<form action="login.do" method="post">
<table style="width: 100%; height: 100%; margin-top: 30px;">
	<tr>
		<td>아이디(e-mail)</td><td><input type="email" name="id" required="required"></td>
	</tr>
	<tr>
		<td>암호</td><td><input type="password" name="pw" required="required"></td>
	</tr>
</table>
	<input type="submit" value="확인" style="float: right; margin: 20px; height: 20px; width: 50px;">
<font color="red" style="float: right;">${msg}</font>
</form>
	<button id="passchk" style="float: right; margin: 20px;">암호찾기</button>
</body>
</html>