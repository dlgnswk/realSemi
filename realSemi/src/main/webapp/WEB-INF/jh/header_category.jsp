<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%
    String ctxPath = request.getContextPath();
	//    /tempSemi
%>
<!DOCTYPE html>
<%-- 헤더 시작 --%>
<html lang="ko">
<head>
<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" href="<%= ctxPath %>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">

<%-- Font Awesome 5 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"  href="<%= ctxPath%>/css/font.css" type="text/css">

<%-- header,footer 전용 CSS --%>
<link rel="stylesheet" href="<%= ctxPath %>/css/jh/header/header.css" type="text/css">

<%-- Optional JavaScript --%>
<script src="<%= ctxPath %>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%= ctxPath %>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<%-- header,footer 전용 js --%>
<script src="<%= ctxPath %>/js/jh/header/header.js" type="text/javascript"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jh/index/index.js"></script>
 	
</head>
  
  <body id="container" style="overflow-x: hidden">
	  
	
	<%-- 네비게이션바 시작 --%>  
	  
	<nav class="navbar navbar-expand-lg bg-white navbar-white sticky-top ">
	  <a class="navbar-brand" href="<%=ctxPath%>/index.tam"><img src="<%= ctxPath %>/images/jh/header_footer/logo.png" /></a>
	  
	<%-- 사이드바 시작 --%>
		<div id="side_bar_container">
		<span><a class="nav-link header_footer_font" href="#"><img src="<%= ctxPath %>/images/jh/header_footer/cart.png" style="width:16px; height:16px;"><label>0</label></a></span>
		<div class="side_bar">	
			<div id="mySidepanel" class="sidepanel">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="<%=ctxPath%>/index.tam">전체보기</a>
			  <a href="#">매장보기</a>
			  <a href="#">마이페이지</a>
			  <c:if test="${empty sessionScope.loginuser}">
			  	<a href="<%=ctxPath%>/login/login.tam">로그인</a>
			  </c:if>
			  <c:if test="${not empty sessionScope.loginuser}">
			  	<a href="<%=ctxPath%>/login/logout.tam">로그아웃</a>
			  </c:if>
			  <a href="#">장바구니</a>
			</div>

			<button class="openbtn" onclick="openNav()">&#9868;</button>
		</div>
	</div>		
	<%-- 사이드바 끝 --%>

			
		<div id="mySidepane0" class="sidepanel collapse navbar-collapse" style="white-space:nowrap;">
			  <ul class="navbar-nav">
			    <li class="nav-item active">
			      <a class="nav-link header_footer_font" href="">제품보기</a>
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
				     <c:if test="${empty sessionScope.loginuser}">
				  		<a class="nav-link header_footer_font" href="<%=ctxPath%>/login/login.tam">로그인</a>
					 </c:if>
					 <c:if test="${not empty sessionScope.loginuser}">
					  	<a class="nav-link header_footer_font" href="<%=ctxPath%>/login/logout.tam">로그아웃</a>
					 </c:if>
			     </li>
			  </ul>
			  <span><a class="nav-link header_footer_font" href="#"><img src="<%= ctxPath %>/images/jh/header_footer/cart.png" style="width:16px; height:16px;"><label>0</label></a></span>
			</div> 
	</nav>
	<%-- 네비게이션바 끝 --%>
	
<%-- 헤더 끝 --%>	

<%-- 카테고리 시작 --%>
	<div id="category_container">
		<ul>
			<li id="total_view" name="total_view">
				<a href="<%=ctxPath%>/index.tam">
					<c:if test="${empty requestScope.ca_id}">
						<span class="category_img_select">
							<img src="<%= ctxPath %>/images/jh/category/entire.png" style="width:100px; height:100px;" class="cate_img" >
						</span>
					</c:if>
					<c:if test="${not empty requestScope.ca_id}">
						<span class="category_img">
							<img src="<%= ctxPath %>/images/jh/category/entire.png" style="width:100px; height:100px;" class="cate_img" >
						</span>
					</c:if>
					<span class="category_name header_footer_font">전체보기</span>
				</a>
			</li>
			
			<c:forEach var="caImgList" items="${requestScope.cateImgList}" varStatus="status" >
				<li id="perfume" name="perfume">
				
					<c:if test="${empty requestScope.ca_id}">
						<a href="<%=ctxPath%>/category.tam?ca_id=${caImgList.ca_id}">
							<span class="category_img"><img src="<%= ctxPath %>/images/jh/category/${caImgList.ca_img_file}" style="width:100px; height:100px;" class="cate_img" ></span>
							<span class="category_name header_footer_font">${caImgList.ca_name}</span>
						</a>
					</c:if>
					<c:if test="${not empty requestScope.ca_id}">
						<c:if test="${caImgList.ca_id eq requestScope.ca_id}">
							<a href="<%=ctxPath%>/category.tam?ca_id=${caImgList.ca_id}">
								<span class="category_img_select"><img src="<%= ctxPath %>/images/jh/category/${caImgList.ca_img_file}" style="width:100px; height:100px;" class="cate_img" ></span>
								<span class="category_name header_footer_font">${caImgList.ca_name}</span>
							</a>
						</c:if>
						<c:if test="${caImgList.ca_id ne requestScope.ca_id}">
							<a href="<%=ctxPath%>/category.tam?ca_id=${caImgList.ca_id}">
								<span class="category_img"><img src="<%= ctxPath %>/images/jh/category/${caImgList.ca_img_file}" style="width:100px; height:100px;" class="cate_img" ></span>
								<span class="category_name header_footer_font">${caImgList.ca_name}</span>
							</a>
						</c:if>
					</c:if>
				</li>
				
			</c:forEach>
		</ul>
	</div>
	<%-- 카테고리 끝 --%>
	
	
	
	
	
	<%-- sticky bar 시작 --%>
	
		<div class="sticky_son"  style="padding-left:230px">샤워리바디</div>

	<%-- sticky bar 끝 --%>
	
	