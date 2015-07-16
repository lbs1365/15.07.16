<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="path.jsp" %>	    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page session="false" %> 세션을 사용안하는 페이지 true면 확인할 수 있는 페이지--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>rickbook</title>
<script src="<%=path %>/resources/js/jquery.js" type="text/javascript"></script>
<link href="<%=path %>/resources/css/main_.css" rel="stylesheet">
</head>
<script type="text/javascript">

 $(function(){
	$('#loginimg').click(function(){
 		pop().show();
 		/*   $.ajax({
	           type:"POST",
	           url:"memIn.do?mailChk=noChk",
	           success : function(data) {
	        	   $('#main').append(data);
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
		 });  */
	});
});
 function pop(){ 
	window.open("memIn.do?mailChk=noChk", "회원가입" ,
			"width=600,height=700,location=no,toolbar=no,resizable=no,status=no,scrollbars=auto,menubar=no,left=250,top=100")
	}
 
 
</script>
<body style="margin: 0px; ">
<hr size="50px" color="black" style="margin: 0px;">
<div id="main">
	<div id="rich">
		<img alt="부자되세요" src="<%=path %>/resources/css/images/basic.jpg">
	</div>
	<div id="font">
		<img alt="글씨" src="<%=path %>/resources/css/images/how.png">
	</div>
	<div id="loginimg" style="cursor:pointer;"  >
		<img alt="로그인" src="<%=path %>/resources/css/images/login.jpg" >
	</div>
	<div id="login">
		<jsp:include page="login.jsp"/>
	</div>
</div>
</body>
</html>