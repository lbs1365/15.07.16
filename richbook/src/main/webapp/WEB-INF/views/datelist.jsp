<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ include file="path.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=path %>/resources/js/jquery.js" type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body> 
<!--  <body > -->
<%-- <c:forEach items="${inlist}" var="inlist">
	<fmt:parseDate value="${inlist.inDate }" pattern ="yyyy-MM-dd" var="indate"/>						
	<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd" />
</c:forEach> --%>
<%-- <fmt:parseNumber value="${exsumlist }" var="exsumlist" /> --%>

<%-- 
	<c:set var="num" value="${exsumlist.size()}"/>
	<c:forEach items="${exsumlist }" var="exsal" varStatus="exnum">
		<c:forEach var="num" begin="0" end="${exsumlist.size() }">
			<c:if test="${exnum.index eq num }"> 
				숫자 + ${exsal }
			</c:if>
		</c:forEach>
	</c:forEach>

<p>
<fmt:parseNumber value="${exdaylist }" var="exdaylist" />
	<c:forEach items="${exdaylist }" var="exday" >
		${exday}
	</c:forEach>
	<p>
	<c:forTokens items="${exsumlist}" delims="[,]" var="exday" varStatus="">
		${exday}<br>
	
	</c:forTokens>
	<p>
	

${exsumlist } <br>
 --%>
<%-- ${exsumlist } --%>

