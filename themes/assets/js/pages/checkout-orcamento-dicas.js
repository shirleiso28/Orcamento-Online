/*consultor_dicas.js*/

$(document).ready(function($) {

	/*Inicio muda aba*/
	$('.abas-dicas .nav-dica-1').click(function(){
		//Mudar div
		$('.dicas_geral .dica_1').css('display', 'block');
		$('.dicas_geral .dica_2').css('display', 'none');
		$('.dicas_geral .dica_3').css('display', 'none');
		$('.dicas_geral .dica_4').css('display', 'none');

		$(this).addClass('ativo');
		$('.abas-dicas .nav-dica-2').removeClass('ativo');
		$('.abas-dicas .nav-dica-3').removeClass('ativo');
		$('.abas-dicas .nav-dica-4').removeClass('ativo');

		$('.dicas_geral .botoes .dica__anterior').css('display', 'none');
		$('.dicas_geral .botoes .dica__posterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').addClass('only');
	});

	$('.abas-dicas .nav-dica-2').click(function(){
		//Mudar div
		$('.dicas_geral .dica_1').css('display', 'none');
		$('.dicas_geral .dica_2').css('display', 'block');
		$('.dicas_geral .dica_3').css('display', 'none');
		$('.dicas_geral .dica_4').css('display', 'none');

		$(this).addClass('ativo');
		$('.abas-dicas .nav-dica-1').removeClass('ativo');
		$('.abas-dicas .nav-dica-3').removeClass('ativo');
		$('.abas-dicas .nav-dica-4').removeClass('ativo');

		$('.dicas_geral .botoes .dica__anterior').css('display', 'block');
		$('.dicas_geral .botoes .dica__posterior').css('display', 'block');
		$('.dicas_geral .botoes .dica__posterior').removeClass('only');
	});

	$('.abas-dicas .nav-dica-3').click(function(){
		//Mudar div
		$('.dicas_geral .dica_1').css('display', 'none');
		$('.dicas_geral .dica_2').css('display', 'none');
		$('.dicas_geral .dica_3').css('display', 'block');
		$('.dicas_geral .dica_4').css('display', 'none');

		$(this).addClass('ativo');
		$('.abas-dicas .nav-dica-1').removeClass('ativo');
		$('.abas-dicas .nav-dica-2').removeClass('ativo');
		$('.abas-dicas .nav-dica-4').removeClass('ativo');

		if(!$('.abas-dicas .nav-dica-4').length){
			$('.dicas_geral .botoes .dica__anterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').css('display', 'none');
		}else{
			$('.dicas_geral .botoes .dica__anterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').removeClass('only');
		}
	});

	$('.abas-dicas .nav-dica-4').click(function(){
		//Mudar div
		$('.dicas_geral .dica_1').css('display', 'none');
		$('.dicas_geral .dica_2').css('display', 'none');
		$('.dicas_geral .dica_3').css('display', 'none');
		$('.dicas_geral .dica_4').css('display', 'block');

		$(this).addClass('ativo');
		$('.abas-dicas .nav-dica-1').removeClass('ativo');
		$('.abas-dicas .nav-dica-2').removeClass('ativo');
		$('.abas-dicas .nav-dica-3').removeClass('ativo');

		$('.dicas_geral .botoes .dica__anterior').css('display', 'block');
		$('.dicas_geral .botoes .dica__posterior').css('display', 'none');
	});
	/*Fim muda aba*/

	/*Inicio botão dicas*/
	$('.dicas_geral .botoes .botoes__dica .btn').click(function(){
		console.log($(this));
		dica_botoes($(this));
		// dica_botoes('.dicas_geral .botoes .botoes__dica');
	});

	function dica_botoes($element){
		$class = $('.abas-dicas .ativo')[0]['className'];
		$pos = $class.indexOf('nav-dica-');
		$number = parseInt($class.substring($pos+9, $pos+10));

		if($element.hasClass('anterior') && $number > 1){
			$number--;
		}else if($element.hasClass('posterior') && $number < 4){
			$number++;
		}

		//Mudar div
		$('.dicas_geral .dica_1').css('display', 'none');
		$('.dicas_geral .dica_2').css('display', 'none');
		$('.dicas_geral .dica_3').css('display', 'none');
		$('.dicas_geral .dica_4').css('display', 'none');
		$('.dicas_geral .dica_'+$number).css('display', 'block');

		$('.abas-dicas .nav-dica-1').removeClass('ativo');
		$('.abas-dicas .nav-dica-2').removeClass('ativo');
		$('.abas-dicas .nav-dica-3').removeClass('ativo');
		$('.abas-dicas .nav-dica-4').removeClass('ativo');
		$('.abas-dicas .nav-dica-'+$number).addClass('ativo');

		if($number == 1){
			$('.dicas_geral .botoes .dica__anterior').css('display', 'none');
			$('.dicas_geral .botoes .dica__posterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').addClass('only');
		}else if(($number == 3 && !$('.abas-dicas .nav-dica-4').length) 
			|| ($number == 4)){			$('.dicas_geral .botoes .dica__anterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').css('display', 'none');
		}else{
			$('.dicas_geral .botoes .dica__anterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').css('display', 'block');
			$('.dicas_geral .botoes .dica__posterior').removeClass('only');
		}
	}

	$('.dicas_geral .botoes .dica__anterior, .dicas_geral .botoes .dica__posterior').click(function(){
		event.preventDefault();
    	var sectionTop = $('.abas-dicas').offset().top-100;
    	$('html,body').animate({scrollTop: sectionTop },'slow');
	});
		
	/*Fim botão dicas*/
});