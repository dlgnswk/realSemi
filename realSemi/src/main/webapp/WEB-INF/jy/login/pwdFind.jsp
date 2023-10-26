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
<title>비밀번호 찾기</title>

<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jy/login/pwdFind.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/jy/common.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/font.css" />
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/js/jy/login/pwdFind.js"></script>
<script>


</script>


</head>
<body>

<main>
<div id="container">
    <div class="page__inner">
        <div class="page__1-col">
            <section class="pwd-section">
               <div class="section_inner">
                    <h1 class="common_title">비밀번호 찾기</h1>
                    <form>

                    <div class="input-item emailCheck" id="emailCheck">
						<div class="div_label label_codeCheck"><label class="input_label" for="mb_telCheck">인증코드 입력</label></div>
						<div class="input_tel_wrap">
							<div class="common_input tel"><input class="text" type="text" id="mb_telCheck" class="input" pattern="[0-9]*" maxlength="10" /></div>
							<div class="common_input button_checkTel_after"><button type="button" class="button_checkTel" id="send_msg_Tel" onclick="sendEmail()">인증하기</button></div>
						</div>
					</div>
					<div class="input-item email">
						<div class="div_label label_email"><label class="input_label" for="mb_email">이메일</label></div>
						<div class="input_tel_wrap">
							<div class="common_input e-mail"><input class="text" type="text" id="mb_email" maxlength="50" size="50" required/></div>
						</div>
					</div>
                        
                        
	                <div class="btn_wrap">
		                <div class="common_btn sendCode_btn" onclick="sendEmail()"><button class="common_btn" type="button" > 이메일 발송</button> </div>           
		                <a href="http://localhost:9090/tempSemi/login/userRegister.tam" class="common_btn goRegister_btn common_mt4">신규 회원가입</a>
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