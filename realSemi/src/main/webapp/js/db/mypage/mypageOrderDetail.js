




$(document).ready(function(){
	
	let btn_status = 1;
	
	// 주문상세 페이지 접근 "수정하기" 버튼 클릭 (주소 변경)	
	$("button#up_date__address").bind("click", (e)=>{
		
		 
		if(btn_status == 2) {
		// 배송지 정보를 수정하고 "수정완료" 버튼을 클릭했다.
			
			alert("수정완료 눌렀다.!!!!");
			
		} // end of if(btn_status == 2) --------------
		
		
		if(btn_status == 1) {
		// 처음 주문상세에서 수정하기 버튼을 누를 것이다.
			
			// 버튼색 검은색으로	
			$(e.target).addClass("active__btn").text("수정완료");
			
			// 결제 정보 회색 처리
			$("td.payment__info").addClass("out__");
				
			// "취소하기" => "수정취소"
			$("button#reset__").text("수정취소")
			
			// ** -- 주소 찾기 카카오로 대체 -- ** //
			
			btn_status = 2;
			
		} // end of if(btn_status == 1) -------------
		
		
		
		
		
		
		 
	});	// end of $("button#up_date__address").bind("click", ()=>{
	
	
	
	// "수정하기" 버튼 클릭시 "수정취소"로 변한 버튼 클릭시 이벤트
	 
	
	$("button#reset__").bind("click", (e) => {
		
		
		if(btn_status == 2) {
		// "수정하기" 클릭시
			// "수정하기" => "취소하기"
			$(e.target).text("취소하기");	
			
			// 회색 제거
			$("td.payment__info").removeClass("out__");
			
			$("button#up_date__address").removeClass("active__btn");
			
			btn_status = 1;
		} // end of if(btn_status == 2) ---------
		
		
		if(btn_status == 1) {
		// "취소하기" 버튼을 클릭했다.
			alert("취소하기 버튼 클릭");
			
		} //end of if(btn_status == 1) {
		
		
	}); // end of $("button#name__").bind("click", function(){
	
	
	
	
	
}); // end of $(document).ready(function(){