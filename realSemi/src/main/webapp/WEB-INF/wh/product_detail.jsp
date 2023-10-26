<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	String ctxPath = request.getContextPath(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세페이지</title>

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/wh/product_detail.css" />

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQuery CC 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/wh/product_detail.js"></script>


</head>


<body>
	<div id="container">
		<div id="left" class="float-left">
			<div id="Product_photo">
				<c:forEach var="itemvo" items="${requestScope.infoList}">
						<img src="<%=ctxPath%>/images/wh/${itemvo.imgvo.img_file}"
							class="img-fluid mb-1 img-sm" alt="Responsive image"> 
				</c:forEach> 
			</div>
		</div>


		<div id="right" class="float-right">
			<div id="product_detail">
				<div id="category">
					<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
						 <span>${itemvo.categvo.ca_name}</span>
					</c:forEach> 	
				</div>


				<div id="product_info">
					<div id="product_name">
						<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
					   	 <span id="item_name">${itemvo.it_name}</span>
						</c:forEach>
					</div>

					<div id="product_like">
						<i class="fa-regular fa-star before_like fa-xl" id="unliked" style="color: #333333; margin-bottom: 1%;"></i>
						<span style="display:block; text-align:center; font-size: 13px;">52</span>
						<i class="fa-solid fa-star after_like fa-xl" id="liked" style="color: #333333; display:none;"></i>
					</div>
				</div>
				<div id="product_price">
						<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
							<fmt:formatNumber value="${itemvo.it_price}" pattern="#,###" /> 원
						</c:forEach>
				</div>
				<div id="hide_product_price">
						<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
							${itemvo.it_price}
						</c:forEach>
				</div>

				<div id="smell" class="mt-4 mb-4">
					<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
						 <span>${itemvo.it_theme}</span>
					</c:forEach>
				</div>

				<div id=discription_simple>
					<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
						 <div>${itemvo.it_describe_simple}</div>
					</c:forEach>
					<span id="fullview">샤워리바디 더보기</span>
				</div>

				<div id=discription_full>
					<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
						 <div>${itemvo.it_describe}</div>
					</c:forEach>
				</div>


				<button id="putCart" type="button" onclick="insertInfoCart('${requestScope.it_seq_no}')">장바구니에 담기</button>


				<div id="detail_info">
					<div id="first_info">
						<button type="button" class="btn mt-2 mb-2" data-toggle="collapse"
							data-target="#demo1">온라인 익스클루시브 혜택</button>
						<div id="demo1" class="collapse">
							<div>탬버린즈는 고객님들께 빠른 배송 및 반품과 최고의 경험을 제공하기 위해 언제나 세심한 주의를
								기울입니다. 고객님을 위한 익스클루시브 서비스를 경험해보세요.</div>
						</div>
					</div>

					<div id="second_info">
						<button type="button" class="btn mt-2 mb-2" data-toggle="collapse"
							data-target="#demo2">제품 세부 정보</button>
						<div id="demo2" class="collapse">
							<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
								 <div id="ingredient"><span>전성분</span><br>${itemvo.it_ingredient}</div>
							</c:forEach>

							<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
								 <div id="how_to_use" class="mt-3"><span>사용방법</span><br>${itemvo.categvo.ca_how_to_use}</div>
							</c:forEach>
							
							<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
								 <div id="cautions" class="mt-3"><span>사용할 때의 주의사항</span><br>${itemvo.categvo.ca_caution}</div>
							</c:forEach>

							<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
								 <div id="expiration_date" class="mt-3"><span>사용기한</span><br>${itemvo.categvo.ca_expired}</div>
							</c:forEach>

						</div>
					</div>

					<div id="third_info">
						<button type="button" class="btn mt-2 mb-2" data-toggle="collapse"
							data-target="#demo3">배송 & 반품</button>
						<div id="demo3" class="collapse">
							<div>
								3만원 이상 구매하실 경우 배송 비용은 무료입니다.<br> <span class="mt-3">주문일로부터
									1-2 영업일 이내 출고됩니다.</span>
							</div>

							<div class="mt-3">배송은 지역 택배사 사정에 따라 약간의 지연이 생길 수 있습니다. 배송이
								시작되면 구매자에게는 이메일, 수령인에게는 카카오 알림톡으로 배송 정보를 전송해 드립니다.
								CJ대한통운(https://www.cjlogistics.com)</div>

							<div class="mt-3">
								*상품 혹은 증정품의 포장(랩핑)을 개봉 및 훼손한 경우 반품이 불가합니다.<br> *단순 변심 또는 주문
								실수로 인한 교환이 불가합니다. 신중한 구매 부탁드립니다.
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- === 구매할 상품의 수량 및 가격을 쇼핑백으로 보내기 위한 폼을 생성 === --%>
	<form name="cartFrm">
		<div id="cart">
			<div id="cart_top">
				<div id="cart_title">장바구니</div>
				<div id="cart_item1">

					<input type="checkbox" id="item" name="item" /><label for="item"></label>
					<div id="cart_product_mini_photo">
						<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
						<img src="<%=ctxPath%>/images/wh/${itemvo.imgvo.img_file}"
							class="img-fluid mt-4" alt="Responsive image"> 
						</c:forEach> 
					</div>

					<div id="cart_item_info">
						<div id="cart_product_name">
							
							<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
								 <span id="cart_item_name">${itemvo.it_name}</span>
							</c:forEach>
							<select	id="quantity" name="quantity" onchange="changeQty()">
								<option value="1" selected>1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</div>

						<div id="cart_product_price">
							<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
								<span><label id="price"><fmt:formatNumber value="${itemvo.it_price}" pattern="#,###" /></label> 원</span> 
							</c:forEach>
							<div>
								<span id="delete">삭제</span>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div id="cart_bottom">
				<div id="cart_price_info">
					<div id="all_price">
						<span>총 금액</span>
					</div>
					<div id="product_price_sum">
							<c:forEach begin="1" end="1" var="itemvo" items="${requestScope.infoList}">
								<span><label id="price_sum" ><fmt:formatNumber value="${itemvo.it_price}" pattern="#,###" /></label> 원</span> 
							</c:forEach>
					</div>
				</div>
				
				<%-- 제품명을 폼태그를 이용하여 쇼핑백 페이지로 넘기기 위해 만든 input 히든타입 --%>
				<input type="hidden" name="name"/>
				
				<button type="button" id="order" onclick="goOrder()">주문 하기</button>
			</div>
		</div>
	</form>
</body>
</html>