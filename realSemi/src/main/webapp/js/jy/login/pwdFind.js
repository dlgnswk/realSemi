$(document).ready(function () {
	$("div#emailCheck").hide();
	
	$("input#mb_email").bind("keydown", function (e) {
		
		if(e.keyCode == 13) {
			sendEmail();
		}
	});
})

function sendEmail() {
	
	//const regExp_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
    // 또는
    const regExp_email = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
    // 숫자/문자/특수문자 포함 형태의 8~15 자리 이내의 암호 정규표현식 객체 생성
    
    const email = $("input#mb_email").val();
    
    const bool = regExp_email.test(email);
    
    if(!bool){
       // 이메일이 정규 표현식에 어긋났을 경우
      alert("이메일이 잘못됐습니다")
    }
    else{
       // 이메일이 정규표현식에 맞는 경우(메일을 보낼 것이다!)
       alert("메일을 보냅니다.")
       $("div#emailCheck").show();
    }
		
	
}// end of function sendEmail()--------------


