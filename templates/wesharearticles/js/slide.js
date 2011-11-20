var d = jQuery.noConflict();
d(document).ready(function() {
	// Expand Panel
	d("#open").click(function(){
		d("div#panel").slideDown("slow");
	
	});	
	
	// Collapse Panel
	d("#close").click(function(){
		d("div#panel").slideUp("slow");	
	});		
	
	// Switch buttons from "Log In | Register" to "Close Panel" on click
	d("#toggle a").click(function () {
		d("#toggle a").toggle();
	});		
		
});