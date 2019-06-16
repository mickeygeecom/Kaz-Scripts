
$(document).ready(function(){

 window.addEventListener( 'message', function( event ) {
        var item = event.data;

        if ( item.showPlayerMenu == 1 ) {
	$('body').css('background-color','transparent');
	$('.Type').html(event.data.atype);
$('.Model').html(event.data.amodel);
$('.Beskrivelse').html(event.data.abeskrivelse);
$('.Pris').html(event.data.apris);
$('.Seller').html(event.data.aseller);
	$('.container-fluid').css('display','block');


} else if ( item.showPlayerMenu == false ) { // Hide the menu

$('.container-fluid').css('display','none');
$('body').css('background-color','transparent important!');
	$("body").css("background-image","none");

        }
    } );

    $("#desempregado").click(function(){
        $.post('http://vrp_legal/desempregado', JSON.stringify({}));2

    });
	
	$("#pescador").click(function(){
        $.post('http://kaz_usedvehicles/buyButton', JSON.stringify({}));2
		$.post('http://kaz_usedvehicles/closeButton', JSON.stringify({}));2
		

    });
	
	$("#taxi").click(function(){
        $.post('http://kaz_usedvehicles/taxi', JSON.stringify({}));2

    });
	
	$("#mecanico").click(function(){
        $.post('http://vrp_legal/mecanico', JSON.stringify({}));2

    });
	
	$("#transportador").click(function(){
        $.post('http://vrp_legal/transportador', JSON.stringify({}));2

    });
	
	$("#onibus").click(function(){
        $.post('http://vrp_legal/onibus', JSON.stringify({}));2

    });

	
	$("#cc").submit(function(e) {
    e.preventDefault(); // Prevent form from submitting
	$.post('http://kaz_usedvehicles/closeButton', JSON.stringify({}));2
    $.post('http://kaz_usedvehicles/cc', JSON.stringify({
        salgspris: $("#salgspris").val(),
        salgstale: $("#salgstale").val(),
		seller: $("#seller").val()
    }));
	});

    $("#mineradima").click(function(){
        $.post('http://kaz_usedvehicles/mineradima', JSON.stringify({}));2
		$.post('http://kaz_usedvehicles/closeButton', JSON.stringify({}));2

    });
	
	$("#mineraouro").click(function(){
        $.post('http://vrp_legal/mineraouro', JSON.stringify({}));2

    });
	
	$("#mineracobre").click(function(){
        $.post('http://vrp_legal/mineracobre', JSON.stringify({}));2

    });
	
	$("#motoboy").click(function(){
        $.post('http://vrp_legal/motoboy', JSON.stringify({}));2

    });

    $("#eletricista").click(function(){
        $.post('http://vrp_legal/eletricista', JSON.stringify({}));2

    });
    

    // $("#cacador").click(function(){
    //    $.post('http://vrp_legal/cacador', JSON.stringify({}));2
    // });

    //$("#caminhoneiro").click(function(){
    //    $.post('http://vrp_legal/caminhoneiro', JSON.stringify({}));2

    //});
    
    $("#closebtn").click(function(){
        $.post('http://kaz_usedvehicles/closeButton', JSON.stringify({}));2

    });

})
