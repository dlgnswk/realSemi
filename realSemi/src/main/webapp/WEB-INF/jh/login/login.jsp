<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String ctxPath = request.getContextPath();
	//	   /tempSemi
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | Tamburins</title>

<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jh/login/login.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jh/font.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jh/login/common.css" />

<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript" src="<%= ctxPath%>/js/jh/login/login.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		
		
		
	});
</script>

</head>
<body>
	<div class="page__2-col--wide">
		<!-- left section : login -->
		<section class="login-section section--left">
			<div class="section__inner">
				<h1 class="common_title">로그인</h1>
			
				<form class="account__form" name="loginFrm" action="<%= ctxPath%>/login/loginCheck.tam" method="post">
					
					<div class="input_item">
						<div class="input_label">
							<label class="input_label" for="userid">아이디</label>
						</div>
						<div class="common_input">
							<input type="text" name="userid" id="userid" class="text" size="20" maxlength="50" autocomplete="off" >
						</div>
					</div>
					
					<div class="input_item">
						<div class="input_label">
							<label class="input_label" for="pwd">비밀번호</label>
						</div>
						<div class="common_input">
							<input type="password" name="pwd" id="pwd" class="text" size="20" maxlength="20">
						</div>
					</div>
				
					<div class="btn_wrap">
						<div class="common_btn" id="btn_login">
							<button class="common_btn" type="button" id="btnSubmit" >로그인</button>
						</div>           
						<div class="common_btn common_mt4" id="kakao_button" onclick="kakaoPopup('https://kauth.kakao.com/oauth/authorize?client_id=79e13928f1cf993b2db5c76dc2c43349&amp;redirect_uri=https://www.tamburins.com/plugin/social/kakao_login_member.php&amp;response_type=code&amp;state=https://www.tamburins.com/')">
							<button class="common_btn" type="button">카카오 로그인</button>
						</div>                             
					</div>
					
					<!-- 
						<button type="button" class="btn social__btn social__btn--kakao"
							onclick="window.open('https://www.tamburins.com/plugin/social/popup.php?provider=kakao&amp;url=https%3A%2F%2Fwww.tamburins.com%2F','social_sing_on', 'location=0,status=0,scrollbars=1,width=500,height=600')">
							카카오 계정으로 로그인
						</button>                                     
                                      
					-->
                       
					<div class="text-wrap">
						<p>
							<a href="https://www.tamburins.com/bbs/id_lost.php">아이디</a>
							&nbsp;또는&nbsp;                    
							<a href="https://www.tamburins.com/bbs/password_lost.php">비밀번호 찾기</a>
							&nbsp;|&nbsp;
							<a href="https://www.tamburins.com/bbs/password_lost.php">회원가입</a>
						</p>
					</div>

				</form>
			</div>
		</section>
		<!-- // left section : login End -->
           
		<!-- right section : join -->
		<section class="login-section section--right">
			<div class="section__inner">
				<h1 class="common_title">회원가입</h1>
				<p class="right_top_txt">회원가입 시 즉시 사용 가능한 3,000원 혜택을 드립니다.</p>
				<div class="btn_wrap">
					<a href="http://localhost:9090/tempSemi/memberRegister.tam" class="common_btn goRegister_btn">신규 회원가입</a>
				</div>
			</div>
		</section>
		<!-- // right section : join End -->
	</div>
</body>
</html>