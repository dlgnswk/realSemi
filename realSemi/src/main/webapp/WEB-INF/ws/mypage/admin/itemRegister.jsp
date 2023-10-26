<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 	 <%-- JSTL을 사용할때 필요 --%>   

<%
	String ctxPath = request.getContextPath();
	// ctxPath ==> /tempSemi
%> 
<jsp:include page="../../tamburins_header.jsp" />

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/ws/mypage/mypageOrderDeliver.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/ws/mypage/mypageLeft_bar.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/ws/mypage/itemRegister.css" />
<link rel="stylesheet"  href="<%= ctxPath%>/css/font.css" type="text/css">

<%-- Optional JavaScript --%> 
<script type="text/javascript" src="<%= ctxPath%>/src/main/webapp/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 


<%-- jQuery CC 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/ws/mypage/itemRegister.js"></script>




<body>
	<div id="member">
		<jsp:include page="../mypageLeft_bar.jsp" />
		
		
		<%-- 공지사항 목록 시작 --%>
		<div id="mypage_right">
			<div class="head_div">
				<div class="page_title">
					<h3 style="font-size:14pt;">제품등록</h3>
				</div>
			</div>
			<div id="board_content_container">		
				<table id="board_table">
					<tr class="bold_line">
						<th id="table_title">제품정보</th>
					</tr>
				</table>
				
				<form name="itemInputFrm" action="<%= ctxPath%>/mypage/admin/itemRegister.tam" method="POST" enctype="multipart/form-data">
					<table id="itemInputTbl">
						<tbody>
							
							
							<%-- 제품 테이블 --%>
							<tr class="Input_tr">
								<td class="Input_title">제품일련번호</td>
								<td>
									<input type="text" name="it_seq_no" size="20" maxlength="6" autofocus/>
								</td>
								
								
								<%-- 제품사진 테이블 --%>
								<td rowspan="3"><div class="back_radius"><img class="bord_radius" src="<%= ctxPath%>/images/ws/mypage/이미지아이콘.jpg" style="width:120px;height:120px;" onclick="goInput()"></div></td>
							</tr>
							
							<tr class="Input_tr">
								<td class="Input_title">제품명</td>
								<td>
									<input type="text" name="it_name" size="50" maxlength="50" />
								</td>
							</tr>
							
							<tr class="Input_tr">
								<td class="Input_title">제품수량</td> 
								<td>
									<input type="number" min="0" max="100" value="0" /><%-- disabled 시키기 --%> <%-- it_stock 에서 더하기--%>
								</td>
							</tr>
							
							<tr class="Input_tr">
								<td class="Input_title">가격</td>
								<td>
									<input type="text" name="it_price" min="10" max="10" />
								</td>
								<td rowspan="6" class="extra__img">dd</td>
							</tr>
												
							<tr class="Input_tr">
								<td class="Input_title">용량</td> 
								<td>
									<input type="text" name="" /> <%-- disabled 시키기 --%>
								</td>
							</tr>
							
							<tr class="Input_tr">
								<td class="Input_title">성분</td> 
								<td>
									<input type="text" name="" /> <%-- disabled 시키기 --%>
								</td>
							</tr>
							
							
							<%-- 카테고리 테이블 --%>
							
							<tr class="Input_tr">
								<td class="Input_title">카테고리명</td>
								<td>
									<select>
									<option value="">:::선택하세요:::</option>
										<c:forEach var="cvo" items="${requestScope.categoryList}">
						            		<option value="${cvo.ca_id}">${cvo.ca_name}</option>
						            	</c:forEach>
					            	</select>
				            	</td>
							</tr>
							
							<tr class="Input_tr">
								<td class="Input_title">사용방법</td> 
								<td>
									<textarea id="hwoToComment" name="ca_how_to_use" rows="7" cols="50" placeholder="자동으로 추가됩니다."></textarea> <%-- disabled 시키기 --%>
								</td>
							</tr>
							
							<tr class="Input_tr">
								<td class="Input_title">주의사항</td> 
								<td>
									<textarea id="cautionComment" name="ca_caution" rows="7" cols="50" placeholder="자동으로 추가됩니다."></textarea> <%-- disabled 시키기 --%>
								</td>
							</tr>
							
							<tr class="Input_tr">
								<td class="Input_title">사용기간</td> 
								<td>
									<input type="text" name="ca_expired" min="10" max="10"  /> <%-- disabled 시키기 --%>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<input type="button" value="저장하기" class="input__save input__float_right" />
					<input type="reset" value="취소하기" class="input__cancel input__float_right" />
					
					
					
					
				</form>
				

			</div>
		</div>
	</div>		
	<br>
</body>

<input type="file" id="imgFile" class="infoData img_file" accept='image/*' /><%-- name 넣어야함--%>

<%-- <jsp:forward page="이동할페이지"/> --%>

<jsp:include page="../../tamburins_footer.jsp" />

	
	
	
	
	
	
	<%-- 네비게이션바 시작 --%>  
    
   <nav class="navbar navbar-expand-lg bg-white navbar-white sticky-top " id="nv"> 
      <div class="err_banner" style="display:none;">
           <span id="err_msg"></span>
       </div>
       
       
       
       
       
       
	
	
	
	
	
	