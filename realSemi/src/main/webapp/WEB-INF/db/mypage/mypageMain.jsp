<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/db/mypage/mypageMain.css" />

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

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/db/mypage/mypageMain.js"></script>





</head>
<div class="h3">header가 들어온다.</div>

<body>
	<div id="member">
		<jsp:include page="./mypageLeft_bar.jsp" />
		
		<div id="mypage_right">
			<table id="shopping_info">
				<tr>
					<th colspan="3" class="table_title">쇼핑 정보</th>
				</tr>
				<tr>
					<th class="table_field_1">상품 정보</th>
					<th class="table_field_2">진행 상황</th>
					<th class="table_field_3"></th>
				</tr>
				<%-- DB 여러개의 값이 들어가야 됨 (반복문) 아래는 예시 -- 쇼핑 정보 상세 ppt-72 --%>
				<tr>
					<td class="product">
						<div class="div_img"><img class="product_image" src="<%= ctxPath%>/images/db/PDP_balm_6g_bergaSandal_0.jpg" /></div>
						<div class="div_info">
							<span>퍼퓸 밤 카모</span><br>
							<span>1개 외 3건</span><br>
							<span>46,500원 </span>
						</div> 
					</td>
					<td class="none__progress">입금 대기</td>
					<td class="detail_view">
						<button type="button" class="detail_view_btn" onclick="location.href='mypageOrderDetail.tam'">상세보기</button>
					</td>
				</tr>
				<tr>
					<td class="product">
						<div class="div_img"><img class="product_image" src="<%= ctxPath%>/images/db/PDP_balm_6g_bergaSandal_0.jpg" /></div>
						<div class="div_info">
							<span>퍼퓸 밤 안카모</span><br>
							<span>1개 외 3건</span><br>
							<span>46,500원 </span>
						</div> 
					</td>
					<td class="none__progress">입금 대기</td>
					<td class="detail_view">
						<button type="button" class="detail_view_btn" onclick="location.href='mypageOrderDetail.tam'">상세보기</button>
					</td>
				</tr>
			<%-- DB 여러개의 값이 들어가야 됨 (반복문) --%>
			</table>
			<div class="div_btn">
				<button id="shopping_view_info_btn" type="button" onclick="location.href='mypageOrderDeliver.tam'">더보기</button>
			</div>
		</div>
	</div>	
	<br>
</body>

<div class="h3">footer가 들어온다.</div>

</html>