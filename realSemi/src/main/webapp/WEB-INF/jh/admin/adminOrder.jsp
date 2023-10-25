<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문관리</title>


<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/admin/adminOrder.css" />

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
<script type="text/javascript" src="<%= ctxPath%>/js/admin/adminOrder.js"></script>





</head>
<div class="h3">header가 들어온다.</div>

<body>
	<div id="member">
		<div id="mypage_left">
			<h3 id="mypage_link"><a href="<%= ctxPath%>/mypage/mypage.tam">관리페이지</a></h3>
			<p id="p_user_info"><span id="user_name">관리자</span></p>
			<ul class="list_md">
				<li class="list_head">주문</li>
				<li><a href="<%= ctxPath%>/mypage/mypageOrderDeliver.tam">주문 관리</a></li>
			</ul>
			
			<ul class="list_md">
				<li class="list_head">회원</li>
				<li><a href="">회원 관리</a></li>
			</ul>
			
			<ul>
				<li class="list_head">상품</li>
				<li><a href="<%= ctxPath%>/mypage/mypageNotice.tam">상품 관리</a></li>
			</ul>
		</div>
		
		<div id="mypage_right">
			<table id="shopping_info">
				<tr>
					<th colspan="8" class="table_title">주문 관리</th>
				</tr>
				<tr>
					<th class="table_field_1" width="10%">주문일련번호</th>
					<th class="table_field_2" width="10%">주문일자</th>
					<th class="table_field_3" colspan="2" width="30%">제품정보</th>
					<th class="table_field_4" width="10%">수량</th>
					<th class="table_field_5" width="10%">금액</th>
					<th class="table_field_6"colspan="2" width="30%" >주문상태변경</th>
				</tr>
				<%-- DB 여러개의 값이 들어가야 됨 (반복문) 아래는 예시 -- 쇼핑 정보 상세 ppt-72 --%>
				<tr class="column_text">
				
					<td width="10%">
						<span>231022180132</span>
					</td>
					
					<td width="10%">
						<span>2023.10.22 18:01:32</span>
					</td>
					
					<td class="product_img" width="10%" style="text-align: right;">
						<div class="div_img"><img class="product_image" src="<%= ctxPath%>/images/index/bw_biga.jpg" width="50px"/></div>
					</td>
					
					<td class="product_name" width="20%" style="text-align: left;">
						<div class="div_info">
							No.<span>18</span>&nbsp;<span>바디워시 BIGALICO</span>
						</div> 
					</td>
					
					<td width="10%">
						<span>1</span>
					</td>
					
					<td width="10%">
						<span>52,000</span>&nbsp;원
					</td>
					
					<td class="status_select o_status_change" width="10%">
						<select name="o_status" class="px-3 o_status_select">
							<option value="">배송준비중</option>
							<option value="">배송중</option>
							<option value="">배송완료</option>
						</select>
					</td>
					
					<td class="o_status_change" width="20%">
						<button type="button" class="o_status_change_btn">변경하기</button>
					</td>
				</tr>
				
				
				<tr class="column_text">
				
					<td width="10%">
						<span>231022180132</span>
					</td>
					
					<td width="10%">
						<span>2023.10.22 18:01:32</span>
					</td>
					
					<td class="product_img" width="10%" style="text-align: right;">
						<div class="div_img"><img class="product_image" src="<%= ctxPath%>/images/index/bw_biga.jpg" width="50px"/></div>
					</td>
					
					<td class="product_name" width="20%" style="text-align: left;">
						<div class="div_info">
							No.<span>18</span>&nbsp;<span>바디워시 BIGALICO</span>
						</div> 
					</td>
					
					<td width="10%">
						<span>1</span>
					</td>
					
					<td width="10%">
						<span>52,000</span>&nbsp;원
					</td>
					
					<td class="status_select">
						<select name="o_status" class="px-3 o_status_select">
							<option value="">배송준비중</option>
							<option value="">배송중</option>
							<option value="">배송완료</option>
						</select>
					</td>
					
					<td class="o_status_change">
						<button type="button" class="o_status_change_btn">변경하기</button>
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