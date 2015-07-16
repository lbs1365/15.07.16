<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="path.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>통계창</title>
<%-- <script src="<%=path %>/resources/js/jquery.js" type="text/javascript"></script> --%>
<%-- <link rel="stylesheet" href="<%=path %>/resources/mediagroove.css"> --%>

<%-- <script src="<%=path %>/resources/js/jquery.bpopup.min.js"></script>
<script src="<%=path %>/resources/js/jquery-ui.min.js" type="text/javascript"></script>

<script src="<%=path %>/resources/js/highcharts.js"></script>
<script src="<%=path %>/resources/js/highcharts-3d.js"></script>
<script src="<%=path %>/resources/js/exporting.js"></script> --%>

</head>
<style type="text/css">
.popup-div {
	opacity: 0;
	display: none;
	position: relative;
	width: auto;
}

.popup-style {
	border: 5px solid #fff;
	padding: 20px;
	background-color: #fff;
}
.b-close {
	position: absolute;
	right: 5px;
	top: 5px;
	padding: 5px;
	display: inline-block;
	cursor: pointer;
}
</style>
<%--   <c:forEach var="inlist" items="${inlist }">
		<fmt:parseDate value="${inlist.inDate }" pattern ="yyyy-MM-dd" var="date"/>						
		<fmt:formatDate value="${date}" pattern="yy-MM"  var="dat"/>
 		<input type="button" value="${dat }" id="hoo" onclick="ch()"> 
		<input type="hidden"  value="${dat }" class="hoo" >
		<input type="hidden" value="${inlist.inSum }" class="ho">
		<c:set var="hi" value="${dat }"/>
		<c:set var="hello" value="${inlist.inSum }"/>
</c:forEach>  
--%>
<%-- <c:forEach var="exlist" items="${exlist }">

	<input type="button" value="${exlist.exSum }" >

</c:forEach> --%>
 	<input type="hidden" value="${indaylist}" id="indate"> 
 	<input type="hidden" value="${exdaylist}" id="exdate"> 
	<input type="hidden" value="${insal}" id="sal"> 
<%--  	<input type="hidden" value="${indate }" id="indate"> 
 	<input type="hidden" value="${exdate }" id="exdate"> 
	<input type="hidden" value="${insal }" id="sal">  --%>
	
<script type="text/javascript">
	/* function ch(){
		$.each($('.ho,.hoo'), function(index) { 
		document.write("<h2>"+$(this).val()+"/하하하하하/</h2>");
		}); 
		var hoo =[]; 
		var hi = document.getElementById('hi').value;
		alert(hi);
		
		$.each($('.hoo'),function(index){
			 hoo = $(this).val();
// 			document.write("<h2>"+hoo+"/하하하하하/</h2>");
		});
		
	} */

	function chart() {
		var indate = document.getElementById('indate').value;
		var exdate = document.getElementById('exdate').value;
		var sal = document.getElementById('sal').value;
		var inlist = new Array();
		var inlist2= new Array();
		
		var exlist= new Array();
		var exlist2= new Array();
		
		<c:forEach items="${insumlist }" var="insumlist">
			inlist.push("${insumlist}");
		</c:forEach>
		for ( var i = 0; i < inlist.length; i++) {
// 		    alert(typeof list[i]);
			inlist2.push(parseInt(inlist[i]));
		}
		<c:forEach items="${exsumlist }" var="exsumlist">
			exlist.push("${exsumlist}");
		</c:forEach>
		for ( var i = 0; i < exlist.length; i++) {
			exlist2.push(parseInt(exlist[i]));
		}
/* 		<c:forEach items="${inlist }" var="inlist">
			inlist.push("${inlist.inSum}");
		</c:forEach>
		for ( var i = 0; i < inlist.length; i++) {
// 		    alert(typeof list[i]);
			inlist2.push(parseInt(inlist[i]));
		}
		<c:forEach items="${exlist }" var="exlist">
			exlist.push("${exlist.exSum}");
		</c:forEach>
		for ( var i = 0; i < exlist.length; i++) {
// 		    alert(typeof list[i]);
			exlist2.push(parseInt(exlist[i]));
		} */
		
// 		alert(typeof list2);
//  		alert(inlist2);
// 		alert(typeof date);
		$('#container').highcharts({
	        chart: {
	            type: 'line'
	        },
	        title: {
	            text: '이번 달 사용'
	        },
	        subtitle: {
	            text: 'test버전'
	        },
	        xAxis: { //x축 inDate
	            categories: 
// 	            		indate.split(',')
						[]
	        }, // 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
	        yAxis: { //y 축
	            title: {
	                text: '금액(원)'
	            }
	        },
	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true //숫자값
	                },
	                enableMouseTracking: true //마우스오버값
	            }
	        },
	        series: [{
	            name: '수입'+indate,
				data: inlist2          
	        },{
	        	name: '지출'+exdate,
				data: exlist2
	        }]
	    });
	};


</script>

<body onload="chart()">
<div id="container" style="min-width: 310px; height: 400px;" ></div>

<%-- <c:set value="0" var="i"/>
<c:forEach var="indates" items="${indate }" >
<c:set value="${i+1}" var="i" />
	<input type="hidden" class="hi" onload="ch(${indates})" value="${indates }">
	<c:if test="${indate.size() == i }">
		<a onload="ch(${indates})"></a>
	</c:if>
</c:forEach> --%>
<p>

	<div id="popup1" class="popup-div popup-style">

		<span class="b-close"><span>X</span></span>

		<div class="content" style="height: auto; width: auto;">
				 <div id="container" style="width: auto; height: auto;"
					align="center"></div> 
		</div>
	</div>

</body>
</html>
