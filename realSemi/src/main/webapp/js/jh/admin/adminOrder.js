$(document).ready(function(){
	
	$("button.o_status_change_btn").click(e=>{
		
		confirm("배송중으로 변경하시겠습니까?")
	});
	
	$("tr.column_text td").click(e=>{
		const target = $(e.target);
		if(target.find(".o_status_change")){
			return;
		}
		pop_up_order_info(ctxPath);
	})
	
	
});


// Funtion Declaration
function pop_up_order_info(ctxPath){
	
	const url = `${ctxPath}/admin/orderInfo.tam`;
	
	// 너비 800, 높이 680인 팝업창을 화면 가운데에 위치시키기
	const width = 800;
	const height = 680;
	
	const left = Math.ceil((window.screen.width - width) / 2); // 정수로 만듦
	const top = Math.ceil((window.screen.height - height) / 2); // 정수로 만듦
	
	window.open(url, "orderInfo", 
	            `left=${left}, top=${top}, width=${width}, height=${height}` );
};