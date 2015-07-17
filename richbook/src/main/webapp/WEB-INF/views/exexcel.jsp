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
	<form action="ExInsert.do" method="post">
		<table border="1"  id="insert">
			<tr>
				<th><div align="center">No</div></th>				
				<c:if test="${ex.exSort == null || ex.exSort.equals('exDate')}">
					<th>
						<c:if test="${ex.exArr == null}">
							<div class="exDate" id="Asc" align="center">날짜 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="exDate" id="Asc" align="center">날짜 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="exDate" id="Desc" align="center">날짜 ▲</div>
						</c:if>						
					</th>
					<th><div class="emtNo" id="Desc" align="center">분류</div></th>
					<th><div class="exSum" id="Desc" align="center">금액</div></th>
					<th><div class="exCon" id="Desc" align="center">내역</div></th>			
				</c:if>								
				<c:if test="${ex.exSort.equals('emtNo')}">
					<th><div class="exDate" id="Desc" align="center">날짜</div></th>
					<th>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="emtNo" id="Asc" align="center">분류 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="emtNo" id="Desc" align="center">분류 ▲</div>
						</c:if>
					</th>
					<th><div class="exSum" id="Desc" align="center">금액</div></th>
					<th><div class="exCon" id="Desc" align="center" >내역</div></th>			
				</c:if>
				<c:if test="${ex.exSort.equals('exSum')}">
					<th><div class="exDate" id="Desc" align="center">날짜</div></th>	
					<th><div class="emtNo" id="Desc" align="center">분류</div></th>		
					<th>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="exSum" id="Asc" align="center">금액 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="exSum" id="Desc" align="center">금액 ▲</div>
						</c:if>
					</th>
					<th><div class="exCon" id="Desc" align="center">내역</div></th>
				</c:if>
				<c:if test="${ex.exSort.equals('exCon')}">
					<th><div class="exDate" id="Desc" align="center">날짜</div></th>
					<th><div class="emtNo" id="Desc" align="center">분류</div></th>
					<th><div class="exSum" id="Desc" align="center">금액</div></th>
					<th>
						<c:if test="${ex.exArr.equals('Desc')}">
							<div class="exCon" id="Asc" align="center">내역 ▼</div>
						</c:if>
						<c:if test="${ex.exArr.equals('Asc')}">
							<div class="exCon" id="Desc" align="center">내역 ▲</div>
						</c:if>
					</th>
				</c:if>
				<th><div align="center">기타</div></th>				
			</tr>
			<c:set var="i" value="${exlist.size() }" />		
			<c:forEach var="exlist" items="${exlist }">
				<tr>
					<td>${i }</td>
					<td>
						<fmt:parseDate value="${exlist.exDate }" pattern ="yyyy-MM-dd" var="date"/>						
						<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
					</td>
					<td><c:forEach var="emtlist" items="${emtlist }">
							<c:if test="${exlist.emtNo == emtlist.emtNo }">${emtlist.emtName }</c:if>
						</c:forEach></td>
					<td><fmt:formatNumber pattern="#,###">${exlist.exSum }</fmt:formatNumber>원</td>
					<td>${exlist.exCon }</td>
					<td>${exlist.exEtc }</td>					
				</tr>
				<c:set var="i" value="${i-1 }" />				
			</c:forEach>						
		</table>		
	</form>		
</body>
</html>