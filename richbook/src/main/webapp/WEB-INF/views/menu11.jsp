<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="path.jsp" %>	    
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=path %>/resources/css/menu.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript">
	function del_event(){
		if (confirm("정말 탈퇴 하시겠습니까?") == true){    //확인
		    document.forms[2].submit();
		}else{   //취소
		    return;
		}
	}
</script>
<body>
<div id="topMenu"  align="left">
		<ul id="menuUl">
			<li class="topMenuLi">
                <a class="menuLink" href="In.do">수입</a>
                <ul class="submenu">
                </ul>
            </li>
			<li>|</li>
            <li class="topMenuLi">
                <a class="menuLink" href="Ex.do">지출</a>
            </li>
			<li>|</li>
            <li class="topMenuLi">
                <a class="menuLink" href="#">통계</a>
            </li>
		</ul>
		<div id="idset">
			<form action="Memdel.do">
				<a href="#" onclick="del_event()"
				style="text-decoration:none;  color: #0073EA;"
				
				>${userid.getId()}님 환영합니다~</a>
			</form>
		</div>
	</div>
</body>
</html>