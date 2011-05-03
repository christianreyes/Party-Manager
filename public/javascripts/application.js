$(document).ready(function() {
	// Only call the function when it is defined on the page
	if(typeof create_map == 'function') { 
		create_map(); 
	}
	
	$( "#accordion" ).accordion();
	
	$("a#address_link").click(function () {
	  //google.maps.event.trigger(map, "resize");
	  //map.setCenter(map.getCenter());
      $("#map_canvas").slideToggle();
    });
	
	$(".slide").click(function() {
	  $(this).siblings("table").slideToggle('slow');
	});

});