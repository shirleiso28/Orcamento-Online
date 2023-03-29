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
<div class="carousel carousel-d1" data-flickity='{ "freeScroll": false, "lazyLoad": true, "prevNextButtons": false, "pageDots": false, "adaptiveHeight": true, "draggable": false}'>
	<!-- INICIO TELA 1 -->
	<div class="carousel-cell col-sm-12">
		<!-- INICIO INTRODUCAO -->
		<div class="row intro">
			<div class="container text-xs-center">
				<h1>Descubra o preço das nossas lentes para o seu grau</h1>
				<!-- Onda -->
				
			</div>
			<div class="col-dm-12 ondabanner"  style="background-image: url({$urls.img_url}internas-geral/ferramenta-d1/onda2.svg)">	
				</div>
		</div>
		<!-- FIM INTRODUCAO -->

		<!-- INICIO RECEITA -->
		<div class="row receita receita-t1">
			<div class="container text-xs-center">
				<h2>A coluna “Esf” da sua receita está preenchida?</h2>
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-xs-12 offset-xs-0">
					<table class="tabela-receita table">
						<thead>
							<tr>
								<td></td>
								<td>
									<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta.svg">
								</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
						</thead>
						<tbody class="table-bordered">
							<tr class="titulo">
								<td class="superior-esq"></td>
								<td class="esferico cor-selecao">
									<p><strong>ESF</strong></p>
								</td>
								<td class="cilindrico">
									<p><strong>CIL</strong></p>
								</td>
								<td class="eixo superior-dir">
									<p><strong>EIX</strong></p>
								</td>
							</tr>
							<tr class="olho-direito">
								<td class="titulo-olho">
									<p><strong>OD</strong></p>
								</td>
								<td class="esferico cor-selecao"><p></p></td>
								<td class="cilindrico"><p></p></td>
								<td class="eixo"><p></p></td>
							</tr>
							<tr class="olho-esquerdo">
								<td class="titulo-olho inferior-esq">
									<p><strong>OE</strong></p>
								</td>
								<td class="esferico cor-selecao"><p></p></td>
								<td class="cilindrico"><p></p></td>
								<td class="eixo inferior-dir"><p></p></td>
							</tr>
						</tbody>
					</table>
					<div class="navegacao simNao">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1 btn-nao">Não</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-sim">Sim</a>
					</div>
				</div>
			</div>
		</div>

		<!-- FIM RECEITA -->
	</div>

	<!-- FIM TELA 1 -->

	<!-- INICIO TELA 2 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t2 preencher-grau">
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<h2>Preencha o seu grau esférico</h2>
					<div class="col-md-6 col-xs-12">
						<table class="tabela-receita table">
							<thead>
								<tr>
									<td></td>
									<td>
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta.svg">
									</td>
									<td>
									</td>
									<td>
									</td>
								</tr>
							</thead>
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="superior-esq"></td>
									<td class="esferico cor-selecao">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito">
									<td class="titulo-olho cor-selecao">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico cor-selecao"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo"><p></p></td>
								</tr>
								<tr class="olho-esquerdo">
									<td class="titulo-olho inferior-esq titulo-olho-esq">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo inferior-dir"><p></p></td>
								</tr>
							</tbody>
						</table>
						
					</div>
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
						<div class="col-xs-12 selecao-olho">
							<label class="col-xs-12 text-xs-left">O.D (Olho Direito)</label>
							<div class="col-xs-12 selecao">
								<select name="sinal-od"  class="col-xs-6 mr-1" >
									<option value="" disabled selected>Sinal</option>
									<option>Negativo (-)</option>
									<option>Positivo (+)</option>
								</select>
								<select name="grau-od" class="col-xs-6">
									<option value="" disabled selected>Grau</option>
								</select>
							</div>
						</div>
			{if Context::getContext()->isMobile()}
					</div>
				</div>
			</div>
			<div class="linha"></div>
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
			{/if}
						<div class="col-xs-12 selecao-olho">
							<label class="col-xs-12 text-xs-left">O.E (Olho Esquerdo)</label>
							<div class="col-xs-12 selecao selecao-olho-esq">
								<select name="sinal-oe" class="col-xs-6 mr-1">
									<option value="" disabled selected>Sinal</option>
									<option>Negativo (-)</option>
									<option>Positivo (+)</option>
								</select>
								<select name="grau-oe" class="col-xs-6">
									<option value="" disabled selected>Grau</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro btn-next" style="width: 150px;">Prosseguir</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-next">Prosseguir</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>

	<!-- FIM TELA 2 -->

	<!-- INICIO TELA 3 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t3">
			<div class="container text-xs-center">
				<h2>A coluna “Cil”  da sua receita está preenchida?</h2>
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-xs-12 offset-xs-0">
					<table class="tabela-receita table">
						<thead>
							<tr>
								<td></td>
								<td>
								</td>
								<td>
									<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta.svg">
								</td>								
								<td>
								</td>
							</tr>
						</thead>
						<tbody class="table-bordered">
							<tr class="titulo">
								<td class="superior-esq"></td>
								<td class="esferico">
									<p><strong>ESF</strong></p>
								</td>
								<td class="cilindrico">
									<p><strong>CIL</strong></p>
								</td>
								<td class="eixo superior-dir">
									<p><strong>EIX</strong></p>
								</td>
							</tr>
							<tr class="olho-direito">
								<td class="titulo-olho">
									<p><strong>OD</strong></p>
								</td>
								<td class="esferico"><p></p></td>
								<td class="cilindrico"><p></p></td>
								<td class="eixo"><p></p></td>
							</tr>
							<tr class="olho-esquerdo">
								<td class="titulo-olho inferior-esq">
									<p><strong>OE</strong></p>
								</td>
								<td class="esferico"><p></p></td>
								<td class="cilindrico"><p></p></td>
								<td class="eixo inferior-dir"><p></p></td>
							</tr>
						</tbody>
					</table>
					<div class="navegacao simNao">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1 btn-nao">Não</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-sim">Sim</a>

					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>
	<!-- FIM TELA 3 -->

	<!-- INICIO TELA 4 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t4 preencher-grau">
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<h2>Preencha o seu grau  cilíndrico</h2>
					<div class="col-md-6 col-xs-12">
						<table class="tabela-receita table">
							<thead>
								<tr>
									<td></td>
									<td>
									</td>
									<td>
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta.svg">
									</td>									
									<td>
									</td>
								</tr>
							</thead>
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="superior-esq"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico cor-selecao">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito">
									<td class="titulo-olho cor-selecao">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico"><p></p></td>
									<td class="cilindrico cor-selecao"><p></p></td>
									<td class="eixo"><p></p></td>
								</tr>
								<tr class="olho-esquerdo">
									<td class="titulo-olho inferior-esq titulo-olho-esq">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo inferior-dir"><p></p></td>
								</tr>
							</tbody>
						</table>
						
					</div>
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
						<div class="col-xs-12 selecao-olho">
							{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
							<div class="col-xs-6" ></div>
							{/if}
							<label class="col-xs-6 text-xs-left">O.D (Olho Direito)</label>
							<div class="col-xs-12 selecao">
								{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
								<div class="col-xs-6" >
								</div>
								{/if}
								<select name="grauC-od" class="col-xs-6">
									<option value="grau" disabled selected>Grau</option>
									{$cont = 0.0}
									{for $i = 0; $i>=-48; $i--}
										<option>{number_format($cont,2)}</option>
										{$cont = $cont - 0.25}
									{/for}
								</select>
							</div>
						</div>
			{if Context::getContext()->isMobile()}
					</div>
				</div>
			</div>
			<div class="linha"></div>
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
			{/if}
						<div class="col-xs-12 selecao-olho">
							{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
							<div class="col-xs-6"></div>
							{/if}
							<label class="col-xs-6 text-xs-left">O.E (Olho Esquerdo)</label>
							<div class="col-xs-12 selecao selecao-olho-esq">
								{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
								<div class="col-xs-6">
								</div>
								{/if}
								<select name="grauC-oe"class="col-xs-6">
									<option value="grau" disabled selected>Grau</option>
									{$cont = 0.0}
									{for $i = 0; $i>=-48; $i--}
										<option>{number_format($cont,2)}</option>
										{$cont = $cont - 0.25}
									{/for}
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro btn-next" style="width: 150px;">Prosseguir</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-next">Prosseguir</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>
	<!-- FIM TELA 4 -->


	<!-- INICIO TELA 5 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t5 preencher-grau">
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<h2>Agora digite o eixo</h2>
					<div class="col-md-6 col-xs-12">
						<table class="tabela-receita table">
							<thead>
								<tr>
									<td></td>
									<td>
									</td>									
									<td>
									</td>
									<td>
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta.svg">
									</td>
								</tr>
							</thead>
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="superior-esq"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir cor-selecao">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito">
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico"></td>
									<td class="cilindrico"></td>
									<td class="eixo cor-selecao"></td>
								</tr>
								<tr class="olho-esquerdo">
									<td class="titulo-olho inferior-esq titulo-olho-esq">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo inferior-dir cor-selecao"><p></p></td>
								</tr>
							</tbody>
						</table>
						
					</div>
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
						<div class="col-xs-12 selecao-olho">
							{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
							<div class="col-xs-6" ></div>
							{/if}
							<label class="col-xs-6 text-xs-left">O.D (Olho Direito)</label>
							<div class="col-xs-12 selecao">
								{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
								<div class="col-xs-6" >
								</div>
								{/if}
								<input type="text" name="eixo-dir" placeholder="Eixo" class="col-xs-6" maxlength="3">
							</div>
						</div>
			{if Context::getContext()->isMobile()}
					</div>
				</div>
			</div>
			<div class="linha"></div>
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
			{/if}
						<div class="col-xs-12 selecao-olho">
							{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
							<div class="col-xs-6"></div>
							{/if}
							<label class="col-xs-6 text-xs-left">O.E (Olho Esquerdo)</label>
							<div class="col-xs-12 selecao selecao-olho-esq">
								{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
								<div class="col-xs-6">
								</div>
								{/if}
								<input type="text" name="eixo-esq" placeholder="Eixo" class="col-xs-6" maxlength="3">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro btn-next" style="width: 150px;">Prosseguir</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-next">Prosseguir</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>
	<!-- FIM TELA 5 -->

	<!-- INICIO TELA 6 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t6">
			<div class="container text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 modeloReceita">
					<h2>Sua receita possui os campos Add (adição) OU para perto preenchidos?</h2>
					<div class="col-md-6 col-xs-12">
						<table class="tabela-receita tabela-adicao table">
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="superior-esq"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito">
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo"><p></p></td>
								</tr>
								<tr class="olho-esquerdo">
									<td class="titulo-olho inferior-esq">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo"><p></p></td>
								</tr>
								<tr>
									<td class="add-seta">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="add inferior-esq">
										<p>ADD</p>
									</td>
									<td class="add inferior-dir" colspan="3"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-6 col-xs-12 perto-longe">
						<table class="tabela-receita tabela-adicao table">
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="add-seta" rowspan="3">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="vertical" rowspan="3">
										<p>Longe</p>
									</td>
									<td class="titulo-olho"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito od">
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico cor-selecao"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo"><p></p></td>
								</tr>
								<tr class="olho-esquerdo oe">
									<td class="titulo-olho">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico cor-selecao"><p></p></td>
									<td class="cilindrico"><p></p></td>
									<td class="eixo inferior-dir"><p></p></td>
								</tr>
								<tr style="height:5px;">
									
								</tr>
								<tr class="od-perto">
									<td class="add-seta" rowspan="3">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="vertical" rowspan="2">
										<p>Perto</p>
									</td>
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo superior-dir"></td>
								</tr>
								<tr class="oe-perto">
									<td class="titulo-olho">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo inferior-dir"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-xs-12 offset-xs-0">
					<div class="navegacao simNao">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1 btn-nao">Não</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-sim">Sim</a>
					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>
	<!-- FIM TELA 6 -->

	<!-- INICIO TELA 7 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t7">
			<div class="container text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 modeloReceita">
					<h2>Qual modelo abaixo a receita do seu óculos é mais parecida?</h2>
					<div class="col-md-6 col-xs-12">
						<div class="escolhaAdd">
							<input type="radio" id="add" name="add" value="add" class="col-xs-1 align-items-center">
							<label for="add" class="col-xs-11 text-xs-left">Receita com campo Adição (add) preenchido</label>
						</div>
						<table class="tabela-receita tabela-adicao table">
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="superior-esq"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito">
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico"></td>
									<td class="cilindrico"></td>
									<td class="eixo"></td>
								</tr>
								<tr class="olho-esquerdo">
									<td class="titulo-olho inferior-esq">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico"></td>
									<td class="cilindrico"></td>
									<td class="eixo"></td>
								</tr>
								<tr>
									<td class="add-seta">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="add inferior-esq">
										<p>ADD</p>
									</td>
									<td class="add add-value inferior-dir" colspan="3"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-6 col-xs-12 perto-longe">
						<div class="escolhaAdd">
							<input type="radio" id="pertoLonge" name="add" value="pertoLonge" class="col-xs-1">
							<label for="pertoLonge" class="col-xs-11 text-xs-left">Receita com campos para Longe e Perto preenchidos</label>
						</div>
						<table class="tabela-receita tabela-adicao table">
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="add-seta" rowspan="3">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="vertical" rowspan="3">
										<p>Longe</p>
									</td>
									<td class="titulo-olho"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito od">
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo"></td>
								</tr>
								<tr class="olho-esquerdo oe">
									<td class="titulo-olho">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo inferior-dir"></td>
								</tr>
								<tr style="height:5px;">
									
								</tr>
								<tr class="od-perto">
									<td class="add-seta" rowspan="3">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="vertical" rowspan="2">
										<p>Perto</p>
									</td>
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo superior-dir"></td>
								</tr>
								<tr class="oe-perto">
									<td class="titulo-olho">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo inferior-dir"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro btn-next" style="width: 150px;">Prosseguir</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-next">Prosseguir</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>
	<!-- FIM TELA 7 -->

	<!-- INICIO TELA 8 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t8 preencher-grau">
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<h2>Preencha o seu grau de Adição</h2>
					<div class="col-md-6 col-xs-12">
						<table class="tabela-receita  tabela-adicao table">
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="superior-esq"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito">
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico"></td>
									<td class="cilindrico"></td>
									<td class="eixo"></td>
								</tr>
								<tr class="olho-esquerdo">
									<td class="titulo-olho inferior-esq">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico"></td>
									<td class="cilindrico"></td>
									<td class="eixo"></td>
								</tr>
								<tr>
									<td class="add-seta">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="add inferior-esq">
										<p>ADD</p>
									</td>
									<td class="add add-value inferior-dir" colspan="3"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
						<div class="col-xs-12 selecao-olho">
							{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
							<div class="col-xs-6" ></div>
							{/if}
							<label class="col-xs-6 text-xs-left">ADD</label>
							<div class="col-xs-12 selecao">
								{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
								<div class="col-xs-6" >
								</div>
								{/if}
								<select name="adicao" class="col-xs-6">
									<option value="grau" disabled selected>Grau</option>
									{$cont = 0.0}
									{for $i = 0; $i<=16; $i++}
										<option>+ {number_format($cont,2)}</option>
										{$cont = $cont + 0.25}
									{/for}
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro btn-next" style="width: 150px;">Prosseguir</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-next">Prosseguir</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>
	<!-- FIM TELA 8 -->

	<!-- INICIO TELA 9 -->
	<div class="col-sm-12 carousel-cell">
		<div class="row receita receita-t9 preencher-grau">
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<h2>Preencha o seu grau esférico para perto</h2>
					<div class="col-md-6 col-xs-12 perto-longe">
						<table class="tabela-receita tabela-adicao table">
							<tbody class="table-bordered">
								<tr class="titulo">
									<td class="add-seta" rowspan="3">
									</td>
									<td class="vertical" rowspan="3">
										<p>Longe</p>
									</td>
									<td class="titulo-olho"></td>
									<td class="esferico">
										<p><strong>ESF</strong></p>
									</td>
									<td class="cilindrico">
										<p><strong>CIL</strong></p>
									</td>
									<td class="eixo superior-dir">
										<p><strong>EIX</strong></p>
									</td>
								</tr>
								<tr class="olho-direito od">
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico"></td>
									<td class="cilindrico"></td>
									<td class="eixo"></td>
								</tr>
								<tr class="olho-esquerdo oe">
									<td class="titulo-olho">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico"></td>
									<td class="cilindrico"></td>
									<td class="eixo inferior-dir"></td>
								</tr>
								<tr style="height:5px;">
									
								</tr>
								<tr class="od-perto">
									<td class="add-seta" rowspan="3">
										<img src="{$urls.img_url}internas-geral/ferramenta-d1/seta-direita.svg">
									</td>
									<td class="vertical" rowspan="2">
										<p>Perto</p>
									</td>
									<td class="titulo-olho">
										<p><strong>OD</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo superior-dir"></td>
								</tr>
								<tr class="oe-perto">
									<td class="titulo-olho">
										<p><strong>OE</strong></p>
									</td>
									<td class="esferico cor-selecao"></td>
									<td class="cilindrico"></td>
									<td class="eixo inferior-dir"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
						<div class="col-xs-12 selecao-olho">
							<label class="col-xs-12 text-xs-left">O.D (Olho Direito)</label>
							<div class="col-xs-12 selecao">
								<select name="sinalP-od"  class="col-xs-6 mr-1" >
									<option value="sinal" disabled selected>Sinal</option>
									<option>Negativo (-)</option>
									<option>Positivo (+)</option>
								</select>
								<select name="grauP-od" class="col-xs-6">
									<option value="grau" disabled selected>Grau</option>
								</select>
							</div>
						</div>
			{if Context::getContext()->isMobile()}
					</div>
				</div>
			</div>
			<div class="linha"></div>
			<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
				<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0 preencher">
					<div class="col-md-6 col-xs-12" style="padding-top: 20px;">
			{/if}
						<div class="col-xs-12 selecao-olho">
							<label class="col-xs-12 text-xs-left">O.E (Olho Esquerdo)</label>
							<div class="col-xs-12 selecao selecao-olho-esq">
								<select name="sinalP-oe" class="col-xs-6 mr-1">
									<option value="sinal" disabled selected>Sinal</option>
									<option>Negativo (-)</option>
									<option>Positivo (+)</option>
								</select>
								<select name="grauP-oe" class="col-xs-6">
									<option value="grau" disabled selected>Grau</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="navegacao">
				{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
				<div class="container">
					<div class="col-lg-8 offset-lg-2 btn-navegacao">
						<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro btn-next" style="width: 150px;">Prosseguir</a>
					</div>
				</div>
				{else}
					<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
						<a href="javascript:void(0);" class="btn azul-claro col-xs-6 btn-next">Prosseguir</a>
					</div>
				{/if}
			</div>
			<input type="hidden" name="origem" class="origem">
		</div>
	</div>

	<!-- FIM TELA 9 -->

	<!-- INICIO TELA 10 -->
	<div class="col-sm-12 carousel-cell">
		<form id="form-orcamento" method="post" action="{url entity='d1-resultado'}">
			<div class="row receita receita-t10">
				<div class="container {if Context::getContext()->isMobile()}container-mobile{/if} text-xs-center">
					<div class="col-lg-8 offset-lg-2 col-xs-12 offset-xs-0">
						<h2>Estamos quase lá!</h2>
						<p>Preencha os campos abaixo e veja o valor de nossas lentes para seu grau</p>
						<div class="row text-xs-left">
							<div class="col-md-6 col-xs-12">
								<label class="col-xs-12">Nome</label>
								<input type="text" name="nome" class="col-xs-12" id="val_nome" required>
							</div>
							<div class="col-md-6 col-xs-12">
								<label class="col-xs-12">Celular</label>
								<input type="text" name="celular" id="val_celular"class="col-xs-12" required>
							</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-xs-12">
								<label class="col-xs-12">Email</label>
								<input type="text" name="email" id="val_email" class="col-xs-12" required>
							</div>
							<div class="col-md-6 col-xs-12">
								<label class="col-xs-12">Cep (Opcional)</label>
								<input type="text" name="cep" class="col-xs-12" id="val_cep">
							</div>
						</div>
					</div>
				</div>
				<div class="navegacao">
					{if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
					<div class="container">
						<div class="col-lg-8 offset-lg-2 btn-navegacao">
							<a href="javascript:void(0);" class="btn azul-claro btn-prev" style="width: 150px;">Voltar</a>
							<input type="submit" name="resultado" class="btn azul-claro col-xs-6 btn-next resultado" value="Ver Orçamento">
						</div>
					</div>
					{else}
						<div class="col-xs-12 btn-navegacao btn-navegacao-mobile">
							<a href="javascript:void(0);" class="btn azul-claro col-xs-6 mr-1  btn-prev">Voltar</a>
							<button type="submit" name="resultado" class="btn azul-claro col-xs-6 btn-next resultado" value="ver-orcamento">Ver Orçamento</button> 
						</div>
					{/if}
				</div>
				<input type="hidden" name="origem" class="origem">
				<input type="hidden" name="esq_esferico" class="esfericoOE">
				<input type="hidden" name="dir_esferico" class="esfericoOD">
				<input type="hidden" name="esq_cilindrico" class="cilindricoOE">
				<input type="hidden" name="dir_cilindrico" class="cilindricoOD">
				<input type="hidden" name="esq_eixo" class="eixoOE">
				<input type="hidden" name="dir_eixo" class="eixoOD">
				<input type="hidden" name="add" class="adicao">
				<input type="hidden" name="esq_esferico_perto" class="pertoEOE">
				<input type="hidden" name="dir_esferico_perto" class="pertoEOD">
				

			</div>
		</form>
	</div>
	<!-- FIM TELA 10 -->
</div>
{/block}