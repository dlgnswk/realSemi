<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<%
    String ctxPath = request.getContextPath();
    //    /tempSemi
%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<c:forEach var="imgvo" items="${requestScope.imgList}" begin="1" end="1">
	<title>${imgvo.cavo.ca_name} | Tamburins</title>
</c:forEach>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jh/index/index.css" />

<%-- font CSS--%>
<link rel="stylesheet" href="<%= ctxPath%>/css/font.css" type="text/css">

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS 및 JS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jh/index/index.js"></script>

</head>
<body>
	<div class="mx-auto container-xl" style="max-width: 1300px;">
			
			<div class="category">
			
				<div class="row div_category_item">		
					
						<c:if test="${not empty requestScope.imgList}">
								
							<c:forEach var="imgvo" items="${requestScope.imgList}" varStatus="status">
								
									
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
													<a href="/tempSemi/product_detail.tam?it_seq_no=${imgvo.itvo.it_seq_no}" class="a_item">
														<img src="<%= ctxPath%>/images/index/${imgvo.img_file}" class="img-fluid" />
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
									
								
							</c:forEach>
								
						</c:if>
					
				</div>
			</div>
		
	</div>
</body>
</html>