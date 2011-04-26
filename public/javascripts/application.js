$(document).ready(function() {
	// Only call the function when it is defined on the page
	if(typeof create_map == 'function') { 
		create_map(); 
	}
	
	$( "#accordion" ).accordion();
	
	// Load dialog on click
	/*$('#address_link').click(function (e) {
		e.preventDefault();
		$('a#map_canvas').css('display', 'inline-block');
		$('a#address_link').fancybox();
		//$('#map_canvas').modal();
		google.maps.event.trigger(map, "resize");
		map.setCenter(map.getCenter());
		return false;
	});
*/	
	/*
	$("a#address_link").fancybox({
		onComplete: function(){
			//$('a#map_canvas').css('display', 'inline-block');
			google.maps.event.trigger(map, "resize");
			map.setCenter(map.getCenter());
		}
    });
	
	$("b#address_link").fancybox({
		//onComplete: function(){
		//	//$('a#map_canvas').css('display', 'inline-block');
		//	google.maps.event.trigger(map, "resize");
		//	map.setCenter(map.getCenter());
		//},
		"onComplete" : function(){
			$("#map_canvas").removeClass("party_show");
			$("#map_canvas").addClass("visible");
			create_map();
		},
		"onClosed" : function(){
			$("#map_canvas").addClass("party_show");
			$("#map_canvas").removeClass("visible");
			$("#fancy_content").empty();
			$("#map_canvas").html("");
			map = null;
		},
		"width" : 450,
		"height" : 370,
		"autoDimensions" : false,
		//"autoScale" : true,
		'overlayOpacity'	: 0.8
	});
	*/
	$('.fancybox').fancybox();
	
});