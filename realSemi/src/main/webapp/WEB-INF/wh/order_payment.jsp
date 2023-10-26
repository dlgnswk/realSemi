<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String ctxPath = request.getContextPath(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/wh/order_payment.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQuery CC 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/wh/order_payment.js"></script>


</head>


<body>
	<%-- === 주문을 하기 위한 폼을 생성 === --%>
	<form name="orderFrm">
	<div id="container" class="container">
		<div id="left" class="float-left">
			<div id="order_payment">
				
				<div id="payment_info_title">
					주문/결제
				</div>
				
				<div id="payment_process">
					
					<div id="buyer_info">
							<button type="button" class="btn mt-2 mb-2" data-toggle="collapse" data-target="#demo1">주문자 정보</button>
								<div id="demo1" class="collapse show" >
									<div id="">
									
										
										<div class="page_1">
											<section class="signup-section1">
												<div class="section_inner signup">
													<div class="input-item email"  >
														<div class="div_label input_label"><label class="input_label" for="mb_id" >이메일</label></div>
														<div class="input_email_container">
															<div class="input input_email" style="display:inline;"><input type="text" class="text" id="mb_id" value="chlaudehdwkd" maxlength=15 required autocomplete="off" style="width:30%;"/></div>
															<div class="text_wrap" style="display:inline;"><span style="cursor:default;">@</span></div>
									                       	<div class="input_email_wrap" style="display:inline;" >
										                       	<div class="input input_email" style="display:inline;"><input type="text" class="text" id="mb_email_suffix" name="mb_email_suffix" value="naver.com" readonly style="width:30%;  "></div>                  
																		<div class="input div_select_email" id="div_email-select" style="cursor:default; display:inline;">
																		<select class="tam-select_input input_email" id="email-select" style="width:31%; height: 35px; ">
																			<option value="" selected="" disabled="">옵션 선택</option>
													                        <option value="naver.com" selected="naver.com" >naver.com</option>
													                        <option value="hanmail.net">hanmail.net</option>
													                        <option value="nate.com">nate.com</option>
													                        <option value="gmail.com">gmail.com</option>
													                        <option value="hotmail.com">hotmail.com</option>
													                        <option value="hanmir.com">hanmir.com</option>
													                        <option value="dreamwiz.com">dreamwiz.com</option>
													                        <option value="lycos.co.kr">lycos.co.kr</option>
													                        <option value="empas.com">empas.com</option>
													                        <option value="direct">직접 입력</option>			
																		</select>
																		</div>
																</div>
															</div>								
														</div>
													</div>
													
													
													<div class="input-item name" style="margin-top:5%;">
														<div class="div_label label_name"><label class="input_label" for="mb_name">이름</label></div>
														<div class="input input_name" ><input class="text" type="text" id="mb_name" value="최우현"  maxlength="15" required style="width:100%;" /></div>
													</div>
													
												
													
													<div class="input-item tel" style="margin:5% 0;">
														<div class="div_label label_tel" ><label class="input_label" for="mb_tel">연락처</label></div>
														<div class="input_tel_wrap" style="width:100%;">
															<div class="input tel" style="display:inline;"><input style="width:72%;" class="text" type="text" id="mb_tel" class="input" value="010-5558-7623" pattern="[0-9]*" maxlength="13" oninput="onInputHandler_tel()" required /></div>
															<div class="input button_checkTel" style="display:inline; width:30%;"><button type="button" class="button_checkTel" id="send_msg_Tel" onclick="sendMsgTel()">인증하기</button></div>
														</div>
													</div>
													
													
													
													<div class="agree_list" style="margin-bottom:5%;">
														<div class="checkbox-item">
																<div>
																	<input type="checkbox" id="agreeAll" class="checkbox-item" onclick="func_allCheck(this.checked)"/><label class="agree agreeAll" for="agreeAll"></label>
																	모두 동의합니다.
																</div>
														</div>
														
														<div class="checkbox-item">
															<div style="font-size:9px;">
																<input type="checkbox" name="agree" id="agreeAge" class="checkbox-item" onclick="func_agreeCheck()"/><label class="agree" for="agreeAge" style="font-size:9px;"></label>
																
																(필수) 개인정보처리방침 <a style="font-size:9px;" >자세히 보기</a> 
															</div> 
															
														</div>	
															
														<div class="checkbox-item">
															<div style="font-size:9px;">
																<input type="checkbox" name="agree" id="agreeAge" class="checkbox-item" onclick="func_agreeCheck()"/><label class="agree" for="agreeAge" style="font-size:9px;"></label>
																
																(필수) 이용약관 동의 <a style="font-size:9px;" >자세히 보기</a> 
															</div>
																
														</div>	
													</div>
											
												<button id="nextLevel" name="nextLevel" type="button" >
													저장하고 다음 단계로
												</button> 
											
											</section>
										</div>		
									
									
									
									</div>
								</div>
					</div>
						
					<div id="shipping_info">
						<button type="button" class="btn mt-2 mb-2" data-toggle="collapse" data-target="#demo2" style="text-align:left;">배송 정보</button>
							<div id="demo2" class="collapse" >
							
										
										<div class="page_2">
											<section class="signup-section2">
												
													
													
													
													<div class="input name" style="margin:8% 0;">
														<div class="div_label label_name" ><label class="input_label" for="name">수령인</label><a style="font-size:11px; float:right; margin-top:1%; line-height: 13px; border-bottom:solid 1px gray;">주문자 정보와 동일</a></div>
														<div class="input input_name" ><input class="text" type="text" id="name"  maxlength="15" required style="width:100%;"></div>
													</div>
													
													<div class="input tel" style="margin:13% 0;">
														<div class="div_label label_tel"><label class="input_label" for="tel">연락처</label></div>
														<div class="input_tel_wrap">
															<div class="input tel"><input class="text" type="text" id="tel" class="input" value="010-5558-7623" pattern="[0-9]*" maxlength="13" oninput="onInputHandler_tel()" required style="width:100%; text-align:left;"/></div>
														</div>
													</div>
													
													<div class="input address" style="margin:13% 0;">
														<div class="div_label label_address" ><label class="input_label" for="address">배송주소</label><a style="font-size:10px; float:right; margin-top:1%; line-height: 13px; border-bottom:solid 1px gray;">최근배송지</a></div>
														<div class="input_address_wrap" style="width:100%;">
															<div class="input Address" style="display:inline;"><input style="width:65%;" class="text" type="text" id="address" class="input" placeholder="예) 서교동 아지오빌딩, 와우산로" required /></div>
															<div class="input AddressSearch" style="display:inline; width:40%; "><button type="button" class="button_addressSearch" id="addressSearch" onclick="addressSearch()">검색</button></div>
															<div class="input detailAddress" style="margin-top:1%;"><input type="text" id="detailAddress" name="detailAddress" placeholder="나머지 주소 입력"style="width:100%;" /></div>
														</div>
													</div>
													
													<div class="input message" style="margin-top:26%; margin-bottom:18%;">
														<div class="div_label label_message" ><label class="input_label" for="message">기사님께 전하는 메시지</label></div>
														<div class="input input_message" ><input class="text" type="text" id="message"  maxlength="20" required style="width:100%;"></div>
													</div>
													
													<button id="nextLevel" name="nextLevel" type="button" >
													저장하고 다음 단계로
													</button>
										</section>			
								 	</div>
								
							</div>
											
						</div>		
									

					<div id="payment_method_info">
						<button type="button" class="btn mt-2 mb-2" data-toggle="collapse" data-target="#demo3" style="text-align:left;">결제 수단</button>
							<div id="demo3" class="collapse">
							   
							   <div id="payment_info" style="width:56%; margin:0 auto; text-align: center;">
							   
								   <button id="kakaopay" name="kakaopay" type="button" >
									카카오페이
								   </button>
								   
								   <button id="naverpay" name="naverpay" type="button" >
									네이버페이
								   </button>
								   
								   <button id="creditcard" name="creditcard" type="button" >
									신용카드
								   </button>
								   
								   <button id="no_account" name="no_account" type="button" >
									무통장입금
								   </button>
								   
								   <button id="account_transfer" name="account_transfer" type="button" >
									실시간 계좌이체
								   </button>
								   
								   
								   
								   
								   <div class="agree_list" style="margin-top:15%; text-align: left; padding-left:3%;">
										<div class="checkbox-item mb-2" >
											<div style="font-size:13px;">
												<input type="checkbox" id="agreeAll" class="checkbox-item" onclick="func_allCheck(this.checked)"/><label class="agree agreeAll" for="agreeAll"></label>
												모두 동의합니다.
											</div>
										</div>
										
										<div class="checkbox-item">
											<div style="font-size:11px;">
												<input type="checkbox" name="agree" id="agreeAge" class="checkbox-item" onclick="func_agreeCheck()"/><label class="agree" for="agreeAge"></label>
												(필수) 본인은 만 14세 미만이 아닙니다.
											</div>
										</div>	
											
										<div class="checkbox-item" style="font-size:11px;" >
											<div style="font-size:11px;">
												<input type="checkbox" name="agree" id="agreeAge" class="checkbox-item" onclick="func_agreeCheck()"/><label class="agree" for="agreeAge"></label>
												(필수) <a style="font-size:11px; border-bottom: solid 1px #343434;" >이용약관</a>에 동의합니다.
											</div>
										</div>	
											
										<div class="checkbox-item" style="font-size:11px;" >
											<div style="font-size:11px;">
												<input type="checkbox" name="agree" id="agreeAge" class="checkbox-item" onclick="func_agreeCheck()"/><label class="agree" for="agreeAge"></label> 
												(필수) <a style="font-size:11px; border-bottom: solid 1px #343434;" >개인정보처리방침</a>에 동의합니다. 
											</div>
										</div>	
											
										<div class="checkbox-item" style="font-size:11px;" >
											<div style="font-size:11px;">
												<input type="checkbox" name="agree" id="agreeAge" class="checkbox-item" onclick="func_agreeCheck()"/><label class="agree" for="agreeAge"></label>
												(필수) 위 주문의 상품, 가격, 할인, 배송 정보에 동의합니다. 
											</div>
										</div>	
									
									
									
									
										<button id="payment" name="payment" type="button" >
										결제하기
										</button>
								
									</div>
						 	  </div>
							   
						</div>
					
					</div>
				
				</div>

						


				
			</div>
		</div>


		<div id="right"
			style="border:solid 0px blue; width: 31%; display: flex; margin-top: 7%;"
			class="float-right">
			<div id="payment_detail" style="width: 100%">
				<div id="payment_info_title" style="width: 100%; font-size: 17px; font-weight: 600; ">
					결제 내역
				</div>
				
				<div id="order_item1"
					style="border-bottom: 0.5px solid #c6c6c6; display: flex;  padding-bottom: 5%;">

					<div id="cart_product_mini_photo" style="width: 22%; float: left">
						<img src="<%=ctxPath%>/images/bw_nimbus_01.jpg" class="img-fluid mt-4"
							style="border-radius: 3px;">
					</div>

					<div id="order_item_info"
						style="width: 100%; display: flex; margin: 7% 0 0 5%; justify-content: space-between;">
						<div id="cart_product_name">
							<span
								style="margin-bottom: 0; font-size: 12px; font-weight: 600; display: block">바디워시
								NIMBUS</span> <span
								style="margin-bottom: 0; font-size: 12px; font-weight: 500; display: block">1 개</span>

						</div>

						<div id="order_product_price" style="text-align: left;">
							<span style="font-size: 12px; font-weight: 600; display: block;">52,000
								원</span>
						</div>
					</div>
				</div>
				
				<div id="order_item2"
					style="border-bottom: 0.5px solid #c6c6c6; display: flex;  padding-bottom: 5%;">

					<div id="cart_product_mini_photo" style="width: 22%; float: left">
						<img src="<%=ctxPath%>/images/bw_nimbus_01.jpg" class="img-fluid mt-4"
							style="border-radius: 3px;">
					</div>

					<div id="order_item_info"
						style="width: 100%; display: flex; margin: 7% 0 0 5%; justify-content: space-between;">
						<div id="cart_product_name">
							<span
								style="margin-bottom: 0; font-size: 12px; font-weight: 600; display: block">바디워시
								NIMBUS</span> <span
								style="margin-bottom: 0; font-size: 12px; font-weight: 500; display: block">1 개</span>

						</div>

						<div id="order_product_price" style="text-align: left;">
							<span style="font-size: 12px; font-weight: 600; display: block;">52,000
								원</span>
						</div>
					</div>
				</div>
				
				<div id="order_item3"
					style="display: flex;  padding-bottom: 5%;">

					<div id="cart_product_mini_photo" style="width: 22%; float: left">
						<img src="<%=ctxPath%>/images/bw_nimbus_01.jpg" class="img-fluid mt-4"
							style="border-radius: 3px;">
					</div>

					<div id="order_item_info"
						style="width: 100%; display: flex; margin: 7% 0 0 5%; justify-content: space-between;">
						<div id="cart_product_name">
							<span
								style="margin-bottom: 0; font-size: 12px; font-weight: 600; display: block">바디워시
								NIMBUS</span> <span
								style="margin-bottom: 0; font-size: 12px; font-weight: 500; display: block">1 개</span>

						</div>

						<div id="order_product_price" style="text-align: left;">
							<span style="font-size: 12px; font-weight: 600; display: block;">52,000
								원</span>
						</div>
					</div>
				</div>

				
				<div style="display: flex; align-items: center; justify-content: space-between; border-top:solid 2px black; border-bottom:solid 1px #c6c6c6; margin-top:8%; padding-top:7%; padding-bottom:4%  ">
					<div id="payment_price" >
						<span style="font-size: 11px; font-weight: 500; ">주문 금액</span>
					</div>
					
					<div id="product_price">
						<span style=" font-size: 11px; font-weight: 600; ">156,000 원</span>
					</div>
				</div>
				
				<div style="display: flex; align-items: center; justify-content: space-between; border-bottom:solid 1px #c6c6c6; padding-top:4%; padding-bottom:4%  ">
					<div id="delivery_charge" >
						<span style="font-size: 11px; font-weight: 500;">배송비</span>
					</div>
					
					<div id="delivery_price">
						<span style=" font-size: 11px; font-weight: 600;">
						 + 0 원
						</span>
					</div>
				</div>
				
				
				<div style="display: flex; align-items: center; justify-content: space-between; padding-top:4%; padding-bottom:4%; border-bottom:solid 2px black; ">
					<div id="payment_all_price" >
						<span style="font-size: 13px; font-weight: 600; ">총 금액</span>
					</div>
					
					<div id="product_sum_price">
						<span style=" font-size: 13px; font-weight: 600; ">156,000 원</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	

</body>
</html>