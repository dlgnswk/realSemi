<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<%-- 헤더 시작 --%>
<html lang="ko">
  <head>
    <%-- Required meta tags --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>탬버린즈 header</title>
    
    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="<%= ctxPath %>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
    
    <%-- Font Awesome 5 Icons --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet"  href="<%= ctxPath%>/css/font.css" type="text/css">
    
    <%-- header,footer 전용 CSS --%>
    <link rel="stylesheet" href="<%= ctxPath %>/css/ws/tamburins_header.css" type="text/css">

	<%-- Optional JavaScript --%>
    <script src="<%= ctxPath %>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="<%= ctxPath %>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    
    <%-- header,footer 전용 js --%>
 	<script src="<%= ctxPath %>/js/ws/header/tamburins_header.js" type="text/javascript"></script>
 	
 	
  </head>
  
  <body id="container" style="overflow-x: hidden">
	  
	
	<%-- 네비게이션바 시작 --%>  
	  
	<nav class="navbar navbar-expand-lg navbar-white sticky-top ">
	  <a class="navbar-brand" href="#"><img src="<%= ctxPath %>/images/ws/header_footer/탬버린즈로고.png" /></a>
	  
	<%-- 사이드바 시작 --%>
		<div id="side_bar_container">
		<span><a class="nav-link header_footer_font" href="#"><img src="<%= ctxPath %>/images/ws/header_footer/장바구니.png" style="width:16px; height:16px;"><label>0</label></a></span>
		<div class="side_bar">	
			<div id="mySidepanel" class="sidepanel">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="#">전체보기</a>
			  <a href="#">매장보기</a>
			  <a href="#">마이페이지</a>
			  <a href="#">로그인</a>
			  <a href="#">장바구니</a>
			</div>

			<button class="openbtn" onclick="openNav()">&#9868;</button>
		</div>
	</div>		
	<%-- 사이드바 끝 --%>

			
		<div id="mySidepane0" class="sidepanel collapse navbar-collapse" style="white-space:nowrap;">
			  <ul class="navbar-nav">
			    <li class="nav-item active">
			      <a class="nav-link header_footer_font" href="#">제품보기</a>
			    </li>
			    <li class="nav-item active">
			      <a class="nav-link header_footer_font" href="#">매장보기</a>
			    </li>
			  </ul>
		</div>	  
			<div id="align-right" class="sidepanel">
			  <ul class="navbar-nav">
				 <li class="nav-item active">
			      <a class="nav-link header_footer_font" href="#">마이페이지</a>
			     </li>
			     
			     <li class="nav-item active">
			      <a class="nav-link header_footer_font" href="#">로그인</a>
			     </li>
			  </ul>
			  <span><a class="nav-link header_footer_font" href="#"><img src="<%= ctxPath %>/images/ws/header_footer/장바구니.png" style="width:16px; height:16px;"><label>0</label></a></span>
			</div> 
	</nav>
	<%-- 네비게이션바 끝 --%>
	
<%-- 헤더 끝 --%>	

<%-- 카테고리 시작 --%>
	<div id="category_container">
		<ul>
			<li id="total_view" name="total_view">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath %>/images/ws/header_footer/전체보기.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">전체보기</span>
				</a>
			</li>
			
			<li id="perfume" name="perfume">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath %>/images/ws/header_footer/퍼퓸.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">퍼퓸</span>
				</a>
			</li>
			
			<li id="perfume_bam" name="perfume_bam">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath %>/images/ws/header_footer/퍼퓸 밤.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">퍼퓸 밤</span>
				</a>
			</li>
			
			<li id="perfume_hand" name="perfume_hand">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath %>/images/ws/header_footer/퍼퓸 핸드.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">퍼퓸 핸드</span>
				</a>
			</li>
			
			<li id="tube_hand" name="tube_hand">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath %>/images/ws/header_footer/튜브 핸드.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">튜브 핸드</span>
				</a>
			</li>
		</ul>
	</div>
	<%-- 카테고리 끝 --%>
	
	
	
	
	
	<%-- sticky bar 시작 --%>
	
		<div class="sticky_son"  style="padding-left:230px">샤워리바디</div>

	<%-- sticky bar 끝 --%>
	
	