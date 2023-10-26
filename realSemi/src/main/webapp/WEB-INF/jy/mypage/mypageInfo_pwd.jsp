<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

<%-- Font Awesome 6 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jy/mypage/mypageInfo_pwd.css" />

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
<script type="text/javascript" src="<%= ctxPath%>/js/jy/mypage/mypageInfo_pwd.js"></script>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jy/common.css" />

<script type="text/javascript">

$(document).ready(function() {
	
	$("button#btn_pwdCheck").bind("click", function () {
		const input_pwd = $("input#pwd").val();
		$.ajax({
			url:"myPagePwdCheck.tam", // 이곳에 JSON 형식으로 보여주는 것!
			type:"POST", // 생략가능~ 기본값은 "get"
			data:{"pwd":input_pwd}, //  8    8    8     8     8
			dataType:"json",
			success:function(json){
				
				if(json.isMatch) {
					// 비밀번호가 맞을 때
					const frm = document.pwdFrm;
					frm.action = "myPageInfoEdit.tam";
					frm.method = "POST";
					frm.submit();	
					
				}
				
				else {
					// 비밀번호가 틀릴 경우
					alert("비밀번호가 일치하지 않습니다");
				}
				
				
			}, // end of success
			error:function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});
	
	});
});


</script>

</head>
<div class="h3">header가 들어온다.</div>

<body>
	<div id="member">
		<div id="mypage_left">
			<h3 id="mypage_link"><a href="<%= ctxPath%>/jy/mypage/mypage.tam">마이페이지</a></h3>
			<p id="p_user_info"><span id="user_name">박동빈</span><span id="point">3,000P</span></p>
			<ul class="list_md">
				<li class="list_head">쇼핑 정보</li>
				<li><a href="<%= ctxPath%>/jy/mypage/mypageOrderDeliver.tam">주문 / 배송</a></li>
			</ul>
			
			<ul class="list_md">
				<li class="list_head">계정 정보</li>
				<li><a href="<%= ctxPath%>/jy/mypage/myPageInfoPwd.tam">회원정보 수정</a></li>
			</ul>
			
			<ul>
				<li class="list_head">고객센터</li>
				<li><a href="<%= ctxPath%>/jy/mypage/mypageNotice.tam">공지사항</a></li>
				<li><a href="<%= ctxPath%>/jy/mypage/mypageCustomerCare.tam">자주 묻는 질문</a></li>
				<li><a href="">1:1 문의하기</a></li>
			</ul>
		</div>
		
		<div id="mypage_right" class="mypage_info_right">
         <div class="head_div">
            <div class="page_title">
               <h3>비밀번호 확인</h3>
            </div>
         </div>
			<div class="sub_title_div">
				<span class="sub_title_sp">회원정보 수정</span>
			</div>
			<div class="inner_contents_wrap">
				<form name="pwdFrm" class="inner_contents">
					 <div class="input_item">
		                 <div class="input_label">
		                     <label class="input_label" for="pwd">비밀번호</label>
		                 </div>
		                 <div class="common_input" id="div_pw">
		                     <input type="password" name="pwd" id="pwd" class="text" required="" size="20" maxlength="20">
		                 </div>
	                 </div>
	                 <div class="btn_wrap">
	                	 <div class="common_btn" id="div_btn_pwdCheck"><button class="common_btn" type="button" id="btn_pwdCheck">비밀번호 확인</button></div>
	                 </div>
				</form>		
			</div>	
		</div>
	</div>	
	<br>
</body>

<div class="h3">footer가 들어온다.</div>

</html>