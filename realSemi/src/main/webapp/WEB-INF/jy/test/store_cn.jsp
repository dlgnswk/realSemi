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

    <title>매장 Test</title>
    
    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" type="text/css">
    
    <%-- Font Awesome 5 Icons --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <%-- header,footer 전용 CSS --%>
    <link rel="stylesheet" href="<%= ctxPath%>/css/jy/hearderTest.css" type="text/css">
    <link rel="stylesheet" href="<%= ctxPath%>/css/font.css" type="text/css">
    <link rel="stylesheet" href="<%= ctxPath%>/css/jy/store/storeMain.css" type="text/css">

	<%-- Optional JavaScript --%>
    <script src="<%= ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
    <script src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
    
    <%-- header,footer 전용 js --%>
 	<script src="<%= ctxPath%>/js/jy/headerTest/headerTest.js" type="text/javascript"></script>
 	
</head>

<jsp:include page="../tamburins_header.jsp" />
<jsp:include page="../store/storeCateg.jsp" />

<body>
	<div id="store_container">
		<div class="inner-item mx-auto d-block">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					 <div class="carousel-item active">
					 	<img src="<%= ctxPath%>/images/대한민국_삼청_1.jpg" class="d-block w-100" alt="..." />
				 	 </div>
					 <div class="carousel-item">
					 	<img src="<%= ctxPath%>/images/대한민국_삼청_2.jpg" class="d-block w-100" alt="..." />
				 	 </div>
					 <div class="carousel-item">
						<video class="video--transform w-100 h-100" playsinline="" autoplay="" muted="" loop="" poster="https://web-resource.tamburins.com/assets/image/store/kr/dosan/Dosan1_poster.jpg">
                            <source src="<%= ctxPath%>/images/대한민국_도산_1.mp4" type="video/mp4">
                        </video>
				 	 </div>			 	 
				
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>			
			</div>
			<div class="text_storeInfo pt-5">
                <div class="text-center pb-4">하우스 상해</div>
                <div class="text-center">4F, No.798-812, Middle Huaihai Road, Huangpu District,<br>Shanghai, China</div>
                <div class="text-center">+86 21-64220858</div>
                 <div class="text-center">월-일 10:00am-10:00pm</div>
            </div>
        </div>
     </div>
</body>
<jsp:include page="../tamburins_footer.jsp" />
