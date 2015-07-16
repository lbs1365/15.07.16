<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memo</title>
<script type="text/javascript">
	function openContent() {
		$('.mw_layer').addClass('open');

		$('#layer').html();

		location.href = "#layer";

	}
	$(function(){
		    $("#input").button(); 
	});

	jQuery(function($) {

		var layerWindow = $('.mw_layer');

		// ESC Event

		$(document).keydown(function(event) {

			if (event.keyCode != 27)
				return true;

			if (layerWindow.hasClass('open')) {

				layerWindow.removeClass('open');

			}

			return false;

		});

		// Hide Window

		layerWindow.find('>.bg').mousedown(function(event) {

			layerWindow.removeClass('open');

			return false;
		
			
		});

	});
</script>

</head>
<body id="body">
	TODAY:${nowDate } &nbsp;&nbsp;&nbsp; <button onclick="openContent()" id="">작성</button>
	<p>
	<table id="memolist" style="height: 150px; width: 450px;">
		<c:forEach items="${MemoList }" var="MemoList">
			<tr>
				<td id="memotd">
				<!-- 오늘과 기한날을 비교해서 색으로 표현  -->
				<font 
					<c:if test="${nowDate > MemoList.memoDate }"> color="red"</c:if>
					<c:if test="${nowDate <= MemoList.memoDate }"> color="blue"</c:if>
				>
			
					 ${MemoList.content }<font size="2">(${MemoList.regdate })</font>
					 </font>
						
					<c:if test="${!empty MemoList.memoDate }">
						<!-- 만약 기한 값이 없으면 기한을 표기하지 않음 -->
						 &nbsp;&nbsp;-기한:${MemoList.memoDate }
					</c:if>

					<button
						onclick="location.href='MemoDel.do?memoNo=${MemoList.memoNo}'">삭제
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>


		
		<div class="mw_layer">
			<div class="bg"></div>
			<div id="layer">
				<!-- 이 사이에 작성을 하면 팝업의 내용이 들어간다.  -->

				<form action="MemoInsert.do">
					<table style="height: 100%; width: 100%;">
						<tr>
							<th colspan="2">입력</th>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="2" cols="40" name="content"
									required="required"></textarea></td>
						</tr>
						<tr>
							<td>기한 설정</td>
							<td><input type="date" name="memoDate"> *필수 입력 아닙니다.</td>
						</tr>
					</table>
					<input type="submit" value="입력완료">
				</form>

			</div>
		</div>
		<!-- <a href="#layer" onclick="openContent()">aaaa</a> -->
		
</body>
</html>