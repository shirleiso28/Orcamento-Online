{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='page.tpl'}

    {block name='page_content_container'}
    	<!--INICIO STRIPE-->
    	{if isset($smarty.get.msn) || isset($msn)}
			<div class="alerta">
				<div class="stripe-aviso">
			        <ul class="{if $smarty.get.msn === 'Seu contato foi enviado com sucesso'}ps-alert-success{else}ps-alert-error{/if}">
			          	<li class="item container">
				            <i>
				            	{if $smarty.get.msn == 'Seu contato foi enviado com sucesso'}
					                <svg viewBox="0 0 24 24">
					                  <path fill="#fff" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
					                </svg>
					            {else}
						            <svg viewBox="0 0 24 24">
						              <path fill="#fff" d="M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z"></path>
						            </svg>
					            {/if}
				            </i>
			            	<p>{if $smarty.get.msn}{urldecode($smarty.get.msn)}{elseif isset($msn)}{$msn}{/if}</p>	
				            <div class="fechar-item-stripe text-xs-right">
				              <img src="{$urls.img_url}/checkout/x-branco-stripe.svg" onerror="this.onerror=null; this.src='{$urls.img_url}/checkout/x-branco-stripe.png'"  class="img-responsive" alt="Lenscope">
				            </div>
			            </li>
			        </ul>
			    </div>
			</div>
		{/if}
    	<!--FIM STRIPE-->

		<!-- INICIO SESSAO ACIMA DA GRADE -->
    	<div class="col-md-12 acima-grade">
    		<div class='container'>
	    		<div class="col-sm-12 text-xs-center acima-grade__header">
	    			<div class='acima-grade__header--titulo'>
		    			<h1>Seu grau está acima da nossa grade padrão</h1>
	    			</div>
	    			<div class='acima-grade__header--texto'>
		    			<p>
		    				Mas não desanime!
		    				<br>
		    				Preencha o formulário abaixo e anexe a foto da sua receita.
		    				<br>
		    				Vamos encontrar a melhor solução para você ❤
		    			</p>
		    		</div>
	    		</div>
	    	</div>
    	</div>
		<!-- FIM SESSAO ACIMA DA GRADE -->

		<!-- INICIO SESSAO FORM ACIMA DA GRADE -->
		<div class='{if Context::getContext()->isTablet()} col-md-12 {else} offset-md-1 col-md-10 {/if} acima-form'>
	    	<div class="container">
	    		<div class="row text-xs-center acima-form__conteudo">

        			<form method="post" action="{url entity='over-range'}" enctype="multipart/form-data" class='formulario'>

						<div class="offset-lg-1 offset-md-0 offset-sm-1 offset-xs-0 col-lg-10 col-md-12 col-sm-10 col-xs-12">
							<div class="col-md-6 formulario__campo-nome">
								<label class="form-control-label">NOME</label>
								<input id="nome" type="text" name="nome_paciente" id="nome_paciente" required="required" class="form-control">
							</div>
							<div class="col-md-6 formulario__campo-email">
								<label class="form-control-label">E-MAIL</label>
								<input id="email" type="email" name="email" class="form-control" required="required">
							</div>
						</div>
						<div class="offset-lg-1 offset-md-0 offset-sm-1 offset-xs-0 col-lg-10 col-md-12 col-sm-10 col-xs-12">
							<div class="col-md-6 formulario__campo-foto">
								<label class="form-control-label">FOTO DA SUA RECEITA</label>
								<div class="text-xs-center form-enviar">
									<div class="input-group">
										<input type="text" class="form-control" readonly 
										value="Selecione o arquivo" name='selecioneArquivo'
										/>
										<label class="formulario__campo-foto--procurar" for='fileUpload'>
											<span class="btn azul-escuro formulario__campo-foto--procurar--botao">											
												PROCURAR
												<input type="file" name="fileUpload" id="fileUpload" value="Enviar" style="display:none" />
											</span>
										</label>							
									</div>
								</div>
							</div>
							<div class="col-md-6 formulario__campo-enviar">
								<div class="row">
									<div class="col-md-12 text-xs-left">
										<label class="form-control-label">&nbsp; </label>
										<button id="news-mais4" class="btn azul-escuro formulario__campo-enviar--botao" name="submit-over-range" type="submit" value="submit-over-range">ENVIAR</button>
									</div>
								</div>
							</div>
						</div>
						
					</form>

				</div>
			</div>
    	</div>
	{/block}