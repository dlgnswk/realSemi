$(document).ready(function() {

	// 이메일 선택시 뒷부분 자동입력
	$("select#email-select").bind("change", (e) => {
		
		const div_email = $("input#mb_email_suffix");
		
		if($(e.target).val() == "direct") {
			div_email.val("");
			div_email.prop('readonly',false);
			div_email.focus();
		}
		else {
			div_email.val($(e.target).val());			
		}
	})
	
	
	// 비밀번호 에러 메시지 숨김처리
	$("div.error_pwd_notice").hide();
	
	// 아이디가 mb_pwd인 것의 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것
	// 비밀번호 유효성 검사 후 잘못 됐을 시, 오류 메시지
	$("input#mb_pwd").blur( (e) =>{
      
      //const regExp_pwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
      // 또는
      const regExp_pwd = new RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
      // 숫자/문자/특수문자 포함 형태의 8~20 자리 이내의 암호 정규표현식 객체 생성
      
      const bool = regExp_pwd.test($(e.target).val());
      
      if(!bool){
         // 암호가 정규표현식에 위배된 경우
		 $("div.error_pwd_notice").show();			 
         $("div.input_pwd").css("border","1px solid red");
         
      }
      else{
         // 암호가 정규표현식에 맞는 경우
         $("div.input_pwd").css("border","");
         $("div.error_pwd_notice").hide();
         
      }
   }); 

	// 아이디가 mb_pwdcheck 인 것의 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것.
   $("input#mb_pwdCheck").blur( (e) =>{
      
      if($("input#mb_pwd").val() 
      != $("input#mb_pwdCheck").val() ){
         // 암호와 암호확인 값이 틀린경우
         
         // $(e.target).next().hide();
         
         $("div.input_pwdCheck").css("border","1px solid red");         
         
      }
      else{
         // 암호와 암호확인 값이 같은경우
         $("div.input_pwdCheck").css("border","");
      }
   }); 
   
   // 아이디 키다운 됐을 때 이벤트
   $("input#mb_id").bind("keydown", (e) => {
	   
	   if ( $(e.target).val().trim() != "" ) {
		   $(e.target).parent().css("border","");
		   
		   if( $("input#mb_email_suffix").val().trim() != "" ) {
		   		$("input#mb_email_suffix").parent().css("border","");
	   	   }
	   }
   });
   
   // 이메일 change 됐을 때 이벤트
   $("select#email-select").bind("change", () => {
   		if ( $("input#mb_email_suffix").val().trim() != "" ) {
			$("input#mb_email_suffix").parent().css("border","");
		}
   });
   // 이메일 직접입력 시, border 원상복구
   $("input#mb_email_suffix").bind("keyup", () => {
   		$("input#mb_email_suffix").parent().css("border","");
   });
   
   // 이름 키다운 됐을 때 이벤트
    $("input#mb_name").bind("keydown", (e) => {
	   if ( $(e.target).val().trim() != "" ) {
		   $(e.target).parent().css("border","");
	   }
   });
   
});

// 연락처 숫자만 입력 가능 + 하이픈 추가 함수
function onInputHandler_tel() {
	
	let text_tel = $("input:text[id='mb_tel']");
	let tel_val = text_tel.val().replace(/\D/g, "");
	let tel_len = tel_val.length;
	let result = "";
	
	// 세번째 입력 숫자까지 그대로 출력
    if(tel_len < 4) result = tel_val;
    // 4번째에 "-" 추가 후 숫자입력
    else if(tel_len < 8){
	  	result += tel_val.substring(0,3);
	    result += "-";
	    result += tel_val.substring(3);
    // 9번째에 "-" 추가 후 숫자입력
    } else{
	  	result += tel_val.substring(0,3);
	    result += "-";
	    result += tel_val.substring(3,7);
	    result += "-";
	    result += tel_val.substring(7);
    }
	
	// 결과를 값으로 출력
	text_tel.val(result);
	
}

