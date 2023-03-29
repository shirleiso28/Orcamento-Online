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
		<div class="prescricao col-md-12">
			
			<div class="row titulo-prescricao">
				<div class="container">
					<div class="col-md-8 offset-md-2 col-sm-12 col-xs-12 text-md-center text-sm-center text-xs-center">
						<h1>Saiba o valor das lentes de resina mais finas que você pode ter</h1>
						<p>
							Tem campos em branco na sua receita?<br>
							Não se preocupe! Você pode deixá-los em branco aqui também ;)
						</p>
						<b><p class="lembre">
							Lembre-se que não é possível selecionar miopia junto com hipermetropia no mesmo olho.
						</p></b>
					</div>
				</div>
			</div>
			<form method="post" action="{url entity='checkout-orcamento'}" id="form-prescricao">
				<div class="row seletor">
					<!-- Div do olho esquerdo -->
					<div class="col-md-6 col-sm-6 col-xs-6 text-md-center text-sm-center text-xs-center olho-direito">
						<h3>Grau do olho direito</h3>
						<p>
							<img 
								class=" img-responsive img-olho" 
								src="{$urls.img_url}/prescricao/olho-direito.svg" 
								alt="Olho Direito"
							>
						</p>
						<p class="sele-grau sele-grau-d">
							<button class="btn azul-claro" type="button">
								{if Context::getContext()->isMobile() || Context::getContext()->isTablet() }
									SELECIONE<br>SEU GRAU
								{else}
									SELECIONE SEU GRAU
								{/if}
							</button>
							<span class="grau-geral-btn tem-grau">
								
								<span class="ametropia"></span> 
								<br>
								<span class="cilindrico"></span>
										
							</span>
						</p>
						<h6 class="sem-grau d-sem-grau">
							<a href="javascript:void(0)" class="d-sem-grau-a">SEM GRAU</a>
							<a href="javascript:void(0)" class="d-editar-grau-a">EDITAR GRAU</a>
						</h6>
					</div> <!-- Fim da div do olho esquerdo -->
					<!-- Div do olho direito -->
					<div class="col-md-6 col-sm-6 col-xs-6 text-sm-center text-xs-center text-md-center olho-esquerdo">
						<h3>Grau do olho esquerdo</h3>
						<p>
							<img 
								class=" img-responsive img-olho" 
								src="{$urls.img_url}/prescricao/olho-esquerdo.svg" 
								alt="Olho Esquerdo"
							>
						</p>
						<p class="sele-grau sele-grau-e">
							<button class="btn azul-claro" type="button">
								{if Context::getContext()->isMobile() || Context::getContext()->isTablet() }
									SELECIONE<br>SEU GRAU
								{else}
									SELECIONE SEU GRAU
								{/if}
							</button>
							<span class="grau-geral-btn tem-grau">
								
								<span class="ametropia"></span> 
								<br>
								<span class="cilindrico"></span>
										
							</span>
						</p>
						<h6 class="sem-grau e-sem-grau">
							<a href="javascript:void(0)" class="e-sem-grau-a">SEM GRAU</a>
							<a href="javascript:void(0)" class="e-editar-grau-a">EDITAR GRAU</a>
						</h6>
					</div> <!-- Fim da div do olho direito -->

					<div class="dnp col-md-12 col-sm-12 col-xs-12">
						<div class="container">
							
								{include file="catalog/prescricao-seletor-dnp.tpl"}	
							
						</div>
					</div>

				</div>

				<div class="seletor-grau-geral">
					<div class="row seletor-grau seletor-grau-e">
						<div class="container">
							<h3>
								Selecione o grau do olho esquerdo (OE)
								<img 
									class=" img-responsive img-xis" 
									src="{$urls.img_url}/prescricao/x.svg" 
									alt="Fechar Olho Esquerdo"
								>
							</h3>
							{include file="catalog/prescricao-seletor.tpl"}	
						</div>
						<div class="col-md-12 acao-confirmar">
							<div class="row">
								<div class="container flex-container">
									<div class="col-md-6 col-sm-6 col-xs-6 grau-atual flex-item">
										<p class="nenhum">
											nenhum grau selecionado
										</p>
										<p class="tem-grau">
											<span class="ametropia"></span> 
											<br>
											<span class="cilindrico"></span>
										</p>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-6 text-md-right text-sm-right text-xs-center  btn-confirma flex-item">
										<a href="javascript:void(0);" class="btn azul-escuro">CONFIRMAR GRAU PARA O OLHO ESQUERDO</a>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row seletor-grau seletor-grau-d">
						<div class="container">
							<h3>
								Selecione o grau do olho direito (OD)
								<img 
									class=" img-responsive img-xis" 
									src="{$urls.img_url}/prescricao/x.svg" 
									alt="Fechar Olho Direito"
								>
							</h3>
							{include file="catalog/prescricao-seletor.tpl"}
						</div>
						<div class="col-md-12 acao-confirmar">
							<div class="row">
								<div class="container flex-container">
									<div class="col-md-6 col-sm-6 col-xs-6 grau-atual flex-item">
										<p class="nenhum">
											nenhum grau selecionado
										</p>
										<p class="tem-grau">
											<span class="ametropia"></span> 
											<br>
											<span class="cilindrico"></span>
										</p>
									</div>
									<div class="col-md-6 col-sm-6 col-xs-6 text-md-right text-sm-right text-xs-center  btn-confirma flex-item">
										<a href="javascript:void(0);" class="btn azul-escuro">CONFIRMAR GRAU PARA O OLHO DIREITO</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="row dados-pessoais">
					<div class="container">
						<div class="col-md-8 offset-md-2">
							<div class="row ">
								<div class="col-md-6 form-group">
									<label class="form-control-label">NOME</label>
									<input id="nome" type="text" name="nome_paciente" id="nome_paciente" required="required" class="form-control">
								</div>
								<div class="col-md-6 form-group">
									<label class="form-control-label">CEP (OPCIONAL)</label>
									<input type="text" name="cep" class="form-control" id="cep">
									<input type="hidden" name="simula_frete" id="simula_frete" value="1">
								</div>
							</div>
							<div class="row form-group grupo-imagem-ilustra">
								<div class="col-md-6 ">
									<label class="form-control-label">E-MAIL</label>
									<input id="newsletter-input" type="email" name="email" required="required" class="form-control">
								</div>
								<div class="col-md-6">
									<div class="row">
										<div class="col-md-12">
											<label class="form-control-label">&nbsp; </label>
											<button id="news-mais4" class="btn azul-escuro form-control-submit" name="submit-prescricao" type="submit" value="submit-prescricao">CALCULAR</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row nao-encontrou">
					<div class="container">
						<div class="col-md-8 offset-md-2 text-md-center col-sm-12 col-xs-12 text-md-center text-sm-center text-xs-center nao-encontrou__div">
							<h3>Não encontrou seu grau? </h3>
							<a href="{url entity='over-range'}" class='nao-encontrou__div--link link_all-cap'><p class='link_all-cap'>CLIQUE AQUI</p></a>
							<!-- <p>Envie uma foto da sua receita para gente no e-mail <a href="mailto:ajuda@lenscope.com.br">ajuda@lenscope.com.br</a></p>	 -->
						</div>
					</div>
				</div>

				<input type="hidden" name="esq_esferico" id="esq_esferico" value="{if $cook} {$esq_esferico}{else}n{/if}">

				<input type="hidden" name="dir_esferico" id="dir_esferico" value="{if $cook} {$dir_esferico}{else}n{/if}">

				<input type="hidden" name="esq_cilindrico" id="esq_cilindrico" value="{if $cook} {$esq_cilindrico}{else}n{/if}">

				<input type="hidden" name="dir_cilindrico" id="dir_cilindrico" value="{if $cook} {$dir_cilindrico}{else}n{/if}">

				<input type="hidden" name="esq_tipo_ametropia" id="esq_tipo_ametropia" value="n">

				<input type="hidden" name="dir_tipo_ametropia" id="dir_tipo_ametropia" value="n">

				<input type="hidden" name="lente" id="lente" value="{$lente}">

				<input type="hidden" name="armacao" id="armacao" value="{$armacao}">

			</form>

		</div>


		<!-- Modal Como cilindrico-->
			<div class="modal fade" id="modal-cilindrico" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        

			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <img 
	                                class="" 
	                                src="{$urls.img_url}/internas-geral/x-modal.svg" 
	                                alt="close-modal"
	                            >
	                </button>
	                <h3 class="text-xs-center">Entenda o que é Grau Cilíndrico</h3>
			      </div>
			      <div class="modal-body">
			      		<p class="text-xs-center">
			      			Para saber se você tem astigmatismo, basta, em sua receita, ver se na coluna “Cilíndrico” ou “Cil.” possui algum número preenchido.
			      		</p>				
			      		<p class="text-xs-center">
			      			<img 
								class="img-fluid" 
								src="{$urls.img_url}/prescricao/modal-cil.png" 
								alt="Exemplo esférico"
							>
			      		</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn azul-escuro" data-dismiss="modal">Concluir</button>
			      </div>
			    </div>
			  </div>
			</div>

		<!-- Modal Como esferico-->
			<div class="modal fade" id="modal-esferico" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        

			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <img 
	                                class="" 
	                                src="{$urls.img_url}/internas-geral/x-modal.svg" 
	                                alt="close-modal"
	                            >
	                        </button>
	                        <h3 class="text-xs-center">Entenda o que é Grau Esférico</h3>
			      </div>
			      <div class="modal-body">
			      	<p class="text-xs-center">
			      		Caso você tenha esteja com sua receita em mãos, é muito simples saber se você tem miopia ou hipermetropia!<br>
						Se na coluna “Esférico” ou “Esf.” o número for um número negativo, você tem miopia. Se o número for positivo, você tem hipermetropia.<br>
						Caso nessa coluna não tenha nenhum número, você não tem nem miopia nem hipermetropia.
			      	</p>				
			      	<p class="text-xs-center">
			      		<img 
								class="img-fluid" 
								src="{$urls.img_url}/prescricao/modal-esf.png" 
								alt="Exemplo esférico"
							>
			      	</p>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn azul-escuro" data-dismiss="modal">Concluir</button>
			      </div>
			    </div>
			  </div>
			</div>

	{/block}