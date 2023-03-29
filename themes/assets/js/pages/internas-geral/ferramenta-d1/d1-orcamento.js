$(document).ready(function(){
	var $carousel = $('.carousel-d1');
	var esfericoOE;
	var esfericoOD;
	var cilindricoOE;
	var cilindricoOD;
    var eixoOD;
    var eixoOE;
    var add;
    var esfericoPOD;
    var esfericoPOE;

    

	/*Tela 1 - tem esférico?*/
		
	    //Quando clicar em "Não", rolar para tela 3  (index 2)
	    $('.receita-t1 .navegacao').on( 'click', '.btn-nao', function(){
			$carousel.flickity( 'select', 2 );
		  	jQuery('html, body').animate({scrollTop:112},'slow');
            esfericoOE = '-';
            esfericoOD = '-';
            $(".receita-t3 .origem").val('0');

		});

		// Quando clicar em "Sim", rolar para tela 2 (index 1)
	    $('.receita-t1 .navegacao').on('click', '.btn-sim', function(){
		  	$carousel.flickity( 'select', 1 );
		  	jQuery('html, body').animate({scrollTop:112},'slow');
		});

    /*Fim tela 1*/

    /*Tela 2 - preenche esférico*/
    	//Após selecionar sinal OD, carregar campo grau OD com o sinal escolhido
    	$("select[name='sinal-od']").on("change", function(){
    		preencheGrau($("select[name='sinal-od']").val(),$("select[name='grau-od']"));
    	});
    	//Ao selecionar grau, preencher célula Esf-Od,com o grau selecionado
    	$("select[name='grau-od']").on("change", function(){
    		var grau = '<p>'+$("select[name='grau-od']").val()+'</p>';
    		$('.receita-t2 .tabela-receita .olho-direito .esferico').html(grau);
    		
    		//Mudar cores da tabela: tirar o azul claro de Od e Esf-Od
    		$('.receita-t2 .tabela-receita .olho-direito .titulo-olho, .receita-t2 .tabela-receita .olho-direito .esferico').removeClass('cor-selecao');
    		
    		//Mudar cores da tabela: inserir o azul claro em Oe e Esf-Oe
    		$('.receita-t2 .tabela-receita .olho-esquerdo .titulo-olho, .receita-t2 .tabela-receita .olho-esquerdo .esferico').addClass('cor-selecao');
    		
    		//Habilitar selects(sinal e grau) do olho esquerdo
    		$('.receita-t2 .selecao-olho-esq select').css({"pointer-events":"auto","opacity":"1"});
    		esfericoOD = $("select[name='grau-od']").val();
    	});
    	

    	//Após selecionar sinal OE, carregar campo grau OE com o sinal escolhido
    	$("select[name='sinal-oe']").on("change", function(){
    		preencheGrau($("select[name='sinal-oe']").val(),$("select[name='grau-oe']"));
    	});

    	//Ao selecionar grau, preencher célula Esf-Oe,com o grau selecionado
    	$("select[name='grau-oe']").on("change", function(){
    		var grau = '<p>'+$("select[name='grau-oe']").val()+'</p>';
    		$('.receita-t2 .tabela-receita .olho-esquerdo .esferico').html(grau);
    		
    		//Habilitar botão prosseguir
    		$('.receita-t2 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
    		esfericoOE = $("select[name='grau-oe']").val();
    	});

    	
    	//Se clicar em voltar, rolar para tela 1 (index 0)
    	$('.receita-t2 .navegacao').on( 'click', '.btn-prev', function() {
			$carousel.flickity( 'select', 0);
		  	jQuery('html, body').animate({scrollTop:112},'slow');

			//Voltar as configurações iniciais campos de seleção od
			$("select[name='sinal-od']").html('<option value="" disabled selected>Sinal</option><br/><option>Negativo (-)</option><br/><option>Positivo (+)</option>');
			$("select[name='grau-od']").html('<option value="" disabled selected>Grau</option>');
    		
    		//Voltar as configurações iniciais campos de seleção oe
    		$("select[name='sinal-oe']").html('<option value="" disabled selected>Sinal</option><br/><option>Negativo (-)</option><br/><option>Positivo (+)</option>');
			$("select[name='grau-oe']").html('<option value="" disabled selected>Grau</option>');

			//Desabilitar selects(sinal e grau) do olho esquerdo
    		$('.receita-t2 .selecao-olho-esq select').css({"pointer-events":"none","opacity":"0.5"});

    		//Voltar as configurações de cor de seleção da tabela
    		$('.receita-t2 .tabela-receita .olho-direito .titulo-olho,.receita-t2 .tabela-receita .olho-direito .esferico').addClass('cor-selecao');
    		$('.receita-t2 .tabela-receita .olho-esquerdo .titulo-olho, .receita-t2 .tabela-receita .olho-esquerdo .esferico').removeClass('cor-selecao');
    
			$('.receita-t2 .tabela-receita .olho-direito .esferico,.receita-t2 .tabela-receita .olho-esquerdo .esferico').html("");
    		//Desabilitar botão prosseguir
    		$('.receita-t2 .navegacao .btn-next').css({"pointer-events":"none","opacity":"0.5"});
		});
		//Ao clicar em prosseguir, rolar para tela 3 (index 2)
    	$('.receita-t2 .navegacao').on('click', '.btn-next', function() {
    		if ((esfericoOD <= 0 && esfericoOE <= 0)||(esfericoOD >= 0 && esfericoOE >= 0)){
			  	$carousel.flickity( 'select', 2 );
			  	jQuery('html, body').animate({scrollTop:112},'slow');
                $(".receita-t3 .origem").val('1');
			}else{
				alert('ATENÇÃO! Miopia e Hipermetropia no mesmo óculos! Tem certeza que os sinais na sua receita são diferentes?');
			}
		});

    /*Fim tela 2*/

    /*Tela 3 - tem cilindrico?*/
    	
    	// Se clicar em "Não", rolar para tela 6 (index 5)
    	$('.receita-t3 .navegacao').on( 'click', '.btn-nao', function() {
            $(".receita-t6 .origem").val('2');
			$carousel.flickity( 'select', 5 );
		  	jQuery('html, body').animate({scrollTop:112},'slow');
            cilindricoOD='-';
            cilindricoOE='-';
            eixoOD='-';
            eixoOE='-';

		});
    	// Se clicar em "Sim", rolar para tela 4 (index 3)
    	$('.receita-t3 .navegacao').on('click', '.btn-sim', function() {
		  	$carousel.flickity( 'select', 3 );
		  	jQuery('html, body').animate({scrollTop:112},'slow');
            $('.receita-t4 .tabela-receita .olho-direito .esferico').html('<p>'+esfericoOD+'</p>');
            $('.receita-t4 .tabela-receita .olho-esquerdo .esferico').html('<p>'+esfericoOE+'</p>');
		});

        //Se clicar em voltar, rolar para tela 1 (index 0) ou tela (index 1) de acordo com a origem
        $('.receita-t3 .navegacao').on( 'click', '.btn-prev', function() {
            $carousel.flickity( 'select',  $(".receita-t3 input[name='origem']").val());
            jQuery('html, body').animate({scrollTop:112},'slow');
        });
    /*Fim tela 3*/

    /*Tela 4 - preenche cilindrico*/
    	//Ao selecionar grau od, preencher celula Cil-Od com o grau selecionado
		$("select[name='grauC-od']").on("change", function(){
    		var grau = '<p>'+$("select[name='grauC-od']").val()+'</p>';
    		$('.receita-t4 .tabela-receita .olho-direito .cilindrico').html(grau);
    		
    		//Mudar cores da tabela: tirar o azul claro de Od e Cil-Od
    		$('.receita-t4 .tabela-receita .olho-direito .titulo-olho, .receita-t4 .tabela-receita .olho-direito .cilindrico').removeClass('cor-selecao');
    		
    		//Mudar cores da tabela: inserir o azul claro em Oe e Cil-Oe
    		$('.receita-t4 .tabela-receita .olho-esquerdo .titulo-olho, .receita-t4 .tabela-receita .olho-esquerdo .cilindrico').addClass('cor-selecao');
    		
    		//Habilitar select(grau) do olho esquerdo
    		$('.receita-t4 .selecao-olho-esq select').css({"pointer-events":"auto","opacity":"1"});
    		cilindricoOD = $("select[name='grauC-od']").val();
    	});

    	//Ao selecionar grau oe, preencher célula Cil-Oe,com o grau selecionado
        $("select[name='grauC-oe']").on("change", function(){
            var grau = '<p>'+$("select[name='grauC-oe']").val()+'</p>';
            $('.receita-t4 .tabela-receita .olho-esquerdo .cilindrico').html(grau);
            
            //Habilitar botão prosseguir
            $('.receita-t4 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
            cilindricoOE = $("select[name='grauC-oe']").val();
        });

    	

    	//Se clicar em voltar, rolar para tela 3 (index 2)
    	$('.receita-t4 .navegacao').on( 'click', '.btn-prev', function() {
			$carousel.flickity( 'select', 2);
		  	jQuery('html, body').animate({scrollTop:112},'slow');

            //Voltar as configurações iniciais campos de seleção od e oe
            $("select[name='grauC-od'] option").removeAttr('selected').filter('[value=grau]').attr('selected', true);
            $("select[name='grauC-oe'] option").removeAttr('selected').filter('[value=grau]').attr('selected', true);
            //Desabilitar select(grau) do olho esquerdo
            $('.receita-t4 .selecao-olho-esq select').css({"pointer-events":"none","opacity":"0.5"});

            //Voltar as configurações de cor de seleção da tabela
            $('.receita-t4 .tabela-receita .olho-direito .titulo-olho, .receita-t4 .tabela-receita .olho-direito .cilindrico').addClass('cor-selecao');
            $('.receita-t4 .tabela-receita .olho-esquerdo .titulo-olho, .receita-t4 .tabela-receita .olho-esquerdo .cilindrico').removeClass('cor-selecao');
            
            $('.receita-t4 .tabela-receita .olho-direito .cilindrico,.receita-t4 .tabela-receita .olho-esquerdo .cilindrico').html("");
            
            //Desabilitar botão prosseguir
            $('.receita-t4 .navegacao .btn-next').css({"pointer-events":"none","opacity":"0.5"});
        });
		//Ao clicar em prosseguir, rolar para tela 5 (index 4)
    	$('.receita-t4 .navegacao').on('click', '.btn-next', function() {
            if (cilindricoOD == 0.00 && cilindricoOE == 0 && esfericoOD == "-" && esfericoOE == "-"){
                alert('ATENÇÃO! Sua receita realmente não tem grau esférico nem grau cilindrico?');    
            }else{
                $carousel.flickity( 'select', 4 );
                jQuery('html, body').animate({scrollTop:112},'slow');

                /*Preencher os dados da tabela*/
                $('.receita-t5 .tabela-receita .olho-direito .esferico').html('<p>'+esfericoOD+'</p>');
                $('.receita-t5 .tabela-receita .olho-esquerdo .esferico').html('<p>'+esfericoOE+'</p>');
                $('.receita-t5 .tabela-receita .olho-direito .cilindrico').html('<p>'+cilindricoOD+'</p>');
                $('.receita-t5 .tabela-receita .olho-esquerdo .cilindrico').html('<p>'+cilindricoOE+'</p>');
                if (cilindricoOD == 0.00) {
                    $('.receita-t5 .tabela-receita .olho-direito .eixo').html("-");
                    $("input[type='text'][name='eixo-dir']").val("-");
                    $('.receita-t5 .tabela-receita .olho-direito .eixo').removeClass('cor-selecao');
                    eixoOD='-';
                }
                if (cilindricoOE == 0.00) {
                    $('.receita-t5 .tabela-receita .olho-esquerdo .eixo').html("-");
                    $("input[type='text'][name='eixo-esq']").val("-");
                    $('.receita-t5 .tabela-receita .olho-esquerdo .eixo').removeClass('cor-selecao');
                     eixoOE='-';
                }
            }
		});
    /*Fim tela 4*/

    /*Tela 5 - preenche eixo*/
    	//Ao digitar eixo od, preencher célula Eix-od
        $("input[type='text'][name='eixo-dir']").on("change", function(){
            $("input[type='text'][name='eixo-dir']").val($("input[type='text'][name='eixo-dir']").val()+"°");
            var grau = '<p>'+$("input[type='text'][name='eixo-dir']").val()+'</p>';
            $('.receita-t5 .tabela-receita .olho-direito .eixo').html(grau);
            //Remover cor da célula Od e Eix-od
            $('.receita-t5 .tabela-receita .olho-direito .eixo').removeClass('cor-selecao');
            eixoOD = $("input[type='text'][name='eixo-dir']").val();
            if (eixoOD != null && eixoOE != null) {
                 $('.receita-t5 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
            }
        });
    	//Ao digitar eixo Oe, preencher célula Eix-Oe e habilitar botão prosseguir
        $("input[type='text'][name='eixo-esq']").on("change", function(){
            $("input[type='text'][name='eixo-esq']").val($("input[type='text'][name='eixo-esq']").val()+"°");
            var grau = '<p>'+$("input[type='text'][name='eixo-esq']").val()+'</p>';
            $('.receita-t5 .tabela-receita .olho-esquerdo .eixo').html(grau);
            //Remover cor da célula Od e Eix-od
            $('.receita-t5 .tabela-receita .olho-esquerdo .eixo').removeClass('cor-selecao');
            eixoOE = $("input[type='text'][name='eixo-esq']").val();
            if (eixoOD != null && eixoOE != null) {
                 $('.receita-t5 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
            }
        });

    	
    	//Se clicar em voltar, rolar para tela 4  (index 3)
    	$('.receita-t5 .navegacao').on( 'click', '.btn-prev', function() {
			$carousel.flickity( 'select', 3 );
			jQuery('html, body').animate({scrollTop:112},'slow');

            /*voltando as formatações*/
            $('.receita-t5 .tabela-receita .olho-direito .eixo').addClass('cor-selecao');
            $('.receita-t5 .tabela-receita .olho-esquerdo .eixo').addClass('cor-selecao');
            $('.receita-t5 .tabela-receita .olho-direito .eixo').html("");
            $('.receita-t5 .tabela-receita .olho-esquerdo .eixo').html("");
            $("input[type='text'][name='eixo-esq']").val("");
            $("input[type='text'][name='eixo-dir']").val("");
		});
    	//Ao clicar em prosseguir, rolar para tela 6  (index 5)
    	$('.receita-t5 .navegacao').on('click', '.btn-next', function() {
            $(".receita-t6 .origem").val('4');
		  	$carousel.flickity( 'select', 5 );
		  	jQuery('html, body').animate({scrollTop:112},'slow');
		});
    /*Fim tela 5*/

    /*Tela 6 - tem add?*/
    	
    	//Se clicar em não, Calcular resultado
    	$('.receita-t6 .navegacao').on( 'click', '.btn-nao', function() {
			//fazer uma verificaçao antes de chamar o evento submit
			//Se nem grau cilindrico, nem esférico foram preenchidos é preciso dar mensagem de erro e voltar para index 0
			if (cilindricoOD == '-' && cilindricoOE == '-' && esfericoOD == "-" && esfericoOE == "-"){
                alert('ATENÇÃO! Sua receita não possui nenhum grau!');    
            }else{
                $(".receita-t10 .origem").val('5');
    			$carousel.flickity( 'select', 9);
    			jQuery('html, body').animate({scrollTop:112},'slow');
            }
		});

		//Se clicar em sim, rolar para tela 7 (index 6)
	    $('.receita-t6 .navegacao').on('click', '.btn-sim', function() {
		  	$carousel.flickity( 'select', 6 );
		  	jQuery('html, body').animate({scrollTop:112},'slow');
		});

         //Se clicar em voltar, rolar para tela 1 (index 0) ou tela (index 1) de acordo com a origem
        $('.receita-t6 .navegacao').on( 'click', '.btn-prev', function() {
            $carousel.flickity( 'select', $(".receita-t6 .origem").val());
            jQuery('html, body').animate({scrollTop:112},'slow');
        });
    /*Fim tela 6*/

    /*Tela 7 - Adição ou Perto?*/
    	//Se clicar em voltar, rolar para tela 6 (index 5)
    	$('.receita-t7 .navegacao').on( 'click', '.btn-prev', function() {
			$carousel.flickity( 'select', 5 );
		});

    	//Ao selecionar uma radio, habilitar btn prosseguir
    	$("input[type='radio'][name='add']").on("change", function(){
    		$('.receita-t7 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
    	});
    	
    	$('.receita-t7 .navegacao').on( 'click', '.btn-next', function() {
			//Se selecionado Add e clicar em prosseguir - rolar para tela 8 (index 7)
			if ($('#add').prop("checked")){
				$carousel.flickity( 'select', 7 );
				jQuery('html, body').animate({scrollTop:112},'slow');
                /*Preencher graus da tabela*/
                $('.receita-t8 .tabela-receita .olho-direito .esferico').html('<p>'+esfericoOD+'</p>');
                $('.receita-t8 .tabela-receita .olho-esquerdo .esferico').html('<p>'+esfericoOE+'</p>');
                $('.receita-t8 .tabela-receita .olho-direito .cilindrico').html('<p>'+cilindricoOD+'</p>');
                $('.receita-t8 .tabela-receita .olho-esquerdo .cilindrico').html('<p>'+cilindricoOE+'</p>');
                $('.receita-t8 .tabela-receita .olho-direito .eixo').html('<p>'+eixoOD+'</p>');
                $('.receita-t8 .tabela-receita .olho-esquerdo .eixo').html('<p>'+eixoOE+'</p>');
			}
    		//Se selecionado Perto e clicar em prosseguir - rolar para tela 9 (index 8)
			if ($('#pertoLonge').prop("checked")){
				$carousel.flickity( 'select', 8 );
				jQuery('html, body').animate({scrollTop:112},'slow');
                /*Preencher graus da tabela*/
                $('.receita-t9 .tabela-receita .olho-direito .esferico').html('<p>'+esfericoOD+'</p>');
                $('.receita-t9 .tabela-receita .olho-esquerdo .esferico').html('<p>'+esfericoOE+'</p>');
                $('.receita-t9 .tabela-receita .olho-direito .cilindrico').html('<p>'+cilindricoOD+'</p>');
                $('.receita-t9 .tabela-receita .olho-esquerdo .cilindrico').html('<p>'+cilindricoOE+'</p>');
                $('.receita-t9 .tabela-receita .olho-direito .eixo').html('<p>'+eixoOD+'</p>');
                $('.receita-t9 .tabela-receita .olho-esquerdo .eixo').html('<p>'+eixoOE+'</p>');
                //Grau cilindrico e eixo já irem preenchidos
                $('.receita-t9 .tabela-receita .od-perto .cilindrico').html('<p>'+cilindricoOD+'</p>');
                $('.receita-t9 .tabela-receita .oe-perto .cilindrico').html('<p>'+cilindricoOE+'</p>');
                $('.receita-t9 .tabela-receita .od-perto .eixo').html('<p>'+eixoOD+'</p>');
                $('.receita-t9 .tabela-receita .oe-perto .eixo').html('<p>'+eixoOE+'</p>');
			}    
		});
    	
    	
    /*Fim tela 7*/

    /*Tela 8 - preenche adição*/
    	//Ao digitar add, preencher célula add e habilitar botão prosseguir
        $("select[name='adicao']").on("change", function(){
            var grau = '<p>'+$("select[name='adicao']").val()+'</p>';
            $('.receita-t8 .tabela-receita .add-value').html(grau);
            $('.receita-t8 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
            add = $("select[name='adicao']").val();
        });

    	//Se clicar em voltar, rolar para tela 7 (index 6)
    	$('.receita-t8 .navegacao').on( 'click', '.btn-prev', function() {
			$carousel.flickity( 'select', 6 );
			jQuery('html, body').animate({scrollTop:112},'slow');

            /*Voltando as configurações*/
            $("select[name='adicao'] option").removeAttr('selected').filter('[value=grau]').attr('selected', true);
            $('.receita-t8 .tabela-receita .add-value').html("");
            $('.receita-t8 .navegacao .btn-next').css({"pointer-events":"none","opacity":"0.5"});
  
		});
    	//Se clicar em prosseguir, rolar para tela 10 (index 9)
    	$('.receita-t8 .navegacao').on('click', '.btn-next', function() {
            $(".receita-t10 .origem").val('7');
            $(".receita-t10 .esfericoOD").val(esfericoOD);
            $(".receita-t10 .esfericoOE").val(esfericoOE);
            $(".receita-t10 .cilindricoOD").val(cilindricoOD);
            $(".receita-t10 .cilindricoOE").val(cilindricoOE);
            $(".receita-t10 .eixoOD").val(eixoOD);
            $(".receita-t10 .eixoOE").val(eixoOE);
            $(".receita-t10 .adicao").val(add);
            $(".receita-t10 .pertoEOD").val(esfericoPOD);
            $(".receita-t10 .pertoEOE").val(esfericoPOE);
            
		  	$carousel.flickity( 'select', 9 );
		  	jQuery('html, body').animate({scrollTop:112},'slow');
		});
    /*Fim tela 8*/

    /*Tela 9 - preenche perto*/
    	//Após selecionar sinal OD perto, carregar campo grau OD perto com o sinal escolhido
        $("select[name='sinalP-od']").on("change", function(){
            preencheGrau($("select[name='sinalP-od']").val(),$("select[name='grauP-od']"));
        });
        //Ao selecionar grau, preencher célula Esf-Od perto,com o grau selecionado
        $("select[name='grauP-od']").on("change", function(){
            var grau = '<p>'+$("select[name='grauP-od']").val()+'</p>';
            $('.receita-t9 .tabela-receita .od-perto .esferico').html(grau);
            
            //Mudar cores da tabela: tirar o azul claro de Esf-Od perto
            $('.receita-t9 .tabela-receita .od-perto .esferico').removeClass('cor-selecao');
            
            //Habilitar selects(sinal e grau) do olho esquerdo
            $('.receita-t9 .selecao-olho-esq select').css({"pointer-events":"auto","opacity":"1"});
            esfericoPOD = $("select[name='grauP-od']").val();
        });

    	
    	//Após selecionar sinal OE-perto, carregar campo grau OE-perto com o sinal escolhido
    	$("select[name='sinalP-oe']").on("change", function(){
            preencheGrau($("select[name='sinalP-oe']").val(),$("select[name='grauP-oe']"));
        });
        //Ao selecionar grau, preencher célula Esf-Oe-perto,com o grau selecionado
        $("select[name='grauP-oe']").on("change", function(){
            var grau = '<p>'+$("select[name='grauP-oe']").val()+'</p>';
            $('.receita-t9 .tabela-receita .oe-perto .esferico').html(grau);
            
            //Habilitar botão prosseguir
            $('.receita-t9 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
            esfericoPOE = $("select[name='grauP-oe']").val();
        });
    	


    	//Se clicar em voltar, rolar para tela 7 (index 6)
    	$('.receita-t9 .navegacao').on( 'click', '.btn-prev', function() {
			$carousel.flickity( 'select', 6 );
			jQuery('html, body').animate({scrollTop:112},'slow');

            //voltar as configurações
            $('.receita-t9 .tabela-receita .od-perto .esferico').html("");
            $('.receita-t9 .tabela-receita .oe-perto .esferico').html("");
            
            //Voltar as configurações iniciais campos de seleção od
            $("select[name='sinalP-od']").html('<option value="sinal" disabled selected>Sinal</option><br/><option>Negativo (-)</option><br/><option>Positivo (+)</option>');
            $("select[name='grauP-od']").html('<option value="grau" disabled selected>Grau</option>');
            
            //Voltar as configurações iniciais campos de seleção oe
            $("select[name='sinalP-oe']").html('<option value="sinal" disabled selected>Sinal</option><br/><option>Negativo (-)</option><br/><option>Positivo (+)</option>');
            $("select[name='grauP-oe']").html('<option value="grau" disabled selected>Grau</option>');

            //Desabilitar selects(sinal e grau) do olho esquerdo
            $('.receita-t9 .selecao-olho-esq select').css({"pointer-events":"none","opacity":"0.5"});

            //Voltar as configurações de cor de seleção da tabela
            $('.receita-t9 .tabela-receita .od-perto .esferico').addClass('cor-selecao');
            
            //Desabilitar botão prosseguir
            $('.receita-t9 .navegacao .btn-next').css({"pointer-events":"none","opacity":"0.5"});
            
		});
    	//Se clicar em prosseguir, rolar para tela 10 (index 9)
    	$('.receita-t9 .navegacao').on('click', '.btn-next', function() {
            if ((esfericoPOD <= 0 && esfericoPOE <= 0)||(esfericoPOD >= 0 && esfericoPOE >= 0)){
                $(".receita-t10 .origem").val('8');
                $(".receita-t10 .esfericoOD").val(esfericoOD);
                $(".receita-t10 .esfericoOE").val(esfericoOE);
                $(".receita-t10 .cilindricoOD").val(cilindricoOD);
                $(".receita-t10 .cilindricoOE").val(cilindricoOE);
                $(".receita-t10 .eixoOD").val(eixoOD);
                $(".receita-t10 .eixoOE").val(eixoOE);
                $(".receita-t10 .adicao").val(add);
                $(".receita-t10 .pertoEOD").val(esfericoPOD);
                $(".receita-t10 .pertoEOE").val(esfericoPOE);

                $carousel.flickity( 'select', 9 );
                jQuery('html, body').animate({scrollTop:112},'slow');
            }else{
                alert('ATENÇÃO! Miopia e Hipermetropia no mesmo óculos! Tem certeza que os sinais na sua receita são diferentes?');
            }
		});

    /*Fim tela 9*/

    /*Tela 10 - formulário*/
        //colocando mascaras
        $('#val_cep').mask('00000-000');
        $('#val_celular').mask('(00) 00000-0000');
    	//Após preencher todos os campos, habilitar botão prosseguir
         $(".receita-t10 input[type='text']").on("change", function(){
            if ($('input[name="nome"]').val() != '' && $('input[name="celular"]').val() != '' && $('input[name="email"]').val() != ''){
                //Habilitar botão prosseguir
                $('.receita-t10 .navegacao .btn-next').css({"pointer-events":"auto","opacity":"1"});
            }else{
                $('.receita-t10 .navegacao .btn-next').css({"pointer-events":"none","opacity":"0.5"});
            }
        });
    	
    	//Ao clicar em voltar, rolar para tela 9 se veio de perto, rolar para tela 8 se veio de add, e pra tela 5 se não tem add
    	$('.receita-t10 .navegacao').on( 'click', '.btn-prev', function() {
			$carousel.flickity( 'select', $(".receita-t10 .origem").val());
			jQuery('html, body').animate({scrollTop:112},'slow');
		});

        //Ao clicar em prosseguir, validar e-mail e Calcular resultado
    	/*Início função de validação do email antes da finalização do orçamento*/
        $('.resultado').click(function(){
            //Verificar se e-mail digitado é válido
            if ($('#val_email').val() != '') {
                var emailP = $('#val_email').val();
                var resultado;
                $.ajax({
                    url:'https://api.thechecker.co/v2/verify?email='+emailP+'&api_key=ca8b3da505b8d3673cb6532b3e71117b32d84e1a8f1b9a2a9ca34a03e32763bf',
                    async: false,
                    dataType: 'json',
                    success: function(resposta){
                        resultado = resposta.reason;
                    }
                });
                if(resultado != "accepted_email"){
                    alert('Por favor digite um e-mail válido!');
                    return false;
                }
            }

            //tribuir valor das váriaveis ao campo hidden a ser enviado
        });
        /*Fim função de validação do e-mail*/
    /*Fim tela 10*/

    /*Função que popula o select com os graus de acordo com o sinal escolhido*/
    function preencheGrau(sinal, grau){
    	if(sinal == "Negativo (-)"){
			grau.html('<option value="" disabled selected>Grau</option>');
			var cont = 0.0;
			for (var i = 0; i >= -120; i--) {
				grau.append('<option>'+cont.toFixed(2)+'</option>');
				cont-=0.25;
			}
		}

		if(sinal == "Positivo (+)"){
			grau.html('<option value="" disabled selected>Grau</option>');
			var cont = 0.0;
			for (var i = 0; i <= 80; i++) {
				grau.append('<option>'+cont.toFixed(2)+'</option>');
				cont+=0.25;
			}
		}
    }

});