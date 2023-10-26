<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<%
	// 컨텍스트 패스명(context path name)을 알아오고자 한다.
	String ctxPath = request.getContextPath();
	// ctxPath ==> /tempSemi
%> 

<jsp:include page="../tamburins_header.jsp" />

<link rel="stylesheet"  href="<%= ctxPath%>/css/ws/paymentEnd.css" type="text/css">
<link rel="stylesheet"  href="<%= ctxPath%>/font/font.css" type="text/css">

<div class="alert_thanks">주문이 완료되었습니다.<br>감사합니다.</div>

<div class="alert_summary">
	<p>손 소독제 FEY9 / 30mL / 1개 외 2 건</p>
	<p>2023.10.12 주문하신 주문번호는 202310126352509 입니다.</p>
</div>

<div id="tbl_container">
	<table id="tbl_payment_info">
		<thead>
			<tr>
				<th>상품 정보</th>
					
				<th>배송지 정보</th>
				
				<th>결제 정보</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td colspan="3">
					<span>&nbsp;주문일자 : 2023-10-12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <%-- sysdate --%>
					<span>주문번호 : 202310126352509&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <%-- sysdate + 6352509(랜덤번호?) --%>
					<span>주문자 : 최*석(1234*****@naver.com)</span> <%-- 앞에 4자리 이후 *찍기 --%>
				</td>
			</tr>
			
			<tr>
				<td>
					<div class="item_info">
						<p>손 소독제 FEY9</p>
						<p>30mL / 1개 외 2 건</p>
						<p><fmt:formatNumber pattern="#,###">8500</fmt:formatNumber></p>
						<p><a>더보기</a></p><br>
					</div>
				</td>
				<td>
					<div class="delivery_info">
						<p>최*석</p>
						<p>22399 인천 중구 은하수로 351 **********</p>
						<p>010-****-1825</p>
					</div>
				</td>
				<td>
					<div class="payment_info">
						<p>NAVERPAY</p> <%-- 결제수단 --%>
						<p><span style="font-weight:700;"><fmt:formatNumber pattern="#,###">8500</fmt:formatNumber></span>&nbsp;&nbsp;원</p>

						<table id="sub_table" style="width:100%;">
						<tbody>
							<tr>
								<td style="float:left;">주문 금액</td>
								<td style="float:right;"><span><fmt:formatNumber pattern="#,###">8500</fmt:formatNumber> 원</span></td>
							</tr>
							
							<tr>
								<td style="float:left;">배송비</td>
								<td style="float:right;"><span>+<fmt:formatNumber pattern="#,###">2500</fmt:formatNumber> 원</span></td>
							</tr>
							
							<tr>
								<td style="float:left;">총 금액 금액</td>
								<td style="float:right;"><span><fmt:formatNumber pattern="#,###">8000</fmt:formatNumber> 원</span></td>
							</tr>
						</tbody>
						</table>
						
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<div id="btn_container">
	<button type="button" class="btn btn-dark" style="background-color:black;">주문내역 조회하기</button>
	<button type="button" class="btn btn-white" style="background-color:white;">쇼핑 계속하기</button>	
</div>



<jsp:include page="../tamburins_footer.jsp" />


