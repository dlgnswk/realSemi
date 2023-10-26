<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String ctxPath = request.getContextPath();
	//	   /tempSemi
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jy/login/idFind.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/font.css" />
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/js/jy/login/userRegister.js"></script>

</head>
<body>
<script>

// 인증하기 숨김처리
$("div.telCheck").hide();
$("p.password-notice").hide();

function sendMsgTel() {
	const mb_tel = $("input#mb_tel").val();
	let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(regPhone.test(mb_tel)) {
		
		const result = confirm(mb_tel+" 전화번호로 인증번호를 발송하시겠습니까?");
		
		if(result){
			$("div.telCheck").show();
			$("div.button_checkTel").hide();
			$("input#mb_tel").prop("readonly",true);
			$("input#mb_tel").css({'background-color':'rgb(224, 224, 224, 0.5)', 'color':'black'});
		}
		
		
	}
	else {
		alert("올바르지 않은 연락처 입니다.")
	}
}// end of function sendMsgTel()--------------

function test() {
	alert("성공!")
}
</script>
<main>
<div id="container">
    <div class="page__inner">
        <div class="page__1-col">
            <section class="Id-section">
               <div class="section_inner">
                    <h1 class="title">아이디 찾기</h1>
                    <form class="account__form" id="id_lost_form" name="fpasswordlost" action="https://www.tamburins.com/bbs/password_lost2.php" onsubmit="return" method="post" autocomplete="off">

                    <div class="input-item telCheck">
						<div class="div_label label_telCheck"><label class="input_label" for="mb_telCheck">인증번호 입력</label></div>
						<div class="input_tel_wrap">
							<div class="input tel"><input class="text" type="text" id="mb_telCheck" class="input" pattern="[0-9]*" maxlength="10" /></div>
							<div class="input button_checkTel_after"><button type="button" class="button_checkTel" id="checkCode" onclick=" ">인증하기</button></div>
						</div>
					</div>
					<div class="input-item tel">
						<div class="div_label label_tel"><label class="input_label" for="mb_tel">연락처</label></div>
						<div class="input_tel_wrap">
							<div class="input tel input_tel"><input class="text" type="text" id="mb_tel" class="input" placeholder="예: 01012341234" pattern="[0-9]*" maxlength="13" oninput="onInputHandler_tel()" required/></div>
							<div class="input button_checkTel"><button type="button" class="button_checkTel" id="send_msg_Tel" onclick="sendMsgTel()">인증하기</button></div>
						</div>
					</div>
                        
                        
	                <div class="join__btn login">
		                <a class="btn btn_login" onclick="test()">로그인</a>	                
		                <a href="http://localhost:9090/tempSemi/memberRegister.tam" class="btn btn_register">신규 회원가입</a>
	                </div>
                        
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>

</main>
</body>
</html>