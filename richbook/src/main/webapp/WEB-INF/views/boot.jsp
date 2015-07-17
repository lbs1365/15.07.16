<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ include file="path.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RichBook에 오신걸 환영합니다.</title>

<!-- Bootstrap Core CSS -->
<link href="<%=path %>/resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=path %>/resources/css/body.css" rel="stylesheet">
<link href="<%=path %>/resources/css/memo.css" rel="stylesheet">
<link href="<%=path %>/resources/css/index.css" rel="stylesheet">
<link href="<%=path %>/resources/css/jquery-ui.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function logout_event(){
		if (confirm("정말 로그아웃 하시겠습니까?") == true){    //확인
			outform.submit();
		}else{   //취소
		    return;
		}
	}
	function del_event(){
		if (confirm("정말 탈퇴 하시겠습니까?") == true){    //확인
// 		    document.forms[2].submit();
			del.submit();
		}else{   //취소
		    return;
		}
	}
	function inexcel(){
		if (confirm("수입차트를 출력 하시겠습니까?") == true){    //확인
			inform.submit();
		}else{   //취소
		    return;
		}
	}
	function exexcel(){
		if (confirm("지출차트를 출력 하시겠습니까?") == true){    //확인
			exform.submit();
		}else{   //취소
		    return;
		}
	}
	
</script>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand" href="MemoList.do">Home</a>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="In.do">수입</a>
                    </li>
                    <li>
                        <a href="Ex.do">지출</a>
                    </li>
                    <li>
                        <a href="#">통계</a>
                    </li>
					<li><form action="InExcel.do" name="inform">
						<a href="#" id="aid" onclick="inexcel()">수입출력</a></form></li>
                    <li>
					<li><form action="ExExcel.do" name="exform">
						<a href="#" id="aid" onclick="exexcel()">지출출력</a></form></li>
                    <li>
						<form action="logout.do" name="outform">
						<a href="#" onclick="logout_event()" id="aid"
						>${userid.getId()}님 환영합니다~</a>
						</form>
					</li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
					<li><a></a></li>
										
					<li>
					<form action="Memdel.do" name="del">
					<a href="#" onclick="del_event()" id="aid" style="font-size: 10px;">회원탈퇴</a>
					</form>
					</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
		
		
    <div class="container" >
        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Rich Book
                    <small>Save Money</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
        <!-- Projects Row -->
			
		<c:if test="${hi.equals('hi') }" >
        <div class="row">
            <div class="col-md-6 portfolio-item" id="calender" style="overflow: auto; margin-left:20px; ">
               <jsp:include page="datelist.jsp"  />
            </div>
            <div  class="col-md-6 portfolio-item" style="float: right; ">
				<jsp:include page="chart_.jsp"  />
            </div> 
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-6 portfolio-item" id="memo" style="overflow: auto;">
               <jsp:include page="memomain.jsp"  />
            </div>
             <div class="col-md-6 portfolio-item" id="fix">
				<h2>Fix</h2>
            </div>
              <div class="col-md-6 portfolio-item" id="fix"  style="">
				<h2>Fix</h2>
            </div>
        </div>
		</c:if>
		
		<c:if test="${ho.equals('ho') }">
			<jsp:include page="in.jsp" />
		</c:if>
			
		<c:if test="${hoo.equals('hoo') }">
			<jsp:include page="ex.jsp" />
		</c:if>
        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>RichBook &copy; Save Your Money 2015</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="<%=path %>/resources/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=path %>/resources/js/bootstrap.js"></script>
	<script src="<%=path %>/resources/js/jquery-ui.min.js" type="text/javascript"></script>
	
	<script src="<%=path %>/resources/js/jquery.bpopup.min.js"></script>
	<script src="<%=path %>/resources/js/highcharts.js"></script>
	<script src="<%=path %>/resources/js/highcharts-3d.js"></script>
	<script src="<%=path %>/resources/js/exporting.js"></script>
</body>
</html>