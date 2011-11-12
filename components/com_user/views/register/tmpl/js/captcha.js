$("#refreshimg").live('click',function(){

		$.post('php/newsession.php');
		$("#captchaimage").load('php/image_req.php');
		return false;
                
	});