<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String ctxPath = request.getContextPath(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑백</title>

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/wh/cart_detail.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQuery CC 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/wh/cart_detail.js"></script>


</head>


<body>
	<form name="bagFrm">
	<div id="container">

		<div id="left" class="float-left" >
			<div id="cart_bag">
				<div id="item_info">
					<div id="cart_title">쇼핑백&nbsp;<label>(1개)</label></div>
					
					<div id="cart_item">
						<div id="cart_product_mini_photo">
							<img src="<%= ctxPath%>/images/wh/bw_nimbus_01.jpg" class="img-fluid mt-4">
						</div>

						<div id="cart_item_info">
							<div id="cart_product_name">
								<span style="font-weight:bold;">바디워시 NIMBUS</span> 
								<span>샤워리바디</span>
								<select name="quantity">
									<option value="1" >1</option>
									<option value="2" >2</option>
									<option value="3" >3</option>
									<option value="4" >4</option>
									<option value="5" >5</option>
									<option value="6" >6</option>
									<option value="7" >7</option>
									<option value="8" >8</option>
									<option value="9" >9</option>
									<option value="10">10</option>
								</select>
							</div>

							<div id="cart_product_price">
								<span>52,000 원</span>
								<div>
									<span id="delete">삭제</span>
								</div>
							</div>
						</div>
					</div>
					
					<div id="cart_Noitem">
						<span>장바구니에 담긴 상품이 없습니다.</span>
					</div>
				</div>
			</div>
		</div>


		<div id="right" class="float-right">
			<div id="payment_detail" style="width:100%">
				<div id="payment_title">결제내역</div>
				
				<div id="payment_price" >
					<div>
						<span>주문금액</span>
					</div>
					
					<div>
						<span>156,000 원</span>
					</div>
				</div>
				
				<div id="delivery_charge">
					<div >
						<span>배송비</span>
					</div>
					
					<div>
						<span><span id="free_charge">3만원 이상 구매 시 무료배송</span>&nbsp;&nbsp;&nbsp;0 원</span>
					</div>
				</div>
				
				
				<div id="payment_all_price">
					<div>
						<span>총 금액</span>
					</div>
					
					<div>
						<span>156,000 원</span>
					</div>
				</div>
				
				
				<button id="goPayment" type="button">
					주문 계속하기
				</button>
				
				<button id="goShopping" type="button" onclick="goMain()">
					쇼핑 계속하기
				</button>
				
				<span id="no_bag"> · 환경부 고시에 따라, 기본 쇼핑백이 제공되지 않습니다. </span>
				
			</div>
		</div>

	</div>
	</form>
	
	
</body>
</html>