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
    <link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
    
    <%-- Font Awesome 5 Icons --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <%-- header,footer 전용 CSS --%>
    <link rel="stylesheet" href="<%= ctxPath%>/css/jy/hearderTest.css" type="text/css">

	<%-- Optional JavaScript --%>
    <script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    
    <%-- header,footer 전용 js --%>
 	<script src="<%= ctxPath%>/js/jy/headerTest/headerTest.js" type="text/javascript"></script>
 	
</head>

<body>

<%-- 카테고리 시작 --%>
	<div id="category_container">
		<ul>
			<li id="total_view" class="total_view">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath%>/images/jy/대한민국_아이콘.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">대한민국</span>
				</a>
			</li>
			
			<li id="perfume" class="perfume">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath%>/images/jy/중국_아이콘.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">중국</span>
				</a>
			</li>
			
			<li id="perfume_bam" class="perfume_bam">
				<a href="#">
					<span class="category_img"><img src="<%= ctxPath%>/images/jy/전시_아이콘.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">전시</span>
				</a>
			</li>

		</ul>
	</div>
	<%-- 카테고리 끝 --%>
	

	<%-- sticky bar 시작 --%>
		<div class="sticky_son">
			<div class="stick_wrap">
				<strong class="stick_text">스토어 (3)</strong>
			</div>
		</div>

	<%-- sticky bar 끝 --%>

</body>
</html>
