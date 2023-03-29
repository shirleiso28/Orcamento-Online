/*checkout-orcamento.js*/

/*var divAddClass = $('.orcamento .btn-acoes');
var classAdd = 'fixo-acao';
var posicaoComeca = $('.orcamento .nao-montar').offset().top;

var posicaoFixa = $('.orcamento .btn-acoes').offset().top

$(window).scroll(function() {
  	
  	if( $(this).scrollTop() > posicaoComeca ) {
    	if($(this).scrollTop() > (posicaoFixa+95)){
  			divAddClass.removeClass(classAdd);
  		}else{
  			divAddClass.addClass(classAdd);
  		}
  	} else {
    	divAddClass.removeClass(classAdd);
  	}

});*/


$(window).scroll(function() {

    var posicaoComeca = $('.row.tamanho-armacao').offset().top;
    var divAddClass = $('.btn-acoes-topo');
    var classAdd = 'fixo-acao';

    if( $(this).scrollTop() > posicaoComeca ) {
        divAddClass.addClass(classAdd);
    }else{
        divAddClass.removeClass(classAdd);
    }

   

  });

$(document).ready(function(){

  

	$('.orcamento .tamanho-armacao .btn-veja-como button').click(function(){

		if($(this).hasClass('selecionado')){
			$(this).removeClass('selecionado');
		}else{
			$(this).addClass('selecionado');
		}

  		$('.orcamento .veja-encontrar').slideToggle('100');
  		
  	});

});