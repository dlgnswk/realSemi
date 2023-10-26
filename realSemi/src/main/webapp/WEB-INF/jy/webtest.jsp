<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%-- 헤더 시작 --%>
<html lang="ko">
  <head>
    <%-- Required meta tags --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>탬버린즈 header</title>
    
    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="../bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
    
    <%-- Font Awesome 5 Icons --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <%-- header,footer 전용 CSS --%>
    <link rel="stylesheet" href="../css/hearderTest.css" type="text/css">

	<%-- Optional JavaScript --%>
    <script src="../js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="../bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    
    <%-- header,footer 전용 js --%>
 	<script src="../js/headerTest/headerTest.js" type="text/javascript"></script>
 	
 	
  </head>
  
  <body id="container" style="overflow-x: hidden">
	  
	
	<%-- 네비게이션바 시작 --%>  
	  
	<nav class="navbar navbar-expand-lg bg-white navbar-white sticky-top ">
	  <a class="navbar-brand" href="#"><img src="../images/탬버린즈로고.png" /></a>
	  
	<%-- 사이드바 시작 --%>
		<div id="side_bar_container">
		<span><a class="nav-link header_footer_font" href="#"><img src="../images/장바구니.png" style="width:16px; height:16px;"><label>0</label></a></span>
		<div class="side_bar">	
			<div id="mySidepanel" class="sidepanel">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="#">제품보기</a>
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
			  <span><a class="nav-link header_footer_font" href="#"><img src="../images/장바구니.png" style="width:16px; height:16px;"><label>0</label></a></span>
			</div> 
	</nav>
	<%-- 네비게이션바 끝 --%>
	
<%-- 헤더 끝 --%>	

<%-- 카테고리 시작 --%>
	<div id="category_container">
		<ul>
			<li id="total_view" name="total_view">
				<a href="#">
					<span class="category_img"><img src="../images/전체보기1.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">제품보기</span>
				</a>
			</li>
			
			<li id="perfume" name="perfume">
				<a href="#">
					<span class="category_img"><img src="../images/퍼퓸1.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">퍼퓸</span>
				</a>
			</li>
			
			<li id="perfume_bam" name="perfume_bam">
				<a href="#">
					<span class="category_img"><img src="../images/퍼퓸 밤1.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">퍼퓸 밤</span>
				</a>
			</li>
			
			<li id="perfume_hand" name="perfume_hand">
				<a href="#">
					<span class="category_img"><img src="../images/퍼퓸 핸드1.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">퍼퓸 핸드</span>
				</a>
			</li>
			
			<li id="tube_hand" name="tube_hand">
				<a href="#">
					<span class="category_img"><img src="../images/튜브 핸드1.png" style="width:100px; height:100px;" class="cate_img" ></span>
					<span class="category_name header_footer_font">튜브 핸드</span>
				</a>
			</li>
		</ul>
	</div>
	<%-- 카테고리 끝 --%>
	
	
	
	
	
	<%-- sticky bar 시작 --%>
	
		<div class="sticky_son">샤워리바디</div>

	<%-- sticky bar 끝 --%>
	
	
    
    
    <div class="row justify-content-md-center" id="footer_content">
		    <div class="col col-lg-2">
		      	<span class="content_title">선물 추천</span>
				<span class="content_txt header_footer_font">온라인 서비스</span>
		    </div>
		    <div class="col col-lg-2">
		      	<span class="content_title header_font">고객센터</span>
				<span class="content_txt header_footer_font">공지사항</span>
				<span class="content_txt header_footer_font">주문 배송 조회</span>
				<span class="content_txt header_footer_font">적립금 현황</span>
				<span class="content_txt header_footer_font">고객서비스</span>
				<span class="content_txt header_footer_font">자주 묻는 질문</span>
		    </div>
		    <div class="col col-lg-2">
		    	<span class="content_title header_font">소셜</span>
				<span class="social_link content_txt header_footer_font"><a href="https://www.instagram.com/tamburinsofficial/">Instagram</a></span class="content_txt">
				<span class="social_link content_txt header_footer_font"><a href="https://pf.kakao.com/_RkqIj" style="color: #b39a7c;">Kakaotalk</a></span>
				<span class="social_link content_txt header_footer_font"><a href="https://weibo.com/tamburinsofficial">Weibo</a></span>
				<span class="social_link content_txt header_footer_font"><a href="https://www.facebook.com/tamburinsofficial/">Facebook</a></span>
		    </div>
 	</div>
 	
 	<hr>
 	
 	
 	<div class="row justify-content-md-center" id="footer_content">
		    <div class="col col-lg-2">
		      	<span class="content_title">선물 추천</span>
				<span class="content_txt header_footer_font">온라인 서비스</span>
		    </div>
		    <div class="col col-lg-2">
		      	<span class="content_title header_font">고객센터</span>
				<span class="content_txt header_footer_font">공지사항</span>
				<span class="content_txt header_footer_font">주문 배송 조회</span>
				<span class="content_txt header_footer_font">적립금 현황</span>
				<span class="content_txt header_footer_font">고객서비스</span>
				<span class="content_txt header_footer_font">자주 묻는 질문</span class="content_txt">
		    </div>
		    <div class="col col-lg-2">
		    	<span class="content_title header_font">소셜</span>
				<span class="social_link content_txt header_footer_font"><a href="https://www.instagram.com/tamburinsofficial/">Instagram</a></span class="content_txt">
				<span class="social_link content_txt header_footer_font"><a href="https://pf.kakao.com/_RkqIj" style="color: #b39a7c;">Kakaotalk</a></span>
				<span class="social_link content_txt header_footer_font"><a href="https://weibo.com/tamburinsofficial">Weibo</a></span>
				<span class="social_link content_txt header_footer_font"><a href="https://www.facebook.com/tamburinsofficial/">Facebook</a></span>
		    </div>
 	</div>
		    
	<br>
 	
 	<hr>
 	
 	<div id="footer_bottom">
		<div class="footer_info header_footer_font">주)아이아이컴바인드 | 사업자등록번호: 119-86-38589 | 대표자: 김한국 | 서울특별시 마포구 어울마당로5길 41 | 대표번호: 1644-1246 | 이메일: cs@tamburins.com
			<br>
			개인정보 보호 책임자: 정태호 | 호스팅 서비스 사업자: Aws | 통신판매업신고: 제 2014-서울마포-1050 호  <a href="#">개인정보처리방침</a> | <a href="#">이용약관</a>
		</div>
		<div class="footer_info header_footer_font">고객님의 안전한 현금자산 거래를 위하여 하나은행과 채무지급보증계약을 체결하여 보장해드리고 있습니다.</div>
		<div class="header_footer_font copyright">&copy; 탬버린즈 &nbsp; 대한민국</div>
	</div>

 	<%-- footer 끝 --%>
 	

  </body>
  
</html>