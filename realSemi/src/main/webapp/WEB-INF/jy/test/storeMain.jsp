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
    <link rel="stylesheet" href="<%= ctxPath%>/css/jy/store/storeTest.css" type="text/css">

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
					<div class="text-center fs_name font--kr pb-4">플래그십스토어 삼청</div>
					<div class="text-center fs_address font--kr">서울 종로구 율곡로3길 84</div>
					<div class="text-center fs_tel font--kr">+82 70 4139 7450</div>
					<div class="text-center fs_hour font--kr">월-일 11:00am-8:00pm</div>
					<br>
					<div class="text-center pt-2"><a style="text-decoration:underline">지도보기</a></div>
			</div>
		</div>
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
			<div class="container text_storeInfo pt-5">
					<div class="text-center fs_name  font--kr pb-4">플래그십스토어 삼청</div>
					<div class="text-center fs_address font--kr">서울 종로구 율곡로3길 84</div>
					<div class="text-center fs_tel font--kr">+82 70 4139 7450</div>
					<div class="text-center fs_hour font--kr">월-일 11:00am-8:00pm</div>
					<br>
					<div class="text-center pt-2"><a style="text-decoration:underline">지도보기</a></div>
			</div>
		</div>
		<div class="store_container mx-auto d-block">
			<div class="text_retailer">
	          <strong>백화점 / 면세점</strong>
	        </div>		
			<div class="store_list  mx-auto">
	            <div class="store_item">
	                <div class="store_name font--kr">스타필드 하남점</div>
	                <div class="store_address font--kr">경기도 하남시 미사대로 750 스타필드 하남 1F</div>
	                <div class="store_tel font--kr">+82 031 8072 8499</div>
	                <div class="store_hour font--kr">월-일 10:00am-10:00pm</div>
	            </div>
	            <div class="store_item">
	                <div class="store_name font--kr">신세계 면세점 명동점</div>
	                <div class="store_address font--kr">서울 중구 퇴계로 77 신세계백화점 본점 04583 10F</div>
	                <div class="store_tel font--kr">+82 02 6370 4182</div>
	                <div class="store_hour font--kr">월-목 10:30am-8:00pm / 금-일,공휴일 10:30am-8:30pm</div>
	            </div>
	            <div class="store_item ">
	                <div class="store_name font--kr">신세계백화점 강남점</div>
	                <div class="store_address font--kr">서울특별시 서초구 신반포로 176 (반포동) 1F</div>
	                <div class="store_tel font--kr">+82 02-3479-1275</div>
	                <div class="store_hour font--kr">월-목 10:30am-8:00pm / 금-일,공휴일 10:30am-8:30pm</div>
	            </div>
	            <div class="store_item ">
	                <div class="store_name font--kr">신세계백화점 센텀시티점</div>
	                <div class="store_address font--kr">부산 해운대구 센텀남대로 35 신세계백화점 센텀시티점 1F</div>
	                <div class="store_tel font--kr">+82 051-745-1398</div>
	                <div class="store_hour font--kr">월-목 10:30am-8:00pm / 금-일,공휴일 10:30am-8:30pm</div>
	            </div>
	            <div class="store_item ">
	                <div class="store_name font--kr">롯데백화점 본점</div>
	                <div class="store_address font--kr">서울 중구 남대문로 81 롯데백화점 본점 B1F</div>
	                <div class="store_tel font--kr">+82 02-772-3905</div>
	                <div class="store_hour font--kr">월-목 10:30am-8:00pm / 금-일,공휴일 10:30am-8:30pm</div>
	            </div>
	            <div class="store_item ">
	                <div class="store_name font--kr">현대백화점 판교점</div>
	                <div class="store_address font--kr">경기도 성남시 분당구 판교역로146번길 20 (1F)</div>
	                <div class="store_tel font--kr">+031-5170-1153</div>
	                <div class="store_hour font--kr">월-목 10:30am-8:00pm / 금-일,공휴일 10:30am-8:30pm</div>
	            </div>
	            <div class="store_item ">
	                <div class="store_name font--kr">더현대 서울점</div>
	                <div class="store_address font--kr">서울 영등포구 여의대로 108 1F</div>
	                <div class="store_tel font--kr">+82 02-3277-8593</div>
	                <div class="store_hour font--kr">월-목 10:30am-8:00pm / 금-일, 공휴일 10:30am-8:30pm</div>
	            </div>
	            <div class="store_item ">
	                <div class="store_name font--kr">롯데 면세점 명동점</div>
	                <div class="store_address font--kr">서울 중구 을지로 30 12F</div>
	                <div class="store_tel font--kr">+82 70-4240-9664</div>
	                <div class="store_hour font--kr">월-일 9:30am-8:00pm</div>
	            </div>	            
			</div>			
		</div>
		<div class="store_container mx-auto d-bloclist-titlek">
                <div class="text_retailer">
                    <strong>스톡키스트</strong>
                </div>
            	<div class="store_list  mx-auto">
                	<div class="store_item">
                            <div class="store_name font--kr">시코르 홍대점</div>
                            <div class="store_address font--kr">서울특별시 마포구 양화로 147 아일렉스 1F</div>
                            <div class="store_tel font--kr">+82 02-3143-6721</div>
                            <div class="store_hour font--kr">월-일 10:30am-10:00pm</div>
                    </div>
                    <div class="store_item">
                            <div class="store_name font--kr">시코르 강남점</div>
                            <div class="store_address font--kr">서울 서초구 강남대로 441 서산빌딩</div>
                            <div class="store_tel font--kr">+82 02-3495-7600</div>
                            <div class="store_hour font--kr">월-일 10:30am-10:00pm</div>
                     </div>
                     <div class="store_item">
                            <div class="store_name font--kr">10 꼬르소꼬모 에비뉴엘점</div>
                            <div class="store_address font--kr">서울 중구 남대문로 73 5층 10 꼬르소꼬모</div>
                            <div class="store_tel font--kr">+82 02 2118 6095</div>
                            <div class="store_hour font--kr">월-일 10:30am-8:00pm</div>
                     </div>
                     <div class="store_item">
                            <div class="store_name font--kr">10 꼬르소꼬모 청담점</div>
                            <div class="store_address font--kr">서울 강남구 압구정로 416</div>
                            <div class="store_tel font--kr">+82 02 3018 1010</div>
                            <div class="store_hour font--kr">월-일 11:00am-8:00pm</div>
                     </div>
          		</div>
        	</div>		
	</div>
</body>
<jsp:include page="../tamburins_footer.jsp" />
