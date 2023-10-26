<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 공지사항</title>


<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/db/mypage/notice.css" />

<%-- bootstrap CSS --%>
<link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<%-- font CSS--%>
<link rel="stylesheet" href="<%= ctxPath%>/css/font.css" type="text/css">

<%-- Optional JavaScript --%> 
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 


<%-- jQuery CC 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%> <%-- 아직 없음 --%>
<%-- 
<script type="text/javascript" src="<%= ctxPath%>/js/db/mypage/mypageOrderDeliver.js"></script>
--%>









</head>
<div class="h3">header가 들어온다.</div>

<body>
	<div id="member">
		<div id="mypage_left">
			<h3 id="mypage_link"><a href="<%= ctxPath%>/mypage/mypage.tam">마이페이지</a></h3>
			<p id="p_user_info"><span id="user_name">박동빈</span><span id="point">3,000P</span></p>
			<ul class="list_md">
				<li class="list_head">쇼핑 정보</li>
				<li><a href="<%= ctxPath%>/mypage/mypageOrderDeliver.tam">주문 / 배송</a></li>
			</ul>
			
			<ul class="list_md">
				<li class="list_head">계정 정보</li>	
				<li><a href="">회원정보 수정</a></li>
			</ul>
			
			<ul>
				<li class="list_head">고객센터</li>
				<li><a href="<%= ctxPath%>/mypage/mypageNotice.tam">공지사항</a></li>
				<li><a href="<%= ctxPath%>/mypage/customerCare.tam">자주 묻는 질문</a></li>
				<li><a href="">1:1 문의하기</a></li>
			</ul>
		</div>
		
		
		
		<div id="mypage_right">
			<ul class="menu-accordion menu-accordion-md" id="c_size_menu">
	<li class=""><a href="#"><span class="label">첫번째메뉴텍스트</span></a></li>
	<li class="disabled"><a href="#"><span class="label">첫번째메뉴텍스트</span></a></li>
	<li class="tree-view open"><a href="#"><span class="label">첫번째메뉴텍스트</span></a>
		<ul class="tree-view-menu">
			<li><a href="#"><span class="label">두번째메뉴텍스트</span></a></li>
			<li class="disabled"><a href="#"><span class="label">두번째메뉴텍스트</span></a></li>
			<li class="tree-view"><a href="#"><span class="label">두번째메뉴텍스트</span></a>
				<ul class="tree-view-menu">
					<li><a href="#">세번째메뉴텍스트</a></li>
					<li class="disabled"><a href="#">세번째메뉴텍스트</a></li>
					<li class="tree-view"><a href="#">세번째메뉴텍스트</a>
						<ul class="tree-view-menu">
							<li class="active"><a href="#">네번째메뉴텍스트</a></li>
							<li><a href="#">네번째메뉴텍스트</a></li>
							<li class="disabled"><a href="#">네번째메뉴텍스트</a></li>
						</ul></li>
				</ul></li>
		</ul></li>
	<li class="tree-view"><a href="#"><span class="label">첫번째메뉴텍스트</span></a>
		<ul class="tree-view-menu">
			<li><a href="#"><span class="label">두번째메뉴텍스트</span></a></li>
			<li><a href="#"><span class="label">두번째메뉴텍스트</span></a></li>
			<li class="tree-view"><a href="#"><span class="label">두번째메뉴텍스트</span></a>
				<ul class="tree-view-menu">
					<li><a href="#">세번째메뉴텍스트</a></li>
					<li class="tree-view"><a href="#">세번째메뉴텍스트</a>
						<ul class="tree-view-menu">
							<li><a href="#">네번째메뉴텍스트</a></li>
							<li class="active"><a href="#">네번째메뉴텍스트</a></li>
							<li><a href="#">네번째메뉴텍스트</a></li>
						</ul></li>
				</ul></li>
		</ul></li>
</ul>
		</div>
	</div>		
	<br>
</body>

<div class="h3">footer가 들어온다.</div>

</html>