<div id="calender"></div>
</body>
<%-- ${exsumlist }  ${exdaylist } --%>
<script type="text/javascript">
	 $(window).load(function() {
		 $.ajax({
	           type:"POST",
	           url:"datelist.do",
	           success : function(data) {
	           		today();
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
		 });
	});
	 
	 function today(){
			var dy, dm, dd, dx, dh, dmin, ds, td;
			var mm = new Array("일", "월", "화", "수", "목", "금", "토");
			var mmc = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
			var mms = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
			var td = new Date();
			var calen = "";
			dy = td.getFullYear();
			dm = td.getMonth();
			dd = td.getDate();
			dx = td.getDay();
			dh = td.getHours();
			dmin = td.getMinutes();
			ds = td.getSeconds();
			var t2 = new Date(dy, dm, 1);
			//var d = new Date(year, month, day, hours, minutes, seconds, milliseconds);
			var firstDay = t2.getDay();

			loop = mms[dm];
			calen +="<table width=200 border=1 bordercolor=black align=center class=fon1>";
			calen += "<colgroup>";
			calen += "<col bgcolor=silver>";
			calen += "<col span=5 bgcolor=whitesmoke>";
			calen += "<col bgcolor=#B2EBF4>";
			calen += "<tr><td colspan=7>" + mmc[dm]+"◀"+ dy+  "</td></tr><tr><td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td></tr><tr>";
		
			for(var i=0; i<firstDay; i++){
				calen +=("<td> </td>");
			}
			if(dm == 1 && ((dy % 4 == 0 && dy % 100 != 0) || dy % 400 == 0)){ // 윤달 체크 로직
				loop++;
			}
			
			for(var k=1 ; k<=loop ; k++){
			
				if(0==(i+k)%7){ //토요일
					calen +="<td>" + k;
					<c:set var="num" value="1"/>
						<c:forEach items="${exdaylist }" var="exday">
							if(k=="${exday}"){
								<c:forEach items="${exsumlist}" var="exsal" varStatus="exnum">
									<c:if test="${exnum.count eq num}">
										calen +="<br><font color='red' size='2px'>지출${exsal}</font>";
									</c:if>
								</c:forEach>
							}
							<c:set var="num" value="${num+1}"/>
						</c:forEach>
						
						<c:set var="nums" value="0"/>
						<c:forEach items="${indaylist }" var="inday">
						if(k=="${inday}"){
							<c:forEach items="${insumlist}" var="insal" varStatus="innum">
								<c:if test="${innum.index eq nums}">
									calen +="<br><font color='blue' size='2px'>수입${insal}</font>";
								</c:if>
							</c:forEach>
						}
						<c:set var="nums" value="${nums+1}"/>
						</c:forEach>
						calen +="</td></tr><tr>";
					
				}else{
					calen +="<td>"+k;
				    <c:set var="num" value="1"/>
					<c:forEach items="${exdaylist }" var="exday">
						if(k=="${exday}"){
							<c:forEach items="${exsumlist}" var="exsal" varStatus="exnum">
								<c:if test="${exnum.count eq num}">
									calen +="<br><font color='red' size='2px'>지출${exsal}</font>";
								</c:if>
							</c:forEach>
						}
						<c:set var="num" value="${num+1}"/>
					</c:forEach>
					
					<c:set var="nums" value="0"/>
					<c:forEach items="${indaylist }" var="inday">
					if(k=="${inday}"){
						<c:forEach items="${insumlist}" var="insal" varStatus="innum">
							<c:if test="${innum.index eq nums}">
								calen +="<br><font color='blue' size='2px'>수입${insal}</font>";
							</c:if>
						</c:forEach>
					}
					<c:set var="nums" value="${nums+1}"/>
					</c:forEach>
					calen +="</td>";
				}
				
			}
			calen +="</tr></table>";
			document.getElementById("calender").innerHTML = calen;
//			calen +=("<a href='date.do'>뒤로</a>");	
		}
	
	/*  
		function today(){
		var dy, dm, dd, dx, dh, dmin, ds, td;
		var mm = new Array("일", "월", "화", "수", "목", "금", "토");
		var mmc = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
		var mms = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		var td = new Date();
		dy = td.getFullYear();
		dm = td.getMonth();
		dd = td.getDate();
		dx = td.getDay();
		dh = td.getHours();
		dmin = td.getMinutes();
		ds = td.getSeconds();
		var t2 = new Date(dy, dm, 1);
		//var d = new Date(year, month, day, hours, minutes, seconds, milliseconds);
		var firstDay = t2.getDay();

		loop = mms[dm];
		document.write ("<table width=200 border=1 bordercolor=black align=center class=fon1>");
		document.write ("<colgroup>");
		document.write ("<col bgcolor=silver>");
		document.write ("<col span=5 bgcolor=whitesmoke>");
		document.write ("<col bgcolor=skyblue>");
		document.write ("<tr><td colspan=7>" + mmc[dm]+"◀"+ dy+  "</td></tr><tr><td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td></tr><tr>");
	
		for(var i=0; i<firstDay; i++){
			document.write("<td> </td>");
		}
		if(dm == 1 && ((dy % 4 == 0 && dy % 100 != 0) || dy % 400 == 0)){ // 윤달 체크 로직
			loop++;
		}
		
		for(var k=1 ; k<=loop ; k++){
		
			if(0==(i+k)%7){
				document.write("<td>" + k + "</td></tr><tr>");
			}else{
				document.write("<td>"+k);
			    <c:set var="num" value="0"/>
				<c:forEach items="${exdaylist }" var="exday">
					if(k=="${exday}"){
						<c:forEach items="${exsumlist}" var="exsal" varStatus="exnum">
							<c:if test="${exnum.index eq num}">
								document.write("<br>지출${exsal}");
							</c:if>
						</c:forEach>
					}
					<c:set var="num" value="${num+1}"/>
				</c:forEach>
				
				<c:set var="nums" value="0"/>
				<c:forEach items="${indaylist }" var="inday">
				if(k=="${inday}"){
					<c:forEach items="${insumlist}" var="insal" varStatus="innum">
						<c:if test="${innum.index eq nums}">
							document.write("<br>수입${insal}");
						</c:if>
					</c:forEach>
				}
				<c:set var="nums" value="${nums+1}"/>
				</c:forEach>
				document.write("</td>");
			}
			
		}
		document.write("</tr></table>");
// 		document.write("<a href='date.do'>뒤로</a>");	
	}
	*/
</script>

<!-- 

			/* 	<c:forTokens items="${exsumlist}" delims="[,]" var="exsal" varStatus="exnum">
							document.write("${exsal}");
						</c:forTokens> 
						 */
						/* <c:forEach items="${exsumlist }" var="exsal" varStatus="exnum">
							<c:forEach var="num" begin="0" end="${exday}">
								<c:if test="${exnum.index eq num }">
									document.write("${exsal}");
								</c:if>
							</c:forEach>
						</c:forEach> */		


1. eq (==)
 비교하고자 하는 값이 동일한지를 확인할때 사용한다.

2. ne (!=)
 비교하는 값이 동일하지 않은지 확인할때 사용한다.

3. empty (== null)
 비교하는 값이 null 인지 확인할때 사용한다. 
 * null이 아닌경우를 표현할때는 !empty 로 표현하면 된다.
 -->


</html>