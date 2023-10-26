<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 주문/배송</title>


<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/db/mypage/mypageOrderDeliver.css" />

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
<%-- 
<script type="text/javascript" src="<%= ctxPath%>/js/db/mypage/mypageOrderDeliver.js"></script>
--%>


</head>
<div class="h3">header가 들어온다.</div>

<body>
	<div id="member">
		<jsp:include page="./mypageLeft_bar.jsp" />
		
		
		<div id="mypage_right">
			<div class="head_div">
				<div class="page_title">
					<h3>주문내역/배송현황</h3>
				</div>
			</div>
			<table id="product_info">
				<tr class="bold_line">
					<th colspan="3" class="table_title">상품 정보</th>
				</tr>
				
				<%-- DB 구매내역이 없는 경우 --%>
				<tr class="non_order_list_tr none_line">
					<td colspan="3" class="non_order_list_td">구매내역이 없습니다.</td>
				</tr>
				
				<%-- DB 구매내역이 있는 경우 (반복) --%>
				<tr class="bold_line">
					<td colspan="3"><div id="date_info"><div class="order_date">주문 일자&nbsp;:&nbsp;<span id="order_date">2023.09.25</span></div><div class="order_detail_view_div"><a class="order_detail_view_a" href="mypageOrderDetail.tam">주문상세></a></div></div></td>
				</tr>
				<tr class="product_detail opac_line">
					<td>
						<img class="product_image" src="<%= ctxPath%>/images/db/PDP_balm_6g_bergaSandal_0.jpg" />
					</td>
					<td>
						<ul class="ul_info">
							<li>퍼퓸 밤 카모</li>
							<li>1개 외 3건</li>
							<li>46,500원 </li>
							<li>입금 대기</li>
						</ul>
					</td>
					<td>
						<button type="button" class="product_detail_view_btn">제품 상세 보기</button>
					</td>
				</tr>
				<%-- DB 구매내역이 있는 경우 (반복) --%>
				
			</table>
		</div>
	</div>		
	<br>
</body>

<div class="h3">footer가 들어온다.</div>

</html>