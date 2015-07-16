<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ include file="path.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path %>/resources/js/jquery.js" type="text/javascript"></script>
<script src="<%=path %>/resources/js/jquery-ui.min.js" type="text/javascript"></script>
<link href="<%=path %>/resources/css/index.css" rel="stylesheet">
<link href="<%=path %>/resources/css/jquery-ui.min.css" rel="stylesheet">
<link href="<%=path %>/resources/css/memo.css" rel="stylesheet">
<title>richbook</title>
<script type="text/javascript">
	function logout_event(){
		if (confirm("정말 로그아웃 하시겠습니까?") == true){    //확인
		    document.forms[0].submit();
		}else{   //취소
		    return;
		}
	}
	function home_event(){
		document.forms[1].submit();
	}
</script>

</head>
<%-- 

<%
	String pagefile = request.getParameter("page");
	System.out.println(pagefile);
%>
<c:set var="pagefile"  value="<%=pagefile %>"/>
	
	
 --%>
 <body>
 	<form action="logout.do">
	 	<div style="float: right;cursor:pointer; margin-right: 200px;" onclick="logout_event()">
			<img alt="logout" src="<%=path %>/resources/css/images/logout.png">
	 	</div>
 	</form>
 	<form action="MemoList.do">
		<div style=" cursor:pointer; margin-left:75px; " onclick="home_event()">
			<img alt="home" src="<%=path %>/resources/css/images/home.png">
	 	</div> 	
 	</form>
 	
	<div class="container">
		<div class="menu" >
			<jsp:include page="menu11.jsp"  />
		</div>
		
		<div class="content">
				<c:if test="${hi.equals('hi') }" >
				<div class="calender" id="calender" style="overflow: auto;">
					<jsp:include page="datelist.jsp"  />
				</div>
				<div class="chart">
					<jsp:include page="chart_.jsp"  />
				</div>
				<div class="memo" style="overflow: auto;" >
					<jsp:include page="memomain.jsp"  />
				</div>
				<div class="fix">
					<h2>fix</h2>
				</div>
				</c:if>			
			<c:if test="${ho.equals('ho') }">
				<jsp:include page="in.jsp" />
			</c:if>
			
			<c:if test="${hoo.equals('hoo') }">
				<jsp:include page="ex.jsp" />
			</c:if>
			
			<!-- parameter 받아 검증한 값을 attribute로 보내세요 
				사용자가 입력한 값은 어떤 것도 안전하다고 생각하면 안됩니다. 
				웹 보안에 관한 책을 읽어 보면 이런 점에서 신경쇠약이 됩니다 
					//안좋은 방법같음	
			 * flush - 다 내보내지지 않고 버퍼에 남아있는 내용물을 모두 출력하기 위해 사용
			  flush="true 동적  사용자가 부모페이지 호출시 실행되어질 시점에 include한 파일이 삽입된다. 
			  정적 jsp가 컴파일되기 전에 include한 파일(common.jsp)이 부모 페이지에 삽입되어 컴파일된다.
			-->
		</div>
	</div>
</body>
</html>