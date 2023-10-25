<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%
    String ctxPath = request.getContextPath();
    //     /tempSemi
%>

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jh/index/index.css" />

<jsp:include page="header_category.jsp" />

<title>전체보기 | Tamburins</title>

	<div class="mx-auto container-xl" style="max-width: 1300px;">
	
		<c:forEach var="cavo" items="${requestScope.cateList}" varStatus="status" >
			
			<div class="category">
			
				<div class="row div_category_item">		
					
						<c:if test="${not empty requestScope.imgList}">
								
							<c:forEach var="imgvo" items="${requestScope.imgList}" varStatus="status">
								
									<c:if test="${cavo.ca_name eq imgvo.cavo.ca_name}">
										<div class="col-6 col-lg-3 px-1 item">
													
											<div class="div_item_image">
												<div class="click_boundary">
													<div class="item_image " style="font-family: sans-serif;">
														<button class="dislike">
															<i class="fa-regular fa-star before_like" style="color: #333333;"></i>
														</button>
														<button class="like">
															<i class="fa-solid fa-star after_like" style="color: #333333;"></i>
														</button>
													</div>
													<a href="/tempSemi/product_detail.tam?it_seq_no=${imgvo.itvo.it_seq_no}" class="a_item ">
														<img src="<%= ctxPath%>/images/jh/index/${imgvo.img_file}" class="img-fluid" />
														<div class="div_item_desc">
															<div class="div_item_ingredient">${imgvo.itvo.it_ingredient}</div>
															<div class="div_item_name">${imgvo.itvo.it_name}</div>
															<div class="div_item_extra">
																<span class="span_item_price"><fmt:formatNumber value="${imgvo.itvo.it_price}" pattern="###,###" />&nbsp;원</span><span class="span_item_volume">${imgvo.itvo.it_volume}</span>
															</div>
														</div>
													</a>
												</div>
											</div>
											
										</div>
									</c:if>
								
							</c:forEach>
								
						</c:if>
					
				</div>
				
				<div class="row div_category_more">
					<button class="btn_category_more col-12 col-lg-3 text-center mx-auto" onclick="location.href='<%=ctxPath%>/category.tam?ca_id=${cavo.ca_id}'"> ${cavo.ca_name} 모두보기 <span>(${cavo.ca_count})</span></button>
				</div>
				
			</div>
			
		</c:forEach>
		
	</div>
</body>

<jsp:include page="footer.jsp" />