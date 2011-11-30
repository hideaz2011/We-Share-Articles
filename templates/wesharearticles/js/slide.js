var d = jQuery.noConflict();
d(document).ready(function() {
	d("#myApiLoginWrapper").css("display","none");
	// Expand Panel
	d("#open").click(function(){
		d("div#panel").slideDown("slow",function(){
			d("#myApiLoginWrapper").css("display","block").css("z-index","2147483647");
			d("#submitarticle").css("z-index","0");
		});
		
	});	
	
	// Collapse Panel
	d("#close").click(function(){
		d("#myApiLoginWrapper").css("display","none").css("z-index","0");		
		d("div#panel").slideUp("slow");	
		d("#toppanel").css("z-index","0");
		d("#submitarticle").css("z-index","0");
	});		
	
	// Switch buttons from "Log In | Register" to "Close Panel" on click
	d("#toggle a").click(function () {
		d("#toggle a").toggle();
	});		
		
});