// 날짜 숫자만 입력 가능 + 하이픈 추가 함수
function onInputHandler_birth() {
	let text_birth = $("input:text[id='mb_birth']");
	let birth_val = text_birth.val().replace(/\D/g, "");
	let birth_len = birth_val.length;
	let result = "";

	// 4번째 입력 숫자까지 그대로 출력
    if(birth_len < 5) result = birth_val;
    // 5번째에 "." 추가 후 숫자입력
    else if( birth_val.substring(4,5) !="." && birth_len < 8){
	  	result += birth_val.substring(0,4);
	    result += ".";
	    result += birth_val.substring(4);
    // 9번째에 "-" 추가 후 숫자입력
    } else{
	  	result += birth_val.substring(0,4);
	    result += ".";
	    result += birth_val.substring(4,6);
	    result += ".";
	    result += birth_val.substring(6);
    }
	
	// 결과를 값으로 출력
	text_birth.val(result);	
}


// === 체크박스 전체선택/전체해제 === //
function func_allCheck(bool){
	
	const checkbox_list = document.querySelectorAll("input[name='agree']");
	
	for(let checkbox of checkbox_list) {
		checkbox.checked = bool;
	}// end of for()---------------------

	
}// end of function func_allCheck(bool) {}--------------------




// == 체크박스 전체선택 / 전체해제 에서 
//    하위 체크박스에 체크가 1개라도 체크가 해제되면 체크박스 전체선택/전체해제 체크박스도 체크가 해제되고
//    하위 체크박스에 체크가 모두 체크가 되어지면 체크박스 전체선택/전체해제 체크박스도 체크가 되어지도록 하는 것 == // 
function func_agreeCheck() {	
	
	  $("input:checkbox[name='agree']").click( (e) => {
      //  name이 agree인 체크박스에 대해서 클릭하면 발생하는 이벤트이다.
      
      const bool = $(e.target).prop("checked");
      // 클릭한 체크박스의 체크유무를 알아온다.
      
      
      if(bool) {
      // 클릭한 체크박스가 체크가 되어진 상태이라면
      
         // === [name='agree'] 인 모든 체크박스를 검사해서 모두 체크가 되어진 상태인지 알아온다.
         let b_all_checked = true;
         $("input:checkbox[name='agree']").each( (i, elt) => {
         // $(elt)이 $("div#firstDiv input:checkbox[name='agree']") 중 반복되어지는
         // 하나의 요소이다.
            const b_checked = $(elt).prop("checked");
            // 반복을 돌면서 클릭할때마다 모든 체크박스가 체크가 되었는지 안되었는지 알아온다.
            if(!b_checked){
            // 체크가 되어있지 않은 체크박스를 발견했다. 그렇다면 그 다음에 오는 체크박스를 
            // 확인할 필요가 없다.
               b_all_checked = false;
               return false; // Jquery문의 반복문 탈출 break를 말한다.
            }
            
         }); // end of each()-------------------
         
         if(b_all_checked) {
          // name이 person인 모든 체크박스를 하나하나씩 체크유무 검사를 마쳤을 때
          // 모든 체크박스가 체크가 되어진 상태이라면
             $("input:checkbox[id='agreeAll']").prop("checked", true);
            // "전체선택 / 전체해제 체크박스" 에 체크를한다.
         }
         
	     }
	     else {
	     	// 클릭한 체크박스가 체크가 해제가 되어진 상태라면
	        $("input:checkbox[id='agreeAll']").prop("checked", false);
	        // "전체선택 / 전체해제 체크박스" 에 체크를 해제한다.
	     }
      
   }); // end of $("div#firstDiv input:checkbox[name='person']").click( -----------
	
	
}// end of function func_usaCheck() {}----------------------------


// "가입하기" 버튼 눌렀을 때 호출되는 함수
function goRegister() {
	
// *** 필수입력사항에 모두 입력이 되었는지 검사하기 시작 *** //
   let b_requiredInfo = false;
	
   $("input.text").each(function(index, elmt){
      const data = $(elmt).val().trim();
      
      if(data == ""){
		  $(elmt).parent().css("border","1px solid red"); 
		  if(index==0) {
			 $("div.input_email").css("border","1px solid red");
		  }
		   	         
      }
      
   });
   if (b_requiredInfo == false) {
	   alert("필수 입력 사항을 확인해주세요")
   }
	
} // end of function goRegister() {}-----------------


// 연락처 "인증하기" 버튼 눌렀을 때 호출되는 함수
function sendMsgTel() {
	const mb_tel = $("input#mb_tel").val();
	let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	if(regPhone.test(mb_tel)) {
		confirm(mb_tel+" 전화번호로 인증번호를 발송하시겠습니까?");
	}
	else {
		alert("올바르지 않은 연락처 입니다.")
	}
}