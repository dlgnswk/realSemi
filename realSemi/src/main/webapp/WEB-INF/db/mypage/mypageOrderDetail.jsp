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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/db/mypage/mypageOrderDetail.css" />

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
<script type="text/javascript" src="<%= ctxPath%>/js/db/mypage/mypageOrderDetail.js"></script>



</head>
<div class="h3">header가 들어온다.</div>

<body>
	<div id="member">
		<jsp:include page="./mypageLeft_bar.jsp" />
		
		
		<div id="mypage_right">
			<div class="head_div">
				<div class="page_title">
					<h3>주문 상세</h3>
				</div>
			</div>
			
			<table id="product_info">
				<tr class="bold_line">
					<th colspan="2" class="table_title">상품 정보</th>
					<th class="table_title">진행 상황</th>
				</tr>
				
				<%-- DB 구매내역이 없는 경우 --%>
				<%-- 
				<tr class="non_order_list_tr none_line">
					<td colspan="3" class="non_order_list_td">구매내역이 없습니다.</td>
				</tr>
				--%>
				<%-- DB 구매내역이 있는 경우 (반복) --%>
					<%-- 한번 --%>
				<tr class="bold_line">
					<td colspan="3"><div class="order_date">주문일자&nbsp;:&nbsp;<span id="order_date">2023.09.25</span>주문번호&nbsp;:&nbsp;<span id="order__no">2023092519344263</span></div></td>
				</tr>
					<%-- 여러번 시작 --%>
				<tr class="product_detail opac_line">
					<td>
						<img class="product_image" src="<%= ctxPath%>/images/db/PDP_balm_6g_bergaSandal_0.jpg" />
					</td>
					<td>
						<ul class="ul_info">
							<li class="pro__name">퍼퓸 밤 카모</li>
							<li><span class="pro__volume">500mL</span>/ <span class="pur__quantity">1</span>개</li>
							<li><span class="to__price">15,500</span>원</li>
						</ul>	
					</td>
					<td>
						<div>입금 대기</div>
					</td>
				</tr>
				<tr class="product_detail opac_line">
					<td>
						<img class="product_image" src="<%= ctxPath%>/images/db/PDP_balm_6g_bergaSandal_0.jpg" />
					</td>
					<td>
						<ul class="ul_info">
							<li class="pro__name">퍼퓸 밤 카모</li>
							<li><span class="pro__volume">500mL</span>/ <span class="pur__quantity">1</span>개</li>
							<li><span class="to__price">15,500</span>원</li>
						</ul>
					</td>
					<td>
						<div>입금 대기</div>
					</td>
				</tr>
				<tr class="product_detail opac_line">
					<td>
						<img class="product_image" src="<%= ctxPath%>/images/db/PDP_balm_6g_bergaSandal_0.jpg" />
					</td>
					<td>
						<ul class="ul_info">
							<li class="pro__name">퍼퓸 밤 카모</li>
							<li><span class="pro__volume">500mL</span>/ <span class="pur__quantity">1</span>개</li>
							<li><span class="to__price">15,500</span>원</li>
						</ul>
					</td>
					<td>
						<div>입금 대기</div>
					</td>
				</tr>
					<%-- 여러번 끝--%>
				<%-- DB 구매내역이 있는 경우 (반복) --%>
			</table>
			
				
			<table id="payment__info" class="opac_line__bt">
				<tr class="payment__info__hd opac_line__bt" >
					<th>배송지 정보</th>
					<th>결제 정보</th>
					<th></th>
				</tr>
				<tr>
					<td class="user__info">
						<ul>
							<li id="user__name">고고고</li>
							<li id="user__address1">080378 고고 고고고 고고고 4고</li>
							<li id="user__address2">1200고</li>
							<li id="user__mobile">010-9999-9999</li>
						</ul>
					</td>
					<td class="payment__info">
						<ul>
							<li class="opac_line__bt">
								<div class="__flex"><div>결제수단</div><div id="payment__method" class="__flex_right">무통장입금</div></div>
							</li>
							<li class="opac_line__bt">
								<div class="__flex"><div>주문금액</div><div id="order__amount" class="__flex_right">185,000원</div></div>
							</li>
							<li class="opac_line__bt">
								<div class="__flex"><div>배송비</div><div id="deli__fee" class="__flex_right">0원</div></div>
							</li>
							<li class="font__bold">
								<div class="__flex"><div>총 결제 금액</div><div id="tot_order__amount" class="__flex_right">185,000원</div></div>
							</li>
						</ul>
						
						<div id="re_total_amount">185,500원</div>
						<div>(입금마감일 <span id="payment__date">2023-09-27 23:59:59</span>)</div>
						<br>
						<div id="payment__bank">농협은행 79005868400956</div>
						<div>(주)아이아이컴바인드</div>
					</td>
					<td class="ver__top">
						<div>
							<div class="__flex">
								<div><button class="white__" id="up_date__address" type="button">수정하기</button></div>
								<div class="__flex_right"><button class="white__ up__can" id="reset__" type="button">취소하기</button></div>
							</div>
							<div><button class="white__" type="button" onclick="location.href='mypageOrderDeliver.tam'">주문목록 돌아기기</button></div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="__notification">
				<ul>
					<li class="list__title">온라인 취소/교환/반품 안내</li>
					<li class="list__head">취소</li>
					<li class="list__cont">
						ㆍ상품 준비 단계에서는 배송을 위한 출고 작업이 시작되므로, 주문 최소 및 주문 정보(상품,
						<br>
						수량, 배송지) 변경이 불가합니다.</li>
					<li class="list__head">교환 및 반품</li>
					<li class="list__cont">
						ㆍ반품(환불)은 수령일 이후 7일 이내 마이페이지를 통해서 접수가 가능합니다.
					</li>
					<li class="list__cont">
						ㆍ단순변심 또는 주문 실수로 인한 교환은 불가합니다. 원하시는 상품으로 재 구매를
						<br>
						해주세요.
					</li>
					<li class="List_add__cont">
						도움이 필요하신가요? 더 궁금하신 사항이 있다면 탬버린즈 고객센터[1644-1246] 또는
						<br>
						cs@tamburins.com 로 문의하여 주십시오.
					</li>
				</ul>
			</div>
		</div>
			
	</div>
</body>

<div class="h3">footer가 들어온다.</div>

</html>