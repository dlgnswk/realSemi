$(document).ready(function(){
	

	$("div#cart_Noitem").hide();

	
	$("span#delete").click(function(){
		$("div#cart_item").empty();
	})
	
	$("button#goPayment").click(function(){
		
		const frm = document.bagFrm;
		frm.method = "post";
		frm.action = "order_payment.tam";
		frm.submit();
		
	});
	
	
	
}); // end of $(document).ready(function()-----------------------------------




// 주문계속하기 클릭 시 결제창으로 이동시키는 메소드
function goPayment() {
	
	
}

// 쇼핑계속하기 클릭 시 메인페이지로 이동시키는 메소드
/*function goMain() {
	
	
	
	
	const frm = ;
	frm.method = "post";
	frm.action = "cart_detail.tam";
	frm.submit();
}*/






