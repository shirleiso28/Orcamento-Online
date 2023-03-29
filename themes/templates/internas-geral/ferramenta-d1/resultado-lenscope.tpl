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
		<div class="col-sm-12">
			<div class="row resultado resultado-lenscope">
				<div class="col-md-8 offset-md-2 col-sm-12 text-xs-center">
					<h1>Veja as nossas lentes ideais para o seu grau </h1>
					<p>Para comprar, é só selecionar a opção que preferir e clicar em "Comprar".</p>
				</div>
				<div class="lente-menosquatro" id="lente-menosquatro">
		            <div class="container lente-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}lente-container-mobile{/if}">
		                <div class="col-md-12 col-sm-12 col-xs-12 conteudo-lentes-lenscope conteudo-lentes {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}conteudo-lentes-mobile{/if}">

		                    {if Context::getContext()->getDevice() == 1 || Context::getContext()->isTablet()}
		                        <div class='conteudo-lentes-lenscope__card conteudo-lentes-lenscope__card--first col-xs-12 flex-container'>

		                            <div class='col-xs-12 col-sm-12 col-md-4 col-lg-4 text-xs-center conteudo-lentes-lenscope__card--head flex-item'>
		                                <div class="row">
		                                    <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Poli 1.59</h3>
		                                </div>
		                                <div class="text-xs-center text-sm-center text-md-center">
		                                    <a href="{url entity='lente-lenscope'}">
		                                        <img 
		                                            class=" img-fluid" 
		                                            src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-1.59.jpg" 
		                                            alt="Lenscope Poli 1.59"
		                                        >
		                                    </a>
		                                    <div class="col-xs-8 offset-xs-2 valor-lentes text-xs-left">
								    			<p>R${$preco} (o par de lentes)<br><b>3x de R${$preco_tres} sem juros</b><br>
								    			<a href="javascript:void(0);" data-toggle="modal" data-target=".modal-parcelamento" class="link-parcelamento {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}link-parcelamento-mobile{/if}">Ou até 12x c/ juros</a>
								    		</div>
		                                </div>
		                            </div>  

		                            <div class='col-xs-12 col-sm-12 col-md-8 col-lg-8 conteudo-lentes-lenscope__card--body flex-item text-xs-center text-sm-center text-md-left text-lg-left'>
		                                <div class='col-xs-12'>
		                                    <p>As lentes incolores para óculos com máxima resistência e proteção para o seu dia-a-dia.</p>
		                                </div>

		                                <div class="flex-item fim-div col-xs-12">
		                                    <p class="trata">Tratamentos inclusos:</p>
		                                    <ul class="tratamento">
												<li><strong>✓</strong> Proteção UV 100%</li>
												<li><strong>✓</strong> Antirreflexo</li>
												<li><strong>✓</strong> Antirrisco</li>
											</ul>

		                                    
		                                   <!--  <div class="col-xs-6 text-md-right btn-add-carrinho"> -->
								    			<form action="{url entity='cart' params = ['addLenscope' => 1]}" method="post">
								    				<a href="{url entity='lente-lenscope'}"  class="btn azul-vazado col-md-4 mr-1">Conhecer</a>
								                    <button type="submit" class="btn azul-escuro spinner-geral col-md-4">
								                    	Comprar
									                    <span class="spinner-border" role="status" aria-hidden="true">
										                	<img src="{$urls.img_url}/checkout/gif-loading.svg"></img>
											            </span>
								                    </button>
								                    <input type="hidden" name="listaProdutos[]" value="VS_LCP_P">
							                	</form>
								    		<!-- </div> -->
		                                    
		                                </div>
		                            </div>

		                        </div>

		                        <div class='conteudo-lentes-lenscope__card col-xs-12 flex-container'>

		                           <div class='col-xs-12 col-sm-12 col-md-4 col-lg-4 text-xs-center conteudo-lentes-lenscope__card--head flex-item'>
		                                <div class="row">
		                                    <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Poli 1.59 Fotocroma </h3>
		                                </div>
		                                <div class="text-xs-center text-sm-center text-md-center">
		                                    <a href="{url entity='lente-lenscope-fotocroma'}">
		                                        <img 
		                                            class=" img-fluid" 
		                                            src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-1.59-foto.gif" 
		                                            alt="Lenscope Poli 1.59 Fotocroma"
		                                        >
		                                    </a>
		                                </div>
		                            </div>  
		                            <div class='col-xs-12 col-sm-12 col-md-8 col-lg-8 conteudo-lentes-lenscope__card--body flex-item text-xs-center text-sm-center text-md-left text-lg-left'>
		                                <div class='col-xs-12'>
		                                    <p>As lentes fotossensíveis que escurecem no sol. Mais proteção e conforto para seus olhos.</p>
		                                </div>
		                                <div class='fim-div col-xs-12 flex-item'>
		                                    <p class="trata"><b>Tratamentos essenciais já inclusos sem taxas adicionais</b></p>
		                                    
		                                    <p class="conhecer"><a href="{url entity='lente-lenscope-fotocroma'}"  class="btn azul-escuro">Conhecer</a></p>
		                                </div>
		                            </div>

		                        </div>

		                        <div class='conteudo-lentes-lenscope__card col-xs-12 flex-container'>

		                           <div class='col-xs-12 col-sm-12 col-md-4 col-lg-4 text-xs-center conteudo-lentes-lenscope__card--head flex-item'>
		                                <div class="row">
		                                    <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Digital Comfort </h3>
		                                </div>
		                                <div class="text-xs-center text-sm-center text-md-center">
		                                    <a href="{url entity='lente-lenscope-comfort'}">
		                                        <img 
		                                            class=" img-fluid" 
		                                            src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-digital.jpg" 
		                                            alt=""
		                                        >
		                                    </a>
		                                </div>
		                            </div>  

		                            <div class='col-xs-12 col-sm-12 col-md-8 col-lg-8 conteudo-lentes-lenscope__card--body flex-item text-xs-center text-sm-center text-md-left text-lg-left'>
		                                <div class='col-xs-12'>
		                                    <p>As lentes com filtro de luz azul-violeta emitida pelas telas digitais que você mais utiliza no dia-a-dia.</p>
		                                </div>
		                                <div class='fim-div col-xs-12 flex-item'>
		                                    <p class="trata"><b>Tratamentos essenciais já inclusos sem taxas adicionais</b></p>
		                                    
		                                    <p class="conhecer"><a href="{url entity='lente-lenscope-comfort'}"  class="btn azul-escuro">Conhecer</a></p>
		                                </div>
		                            </div>

		                        </div>

		                        <div class='conteudo-lentes-lenscope__card conteudo-lentes-lenscope__card--last col-xs-12 flex-container'>

		                           <div class='col-xs-12 col-sm-12 col-md-4 col-lg-4 text-xs-center conteudo-lentes-lenscope__card--head flex-item'>
		                                <div class="row">
		                                    <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Shades</h3>
		                                </div>
		                                <div class="text-xs-center text-sm-center text-md-center">
		                                    <a href="{url entity='lente-lenscope-shades'}">
		                                        <img 
		                                            class=" img-fluid" 
		                                            src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-1.59-shades.jpg" 
		                                            alt="Lenscope Shades"
		                                        >
		                                    </a>
		                                </div>
		                            </div>  
		                            <div class='col-xs-12 col-sm-12 col-md-8 col-lg-8 conteudo-lentes-lenscope__card--body flex-item text-xs-center text-sm-center text-md-left text-lg-left'>
		                                <div class='col-xs-12'>
		                                    <p>As lentes escuras para óculos de sol com o seu grau.</p>
		                                </div>
		                                <div class="flex-item fim-div col-xs-12">
		                                    <p class="trata"><b>Proteção 100%UVA e UVB já inclusa sem taxas adicionais</b></p>
		                                    
		                                    <p class="conhecer"><a href="{url entity='lente-lenscope-shades'}" class="btn azul-escuro" >Conhecer</a></p>
		                                    
		                                </div>
		                            </div>
		                            
		                        </div>

		                    {else}

		                        <div class="container btn-lentes-geral btn-lentes-lenscope lenscope-foto">
		                            <div class="col-xs-5 item1">
		                                <button class="btn selecionado lenscope-159" data-index="0" data-lente="lenscope-159">INCOLORES</button>
		                            </div>
		                            <div class="col-xs-7 item2">
		                                <button class="btn branco-vazado lenscope-foto" data-index="1" data-lente="lenscope-foto">FOTOSSENSÍVEIS</button>
		                            </div>
		                            <div class="col-xs-7 item3">
		                                <button class="btn branco-vazado lenscope-azul" data-index="2" data-lente="lenscope-azul">PARA LUZ AZUL</button>
		                            </div>
		                            <div class="col-xs-5 item4">
		                                <button class="btn branco-vazado lenscope-shades" data-index="3" data-lente="lenscope-shades">ESCURAS</button>
		                            </div>
		                        </div>

		                        <div class="row conteudo-lentes-row" data-flickity='{  "freeScroll": false, "wrapAround": true, "prevNextButtons": false, "pageDots": false, "initialIndex": 0}'>

		                            <div class="col-md-4 col-sm-12 col-xs-12 lente-item-mobile lenscope-159 carousel-cell">
		                                <div class='flex-container card-lente'>
		                                    <div class='flex-item'>
		                                        <div class="row">
		                                            <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Poli 1.59</h3>
		                                        </div>
		                                        <div class="text-xs-center text-sm-center text-md-center">
		                                            <a href="{url entity='lente-lenscope'}">
		                                                <img 
		                                                    class=" img-fluid" 
		                                                    src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-1.59.jpg" 
		                                                    alt="Lenscope Poli 1.59"
		                                                >
		                                            </a>
		                                        </div>
		                                        <div class='{if Context::getContext()->getDevice() == 1}col-xs-12{/if}'>
		                                            <p>As lentes incolores para óculos com máxima resistência e proteção para o seu dia-a-dia.</p>
		                                        </div>
		                                    </div>
		                                    <div class="flex-item fim-div col-xs-12">
		                                        <p class="trata"><b>Tratamentos essenciais já inclusos sem taxas adicionais</b></p>
		                                        
		                                        <p class="conhecer"><a href="{url entity='lente-lenscope'}"  class="btn azul-escuro">Conhecer</a></p>
		                                        
		                                    </div>
		                                </div>
		                            </div>

		                            <div class="col-md-4 col-sm-12 col-xs-12 lente-item-mobile lenscope-foto carousel-cell" >
		                                <div class='flex-container card-lente'>
		                                    <div class='flex-item'>
		                                        <div class="row">
		                                            <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Poli 1.59 Fotocroma </h3>
		                                        </div>
		                                        <div class="text-xs-center text-sm-center text-md-center">
		                                            <a href="{url entity='lente-lenscope-fotocroma'}">
		                                                <img 
		                                                    class=" img-fluid" 
		                                                    src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-1.59-foto.gif" 
		                                                    alt="Lenscope Poli 1.59 Fotocroma"
		                                                >
		                                            </a>
		                                        </div>  
		                                        <div class='{if Context::getContext()->getDevice() == 1}col-xs-12{/if}'>
		                                            <p>As lentes fotossensíveis que escurecem no sol. Mais proteção e conforto para seus olhos.</p>
		                                        </div>
		                                    </div>
		                                    <div class='fim-div col-xs-12 flex-item'>
		                                        <p class="trata"><b>Tratamentos essenciais já inclusos sem taxas adicionais</b></p>
		                                        
		                                        <p class="conhecer"><a href="{url entity='lente-lenscope-fotocroma'}"  class="btn azul-escuro">Conhecer</a></p>
		                                    </div>
		                                </div>
		                            </div>

		                            <div class="col-md-4 col-sm-12 col-xs-12 lente-item-mobile lenscope-159 carousel-cell">
		                                <div class='flex-container card-lente'>
		                                    <div class='flex-item'>
		                                        <div class="row">
		                                            <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Digital Comfort</h3>
		                                        </div>
		                                        <div class="text-xs-center text-sm-center text-md-center">
		                                            <a href="{url entity='lente-lenscope'}">
		                                                <img 
		                                                    class=" img-fluid" 
		                                                    src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-digital.jpg" 
		                                                    alt="Lenscope Digital Comfort"
		                                                >
		                                            </a>
		                                        </div>
		                                        <div class='{if Context::getContext()->getDevice() == 1}col-xs-12{/if}'>
		                                            <p>As lentes com filtro de luz azul-violeta emitida pelas telas digitais que você mais utiliza no dia-a-dia.</p>
		                                        </div>
		                                    </div>
		                                    <div class="flex-item fim-div col-xs-12">
		                                        <p class="trata"><b>Tratamentos essenciais já inclusos sem taxas adicionais</b></p>
		                                        
		                                        <p class="conhecer"><a href="{url entity='lente-lenscope-comfort'}"  class="btn azul-escuro">Conhecer</a></p>
		                                        
		                                    </div>
		                                </div>
		                            </div>

		                            <div class="col-md-4 col-sm-12 col-xs-12 lente-item-mobile lenscope-shades carousel-cell">
		                                <div class='flex-container card-lente'>
		                                    <div class='flex-item '>
		                                        <div class="row">
		                                            <h3 class="col-md-12 col-sm-12 col-xs-12">Lenscope Shades</h3>
		                                        </div>
		                                        <div class="text-xs-center text-sm-center text-md-center">
		                                            <a href="{url entity='lente-lenscope-shades'}">
		                                                <img 
		                                                    class=" img-fluid" 
		                                                    src="{$urls.img_url}internas-geral/ferramenta-d1/lcp-1.59-shades.jpg" 
		                                                    alt="Lenscope Shades"
		                                                >
		                                            </a>
		                                        </div>
		                                        <div class='{if Context::getContext()->getDevice() == 1}col-xs-12{/if}'>
		                                            <p>As lentes escuras para óculos de sol com o seu grau.</p>
		                                        </div>
		                                    </div>
		                                    <div class="flex-item fim-div col-xs-12">
		                                        <p class="trata"><b>Proteção 100%UVA e UVB já inclusa sem taxas adicionais</b></p>
		                                        
		                                        <p class="conhecer"><a href="{url entity='lente-lenscope-shades'}" class="btn azul-escuro" >Conhecer</a></p>
		                                        
		                                    </div>
		                                </div>
		                            </div>

		                        </div>
		                    {/if}

		                </div>
		            </div>
		        </div>
			</div>
		</div>

		<!-- Inicio Modal (Consulta Parcelamento) -->
        <div class="modal fade modal-parcelamento" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header modal-header-encontrou">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <img 
                                class="" 
                                src="{$urls.img_url}/internas-geral/x-modal.svg" 
                                alt="close-modal"
                            >
                        </button>
                        <h3 class="text-xs-center">Opções de parcelamento</h3>
                    </div>
                    <div class="modal-body modal-body">
                        <div class="container">
                            <div class="row">
                                <table class='tabela-parcela'>
                                    <tr class='tabela-parcela__header'>
                                        <th>
                                            <h4 class="text-xs-left">Parcelas</h4>
                                        </th>
                                        <th>
                                           <h4 class="text-xs-left">Total</h4>    
                                        </th>
                                    </tr>
                                    <tbody class='tabela-parcela__body'>
                                        {for $i=0; $i < count($parcelas); $i++}
                                            <tr class='tabela-parcela__body--tr'>

                                                <td>
                                                    <p  class="text-xs-left">{$parcelas[$i]['numero_parcela']}x de R${$parcelas[$i]['total_parcela']}
                                                        {if $parcelas[$i]['is_juros']}
                                                            <span class='legenda-geral {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}juros-mobile{/if}'>{if $i <= 5}c/ juros*{else}c/ juros**{/if}</span>
                                                        {else}
                                                            <span class='legenda-geral {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}juros-mobile{/if}'>s/ juros</span>
                                                        {/if}
                                                    </p>
                                                </td>

                                                <td>
                                                    <p  class="text-xs-left">R${$parcelas[$i]['total_com_juros']}</p>
                                                </td>
                                            </tr>
                                        {/for}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class='footer-modal'>
                            <div class="col-md-12 col-sm-12 col-xs-12 conteudo">
                                <p class="text-xs-left legenda-geral">*Juros de 4% a.m.</p>
                                <p class="text-xs-left legenda-geral">**Juros de 4.3% a.m.</p>
                            </div>
                            <h3 class="text-xs-center">
                                <button class="btn azul-vazado close" data-dismiss="modal" aria-label="Close">Concluir</button>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fim Modal -->
	{/block}