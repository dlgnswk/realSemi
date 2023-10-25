$(document).ready(function(){
	
	$(".after_like").hide();
	// 로그인 하지 않고 좋아요를 누른경우 어떻게 할지?
	
	$("button.dislike").click(function(e){
		$(e.target).parent().parent().find(".after_like").show();
		$(e.target).find(".before_like").hide();
	});
	
	$("button.like").click(function(e){
		$(e.target).hide();
		$(e.target).parent().parent().find(".before_like").show();
	});
		
	
});
