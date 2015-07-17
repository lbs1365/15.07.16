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
</head>
<body>
	<form action="InInsert.do" method="post">
		<table border="1" id="insert">
			<tr>
				<th><div align="center">No</div></th>			
				<c:if test="${in.inSort == null || in.inSort.equals('inDate')}">
					<th>
						<c:if test="${in.inArr == null}">
							<div class="inDate" id="Asc" align="center">날짜 ▼</div>
						</c:if>
						<c:if test="${in.inArr.equals('Desc')}">
							<div class="inDate" id="Asc" align="center">날짜 ▼</div>
						</c:if>
						<c:if test="${in.inArr.equals('Asc')}">
							<div class="inDate" id="Desc" align="center">날짜 ▲</div>
						</c:if>						
					</th>
					<th><div class="imtNo" id="Desc" align="center">분류</div></th>
					<th><div class="inSum" id="Desc" align="center">금액</div></th>
					<th><div class="inCon" id="Desc" align="center">내역</div></th>			
				</c:if>								
				<c:if test="${in.inSort.equals('imtNo')}">
					<th><div class="inDate" id="Desc" align="center">날짜</div></th>
					<th>
						<c:if test="${in.inArr.equals('Desc')}">
							<div class="imtNo" id="Asc" align="center">분류 ▼</div>
						</c:if>
						<c:if test="${in.inArr.equals('Asc')}">
							<div class="imtNo" id="Desc" align="center">분류 ▲</div>
						</c:if>
					</th>
					<th><div class="inSum" id="Desc" align="center">금액</div></th>
					<th><div class="inCon" id="Desc" align="center">내역</div></th>			
				</c:if>
				<c:if test="${in.inSort.equals('inSum')}">
					<th><div class="inDate" id="Desc" align="center">날짜</div></th>	
					<th><div class="imtNo" id="Desc" align="center">분류</div></th>		
					<th>
						<c:if test="${in.inArr.equals('Desc')}">
							<div class="inSum" id="Asc" align="center">금액 ▼</div>
						</c:if>
						<c:if test="${in.inArr.equals('Asc')}">
							<div class="inSum" id="Desc" align="center">금액 ▲</div>
						</c:if>
					</th>
					<th><div class="inCon" id="Desc">내역</div></th>
				</c:if>
				<c:if test="${in.inSort.equals('inCon')}">
					<th><div class="inDate" id="Desc" align="center">날짜</div></th>
					<th><div class="imtNo" id="Desc" align="center">분류</div></th>
					<th><div class="inSum" id="Desc" align="center">금액</div></th>
					<th>
						<c:if test="${in.inArr.equals('Desc')}">
							<div class="inCon" id="Asc" align="center">내역 ▼</div>
						</c:if>
						<c:if test="${in.inArr.equals('Asc')}">
							<div class="inCon" id="Desc" align="center">내역 ▲</div>
						</c:if>
					</th>
				</c:if>
				<th><div align="center">기타</div></th>				
			</tr>
			<c:set var="i" value="${inlist.size() }" />			
			<c:forEach var="inlist" items="${inlist }">
				<tr>
					<td>${i }</td>
					<td>
						<fmt:parseDate value="${inlist.inDate }" pattern ="yyyy-MM-dd" var="date"/>						
						<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
					</td>
					<td><c:forEach var="imtlist" items="${imtlist }">
							<c:if test="${inlist.imtNo == imtlist.imtNo }">${imtlist.imtName }</c:if>
						</c:forEach></td>
					<td><fmt:formatNumber pattern="#,###">${inlist.inSum }</fmt:formatNumber>원</td>
					<td>${inlist.inCon }</td>
					<td>${inlist.inEtc }</td>					
				</tr>
				<c:set var="i" value="${i-1 }" />				
			</c:forEach>						
		</table>		
	</form>		
</body>
</html>