$(document).ready(function(){
	$("div#hide_product_price").hide();
	$("div#hide_all_price").hide();
	$("div#discription_full").hide();
	
	// 더보기 클릭 시 상세설명을 펼쳐주는 메소드
	$("span#fullview").click(function(){
		goFull();
	});
	
	
	
	$("div#cart").hide();
	// 장바구니에 담기 버튼 클릭 시 발생하는 메소드
	$("button#putCart").click(function(){
		$("div#cart").show();
		$("div#cart_item1").show();
	});


	$("div#container").click(function(e){
		if(!$(e.target).is("button#putCart")) {
			$("div#cart").hide()
		}
	});
	
	///////////////////////////////////////////////////////////////
	
	// 장바구니의 체크박스를 체크한 뒤 삭제 버튼을 누르면 제품의 정보가 숨겨진다.
	$("input:checkbox[name='item']").click((e) => {
		
	   // 삭제 버튼 클릭 시 tbl_cart 의 해당 제품 행 삭제하는 메소드	
		itemDelete();
		
		
	});
	
	
	
	
	// 제품명을 폼태그를 이용하여 쇼핑백 페이지로 넘기기 위해 만든 input 히든타입에 제품명을 담는다.
	const name = $("span#cart_item_name").text();
	$("input:hidden[name='name']").val(name);
	
}); // end of $(document).ready(function()-----------------------------------

// 주문하기 버튼 클릭 시 장바구니에 담긴 내용을 쇼핑백 탭으로 보내주는 메소드
function goOrder() {
	
	
	
	
	const frm = document.cartFrm;
	frm.method = "post";
	frm.action = "cart_detail.tam";
	frm.submit();
}


// 더보기 클릭 시 상세설명을 펼쳐주는 메소드
function goFull() {
	
	$("div#discription_simple").empty();
	$("div#discription_full").show();
	
}


// 장바구니에 담기 버튼 클릭 시 tbl_cart에 회원아이디, 제품번호 insert 해주기
function insertInfoCart(number) {
	
	// alert("number : " + number);
	
	$.ajax({
		url:"cartDisplayJSON.tam",
		type:"get",
		data:{"number":number},	//	8	 8	   8     8     8
		dataType:"json",
		success:function(json){
		console.log(json);
		/*	
			console.log(json);
			console.log(typeof json);
			
			const str_json = JSON.stringify(json);	// json 객체를 string 타입으로 변경시켜주는 것
			console.log(typeof str_json);	// string
			console.log(str_json);
			
			const obj_json = JSON.parse(str_json);// JSON 모양으로 되어진 string을 실제 JSON 객체로 변경시켜주는 것
			console.log(typeof obj_json);	// object
			console.log(obj_json);
		*/
		/*
			json = > [{"pnum":36,"pname":"노트북30","pcompany":"삼성전자","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"59.jpg","pqty":100,"pimage2":"60.jpg","price":1200000,"sname":"HIT","Pcontent":"30번 노트북", "discountPercent": 15}
				  	 ,{"pnum":35,"pname":"노트북29","pcompany":"레노버","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"57.jpg","pqty":100,"pimage2":"58.jpg","price":1200000,"sname":"HIT","Pcontent":"29번 노트북", "discountPercent": 15}
				   	 ,{"pnum":34,"pname":"노트북28","pcompany":"아수스","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"55.jpg","pqty":100,"pimage2":"56.jpg","price":1200000,"sname":"HIT","Pcontent":"28번 노트북", "discountPercent": 15}
					 ,{"pnum":33,"pname":"노트북27","pcompany":"애플","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"53.jpg","pqty":100,"pimage2":"54.jpg","price":1200000,"sname":"HIT","Pcontent":"27번 노트북", "discountPercent": 15}
					 ,{"pnum":32,"pname":"노트북26","pcompany":"MSI","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"51.jpg","pqty":100,"pimage2":"52.jpg","price":1200000,"sname":"HIT","Pcontent":"26번 노트북", "discountPercent": 15}
					 ,{"pnum":31,"pname":"노트북25","pcompany":"삼성전자","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"49.jpg","pqty":100,"pimage2":"50.jpg","price":1200000,"sname":"HIT","Pcontent":"25번 노트북", "discountPercent": 15}
					 ,{"pnum":30,"pname":"노트북24","pcompany":"한성컴퓨터","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"47.jpg","pqty":100,"pimage2":"48.jpg","price":1200000,"sname":"HIT","Pcontent":"24번 노트북", "discountPercent": 15}
					 ,{"pnum":29,"pname":"노트북23","pcompany":"DELL","cname":"전자제품","saleprice":1000000,"point":60,"pinputdate":"2023-10-19","pimage1":"45.jpg","pqty":100,"pimage2":"46.jpg","price":1200000,"sname":"HIT","Pcontent":"23번 노트북", "discountPercent": 15}]
		
		
			또는
			
			json = > []    null 이 아니라 배열의 길이가 0임.
		*/
			
		},
		error: function(request, status, error){
          alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
        }
	});		
	
	
	
}



// 장바구니의 select 의 옵션을 변경 할 때마다 tbl_cart의 제품 수량 update 해주기
function changeQty() {
	
	
	
	}		

// 삭제 버튼 클릭 시 tbl_cart 의 해당 제품 행 삭제하는 메소드	
	function itemDelete() {
		
		
	}




	


