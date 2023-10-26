<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%
    String ctxPath = request.getContextPath();
    //    /MyMVC
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: 주문상품 정보 조회 :::</title>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.2-dist/css/bootstrap.min.css" > 

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/template/template.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/member/memberEdit.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.2-dist/js/bootstrap.bundle.min.js" ></script> 

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<%-- 직접 만든 JS --%>
<script type="text/javascript" src="<%= ctxPath%>/js/member/memberEdit.js"></script>

<head>
<meta charset="UTF-8">
<title>주문상품 정보 조회</title>
</head>
<body>
	주문상품 정보 조회 페이지
</body>
</html>