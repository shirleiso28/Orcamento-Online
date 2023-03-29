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

   <div class="col-md-12 orcamento">
      <div class="row resultado">
         <div class="container">
            <div class="col-md-8 offset-md-2 offset-sm-1 offset-xs-0 col-sm-10 col-xs-12">
               <h1 class="lente-resultado text-md-center text-sm-center text-xs-center">
                  <span class="nome">{$nome_paciente}</span>, veja aqui o valor das {$nome_lente} para seu grau
              </h1>
          </div>

          <div class="quadro-resultado col-md-8 offset-md-2 offset-sm-1 offset-xs-0 col-sm-10 col-xs-12">
           <h3 class="preco text-md-center text-sm-center text-xs-center">
              <b>R${$total_tokai_real} </b> (o par de lentes)
              <br>6x de R${$total_parcelas} sem juros<b> ou até 12x com juros</b>
              <p>
                <a href="javascript:void(0);" data-toggle="modal" data-target=".modal-parcelamento" class="link-parcelamento">VER OPÇÕES DE PARCELAMENTO</a>
            </p>
        </h3>
    					<!-- <h4 class="sem-juros text-md-center text-sm-center text-xs-center">
    						sem juros no cartão
    					</h4> -->
    					<p class="tratamentos">Tratamentos inclusos</p>
    					<ul>
    						<li>Antirreflexo</li>
    						<li>Proteção 100% UV</li>
    						<li>Camada liporrepelente</li>
    						<li>Camada hidrorrepelente</li>
    						<li>Proteção contra micro-fissuras</li>
    					</ul>
                        <p class="text-xs-center comprar-lentes-resultado">
                            <a href="{url entity='checkout-aviso'}" class="btn azul-escuro">COMPRAR LENTES</a>
                        </p>
                        <p class="text-xs-center desca-pagina">
                            Desça a página para ver nossas dicas para escolha de armação
                        </p>
                    </div>
                </div>
            </div>

            <div class="row btn-acoes btn-acoes-topo" id="">
                <div class="container">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        <a href="{$link_voltar}" class="btn azul-vazado">INSERIR OUTRO GRAU</a>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6">

                        <a href="{url entity='checkout-aviso'}" class="btn azul-escuro float-md-right float-sm-right float-xs-right">COMPRAR LENTES</a>
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
                                                    <span class='legenda-geral {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}juros-mobile{/if}'>c/ juros*</span>
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
                                <p class="text-xs-left legenda-geral">*Juros de 4.3% a.m.</p>
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

        <!-- fim frete lenscope -->
        {assign var="isEntrega" value=FALSE}
        {if $isCep}
        {foreach from=$listaDadosEntrega item=entrega}
        {if $entrega['nome_modulo']=='lcp_entregalenscope'}
        {$isEntrega=TRUE}
        <div class=" row frete-lenscope">
         <div class="container">
            <div class="col-md-12 col-sm-12 col-xs-12 text-md-center text-sm-center text-xs-center">
               <img 
               class=" img-bike" 
               src="{$urls.img_url}/prescricao/entrega-gratis.svg" 
               alt="Bike"
               >
           </div>
           <h4 class="text-md-center text-sm-center text-xs-center">Coleta e entrega <span>GRÁTIS</span> via Entrega Lenscope (uhuull :D)</h4>
       </div>
   </div>
   {/if}
   {/foreach}
   {/if}
   <!-- fim frete lenscope -->

   <!-- inicio frete todos -->
   {if $isCep}
   <div class="row frete">
     <div class="container">
        <div class="col-md-8 offset-md-2 offset-sm-1 offset-xs-0 col-sm-10 col-xs-12">
           <div class="row">
              {if $isEntrega}
              <div class="col-md-12 col-xs-12 text-xs-center">
                <p>Caso não queira a Entrega Lenscope grátis, temos outras opções: 

                    <img data-toggle="tooltip" title="O valor do frete é referente somente à entrega do óculos pronto. O custo do envio da armação para a Lenscope é pago por você na agência dos Correios de sua preferência :)" data-placement="left" class="tooltip-info"  src="{$urls.img_url}/prescricao/tool-prescricao.svg" 
                    onmouseover="this.src='{$urls.img_url}/prescricao/tool-prescricao-hover.svg';"
                    onmouseout="this.src='{$urls.img_url}/prescricao/tool-prescricao.svg';"/></p>
                </div>
                <div class="col-xs-12 lista-frete text-xs-center">
                    <ul>
                        {foreach from=$listaDadosEntrega item=entrega}
                        {if $entrega['nome_modulo'] !== 'lcp_entregalenscope'}
                        <li>{$entrega['nome']}: R$ {$entrega['valor']}</li>
                        {/if}
                        {/foreach}
                    </ul>
                </div>
                {else}
                <div class="col-md-12 col-xs-12 col-sm-12"><p>Frete</p></div>
                <div class="col-md-5 lista-frete">
                    <ul>
                        {foreach from=$listaDadosEntrega item=entrega}
                        {if $entrega['nome_modulo'] !== 'lcp_entregalenscope'}
                        <li>{$entrega['nome']}: R$ {$entrega['valor']}</li>
                        {/if}
                        {/foreach}
                    </ul>
                </div>
                <div class="col-md-7 atencao-envio">
                    <p>
                        O valor do frete é referente somente à entrega do óculos pronto. O custo do envio da armação para a Lenscope é pago por você na agência dos Correios de sua preferência :)
                    </p>
                </div>
                {/if}

            </div>
        </div>
    </div>
</div>
{/if}
<!-- fim frete todos -->


<!-- inicio orientação tamanho -->
<div class="row tamanho-armacao">


   <div class="banner-dicas col-xs-12 no-xs-padding no-sm-padding {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
            <div class='container'>
                <div class="banner-recomendacao__texto col-xs-12 text-xs-center">
                    <h1>Veja como conseguir um óculos mais fino escolhendo a armação correta. </h1>
                    
                </div>
            </div>
        </div>

        <div class="col-xs-12 abas-dicas">
            <div class="container no-xs-padding">
                <div class="col-xs-12 no-xs-padding">
                    
                    <ul class="nav nav-inline my-2 text-xs-center" role="tablist">
                        <li class="nav-item ativo nav-dica-1 text-xs-center">
                            <a class="nav-link" data-link-action="show-login-form" data-toggle="tab" role="tab" aria-controls="checkout-login-form">
                              <h5>DICA 1</h5>
                            </a>
                        </li>
                        <li class="nav-item nav-dica-2 text-xs-center">
                            <a class="nav-link" data-link-action="show-login-form" data-toggle="tab" role="tab" aria-controls="checkout-login-form">
                              <h5>DICA 2</h5>
                            </a>
                        </li>
                        <li class="nav-item nav-dica-3 text-xs-center">
                            <a class="nav-link" data-link-action="show-login-form" data-toggle="tab" role="tab" aria-controls="checkout-login-form">
                              <h5>DICA 3</h5>
                            </a>
                        </li>
                        <li class="nav-item nav-dica-4 text-xs-center">
                            <a class="nav-link" data-link-action="show-login-form" data-toggle="tab" role="tab" aria-controls="checkout-login-form">
                              <h5>DICA 4</h5>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="col-xs-12 dicas_geral">
            <div class="container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                <div class="col-xs-12 dica dica_1 ativo text-xs-center">
                    <h2>Dê preferências para armações menores</h2>
                    <!-- texto para hipermetropia -->
                    {if $miopia_hiper == 'hipermetropia'}
                      <p>Quanto menor for o tamanho do aro da armação, mais leve será a lente.</p>
                    {/if}
                     {if $miopia_hiper == 'miopia'}
                      <p>Quanto menor for o tamanho da sua armação, mais fina será a borda da lente. Veja os tamanhos recomendados para o seu grau</p>
                    {/if}
                    <img class="dica-armacoes-img dica-armacoes-img1" src="{$consultor_img}/icones-status/armacao-recebida.svg" alt="armacao recebida">
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <!-- texto para hipermetropia -->
                                {if $miopia_hiper == 'hipermetropia'}
                                  <h3>Até {$ta+3}mm</h3>
                                  <p>Para o seu grau, o tamanho do aro da armação indicado é de até {$ta+3}mm.</p>
                                {/if}
                                <!-- texto para miopia -->
                                {if $miopia_hiper == 'miopia'}
                                  <h3>Até {$ta}mm</h3>
                                  <p>O tamanho do aro da armação ideal para o seu grau é de até {$ta}mm.</p>
                                {/if}
                            </div>
                        </div>
                    </div>

                    <div class="row veja-encontrar">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-md-12 col-sm-12 col-xs-12 encontrar">
                                        
                                <div class="col-md-6 col-sm-6 col-xs-12 text-md-center text-sm-center text-xs-center aro-div">
                                    <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                        <p>Você encontra a medida do aro da sua armação na haste do seu óculos. É o primeiro número antes do símbolo de um quadradinho. Veja um exemplo abaixo:</p>
                                    </div>

                                    <img 
                                        class="img-fluid" 
                                        src="{$consultor_img}/aro-medida.jpg" 
                                        alt="Medida Aro"
                                    >
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 text-md-center text-sm-center text-xs-center aro-div">
                                    <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                      {if $miopia_hiper == 'hipermetropia'}
                                        <p>
                                            Caso você compre a armação em lojas onlines, as medidas são informadas na descrição do produto. Veja um exemplo abaixo, a largura da lente indica o aro.
                                        </p>
                                      {/if}
                                      {if $miopia_hiper == 'miopia'}
                                        <p>
                                            Caso você compre a armação em lojas onlines, as medidas são informadas na descrição do produto. Veja um exemplo abaixo. Note que a largura da lente indica o tamanho do aro.
                                        </p>
                                      {/if}
                                    </div>

                                    <img 
                                        class="img-fluid" 
                                        src="{$consultor_img}/exemplo-ecommerce-aro.jpg" 
                                        alt="Exemplo Aro"
                                    >
                                </div>
                                        
                            </div>
                        </div>
                    </div>

                    <!-- Estrutura apenas para miopia -->
                    {if $miopia_hiper == 'miopia'}
                    <img class="dica-armacoes-img dica-armacoes-img2" src="{$consultor_img}/icones-status/montagem-atrasada.svg" alt="montagem atrasada">
                    
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Até {$ta+3}mm</h3>
                                <p>Você também pode adquirir armações com tamanho de aro de até {$ta+3}mm. No entanto, seu óculos ficará desnecessariamente mais grosso. Por esse motivo, <b>não recomendamos essa opção.</b></p> 
                            </div> 
                        </div>
                    </div>
                    {/if}

                    <img class="dica-armacoes-img dica-armacoes-img3" src="{$consultor_img}/icones-status/cancelado.svg" alt="armacao-recebida">

                    <div  class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo igual-ou-maior">
                                <!-- texto para hipermetropia -->
                                {if $miopia_hiper == 'hipermetropia'}
                                  <h3>Maior que {$ta+4}mm</h3>
                                {/if}
                                <!-- texto para miopia -->
                                {if $miopia_hiper == 'miopia'}
                                  <h3>Igual ou maior que {$ta+4}mm</h3>
                                {/if}
                                <div  class="row alinhamento">
                                    <div class="dica-titulo col-md-6 col-xs-12 text-xs-center text-md-right">
                                      <!-- texto para hipermetropia -->
                                      {if $miopia_hiper == 'hipermetropia'}
                                        <p>Armações de aro igual ou maior que {$ta+4}mm podem <b>comprometer a montagem das lentes para o seu grau, ou tornar as lentes do seu óculos desproporcionalmente mais pesadas.</b> Por esses motivos, evite escolher armações de aro igual ou maior que {$ta+4}mm.</p>
                                      {/if}

                                      <!-- texto para miopia -->
                                      {if $miopia_hiper == 'miopia'}
                                        <p>Armações de aro igual ou maior que {$ta+4}mm podem <b>comprometer a montagem das lentes para o seu grau, ou tornar as bordas do seus óculos desproporcionalmente mais grossa.</b> Por esses motivos, evite escolher armações de aro igual ou maior que {$ta+4}mm.</p>
                                      {/if}
                                    </div>
                               
                                    <div class="img-dias-armacao col-md-6 col-xs-12 text-xs-left">
                                        <img class="img-fluid" src="{$consultor_img}/modal-recorte-de-lente.jpg" alt="Meioaro">
                                        <p id="observacao">*Imagem ilustrativa na qual o tamanho do aro impossibilita a montagem das lentes Tokai 1.76 na armação. A DNP sempre indicará horizontalmente a posição do centro da lente em relação a armação</p>
                                    </div>
                                </div>
                            </div>     
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 dica dica_2 text-xs-center">
                    <h2>Dê preferências para armações de aro fechado</h2>
                    <p>Existem 3 tipos de armações em relação ao tipo de aro: Armações de aro fechado, armações de meio aro e armações de três peças, também conhecidas como Balgriff.</p>

                    <img class="dica-armacoes-img dica-armacoes-img1" src="{$consultor_img}/icones-status/armacao-recebida.svg" alt="armacao recebida">
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Aro fechado</h3>
                                
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/aro-fechado.jpg" alt="Aro Fechado">
                                </div>

                                <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                    <p>Armações de aro fechado contornam toda a borda da lente, disfarçando a espessura do óculos. Quanto maior é a espessura do aro da armação, melhor será o resultado estético do seu óculos. Veja alguns exemplos abaixo:</p>
                                </div>

                                <div class='col-xs-12 col-sm-6 col-md-6 text-xs-center dica-aro'>
                                    <img class="img-fluid" src="{$consultor_img}/resultado-aro.jpg" alt="Resultado Aro">
                                </div>

                                <div class='col-xs-12 col-sm-6 col-md-6 text-xs-center dica-aro'>
                                    <img class="img-fluid" src="{$consultor_img}/resultado-aro2.jpg" alt="Eesultado Aro 2">
                                </div>

                                <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                    <p>Por isso, dê preferência para armações de aro fechado e espesso.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <img class="dica-armacoes-img dica-armacoes-img2" src="{$consultor_img}/icones-status/montagem-atrasada.svg" alt="montagem atrasada">
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Meio aro (fio de nylon)</h3>
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/meioaro.jpg" alt="Meioaro">
                                </div>

                                <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                    <p>
                                        As armações de meio aro deixam a borda do óculos evidente, uma vez que elas não contornam toda a lente. Quando as lentes são mais grossas, pode ficar ainda mais evidente que você tem um grau alto. Por esse motivo, armações de meio aro não são as mais indicadas para graus elevados.
                                    </p>
                                </div>
                            </div> 
                        </div>
                    </div>

                    <img class="dica-armacoes-img dica-armacoes-img3" src="{$consultor_img}/icones-status/cancelado.svg" alt="armacao-recebida">
                    <div class="row veja-encontrar">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Três peças (ballgriff)</h3>
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/3-pecas.jpg" alt="3 peças">
                                </div>

                                <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                    <p>
                                        As armações de três peças, também conhecidas como Ballgriff, não são compatíveis com as lentes para alto grau. Por isso, evite escolher armações desse modelo
                                    </p>
                                </div>
                            </div> 
                        </div>
                    </div>


                    <img class="dica-armacoes-img dica-armacoes-img3" src="{$consultor_img}/icones-status/cancelado.svg" alt="armacao-recebida">
                    <div  class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Evite armações esportivas (curvadas)</h3>
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/curvada.jpg" alt="curvada">
                                </div>

                                <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                    <p>
                                        Lentes mais finas não são compatíveis com armações curvadas, de curvatura base maior que 4, também conhecidas como armações esportivas.
                                    </p>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>

                <div class="col-xs-12 dica dica_3 text-xs-center">
                    <h2>Observe a posição da armação no seu rosto e nos seus olhos</h2>
                    <p>Além da medida do aro da armação, outras medidas devem ser levadas em conta na hora de escolher a armação como a altura e o tamanho da ponte. Essas medidas também influenciam na espessura final do óculos, mas podem variar de acordo com o modelo da armação, além do formato e medidas do seu rosto.</p>

                    <img class="dica-armacoes-img dica-armacoes-img2" src="{$consultor_img}/icones-status/armacao-recebida.svg" alt="montagem atrasada">
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Pupila próxima ao centro da armação</h3>
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/dnp-centralizada.jpg" alt="Dnp centralizada">
                                </div>

                                <div class='col-xs-12 no-sm-padding no-xs-padding text-xs-center dica-armacoes-texto'>
                                    <p>
                                        Uma dica importante: observe a posição da sua pupila na armação. <b>O mais indicado é que as suas pupilas fiquem posicionadas no centro das lentes.</b>
                                    </p>
                                </div>
                            </div> 
                        </div>
                    </div>

                    <img class="dica-armacoes-img dica-armacoes-img2" src="{$consultor_img}/icones-status/montagem-atrasada.svg" alt="montagem atrasada">
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Pupila próxima à extremidade da armação</h3>
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/dnp-descentralizada.jpg" alt="dnp descentralizada">
                                </div>
                                <div class='col-xs-12 dica-armacoes-texto no-sm-padding no-xs-padding text-xs-center'>
                                    <p>
                                        Caso sua pupila fique localizada próxima à ponte da armação, <b>isso pode fazer com que o óculos fique mais grosso nas laterais das lentes</b>. Isso acontece porque a posição do centro da sua pupila na armação, juntamente com a medida da sua DNP, determinam a centralização do centro óptico da lente. 

                                    </p>
                                </div>
                            </div> 
                        </div>
                    </div>

                    <p>Por isso, na hora de experimentar sua nova armação, não deixe de observar onde sua pupila fica localizada.</p>
                </div>

                <div class="col-xs-12 dica dica_4 text-xs-center">
                    <h2>Evite armações muito baratas</h2>
                    <p>Armações de óculos muito baratas quase sempre se tornam um problema para quem tem alto grau de miopia. Geralmente elas são de plástico extremamente frágeis, não suportando a montagem das lentes.</p>

                    <img class="dica-armacoes-img dica-armacoes-img2" src="{$consultor_img}/icones-status/montagem-atrasada.svg" alt="montagem atrasada">
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Armações baratas</h3>
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/baratas.jpg" alt="baratas">
                                </div>
                                <div class='col-xs-12 col-sm-6 col-md-6 no-sm-padding no-xs-padding text-xs-center text-sm-left text-md-left dica-armacoes-texto'>
                                    <!-- <p>
                                        Geralmente elas são de plástico extremamente frágeis, não suportanto a montagem das lentes.
                                    </p> -->

                                    <p>
                                        Os problemas mais comuns que você pode encontrar quando adquire armações muito baratas são:
                                    </p>

                                    <ul class='dica-armacoes-texto__lista text-xs-left'>
                                        <li>
                                            <b>Quebra do aro durante a montagem das lentes</b>
                                        </li>
                                        <li>
                                            <b>Hastes do óculos frouxas/largas</b>
                                        </li>
                                        <li>
                                            <b>Quebra ou desajuste do apoio nasal</b>
                                        </li>
                                        <li>
                                            <b>Descascamento da cor da armação</b>
                                        </li>
                                        <li>
                                            <b>Hastes tortas</b>
                                        </li>
                                        <li>
                                            <b>Quebra fácil das hastes</b>
                                        </li>
                                    </ul>

                                    <p>Além disso, você pode ter um duplo prejuízo, pois além de perder o dinheiro gasto com a armação, você também pode perder o dinheiro gasto com as lentes.</b></p>
                                </div>

                                <div class='col-xs-12 col-sm-6 col-md-6 no-sm-padding no-xs-padding text-xs-center text-sm-left text-md-left dica-armacoes-texto'>
                                    <p>
                                        Ao comprar uma armação muito barata, as lentes podem ficar comprometidas, porque uma vez que a lente é recortada para ser encaixada em uma armação, você não consegue reaproveitá-la para outra armação de formato e tamanho diferentes. Por isso, evite armações muito baratas que normalmente são encontradas em: 
                                    </p>

                                    <ul class='dica-armacoes-texto__lista text-xs-left'>
                                        <li>
                                            <b>Sites estrangeiros</b>
                                        </li>
                                        <li>
                                            <b>Camelôs</b>
                                        </li>
                                        <li>
                                            <b>Postos de conveniência</b>
                                        </li>
                                        <li>
                                            <b>Farmácias</b>
                                        </li>
                                        <li>
                                            <b>Bancas de Jornal</b>
                                        </li>
                                    </ul>
                                </div>
                            </div> 
                        </div>
                    </div>

                    <img class="dica-armacoes-img dica-armacoes-img2" src="{$consultor_img}/icones-status/armacao-recebida.svg" alt="montagem atrasada">
                    <div class="row dica-armacoes">
                        <div class="col-xs-12 indica-container {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}mobile{/if}">
                            <div class="col-xs-12 text-xs-center dica-armacoes-titulo">
                                <h3>Materiais indicados</h3>
                                <div class='col-xs-12'>
                                    <img class="img-fluid" src="{$consultor_img}/materiais.jpg" alt="materiais">
                                </div>

                                <div class='col-xs-12 no-sm-padding no-xs-padding dica-armacoes-texto'>
                                    <div class='col-xs-12 no-sm-padding no-xs-padding text-xs-center text-sm-left text-md-left dica-armacoes-texto'>
                                        <p>
                                            Na hora de comprar sua armação, certifique-se sobre seu material e, principalmente, sobre a garantia e política de troca de devolução.
                                        </p>

                                        <p>
                                            <b>Separamos uma lista de materiais de armações mais resistentes que você pode ver logo abaixo:</b>
                                        </p>

                                        <div class='col-xs-12 offset-xs-0 col-sm-8 offset-sm-2 col-md-6 offset-md-3'>
                                            <ul class='dica-armacoes-texto__lista text-xs-left'>
                                                <li>
                                                    <b>Acetato (também conhecidas como acetato de celulose)</b>
                                                </li>
                                                <li>
                                                    <b>Titânio</b>
                                                </li>
                                                <li>
                                                    <b>Grilamid ou TR-90</b>
                                                </li>
                                                <li>
                                                    <b>Trilamid</b>
                                                </li>
                                                <li>
                                                    <b>Policarbonato</b>
                                                </li>
                                                <li>
                                                    <b>Metal</b>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>

                {include file="module:lcp_consultor/views/templates/front/_partials/footer_dicas_botoes.tpl"}
                
            </div>
        </div>


    </div>




    <!-- inicio conheça -->
    {if $isMKT}

    {assign var="countmkt" value=$listaMKTAro|@count}
    <div class="row conheca-opcoes">
        <div class="container">
            <div class="conheca text-md-center text-xs-center text-sm-center ">
                <h1>Conheça nossos modelos de armação</h1>
                <p>
                    Temos várias opções de armações de marcas parceiras que você pode comprar junto com as lentes. Mas fique tranquilo, pois você não é obrigado a comprar a armação em nosso site para fazer suas lentes.

                </p>
                <h3>{$nome_paciente}, veja as armações compatíveis com o seu grau</h3>
            </div>
        </div>
        <div class='container-fluid'>
            <div class='row'>

                {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}
                    
                {else}
                    <div class="container">
                {/if}

                <div class="lista-prod-aro col-md-12 col-sm-12 col-xs-12">
                    <div class="row 
                        {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}
                            carousel
                        {/if}
                        " 
                        
                        {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}
                        data-flickity=' { "contain": false, "prevNextButtons": false, "pageDots": true, "wrapAround": true, "adaptiveHeight": true }'
                        {/if}
                    >
                        {foreach from=$listaMKTAro key=i item=product}
                            <div class="text-md-center text-xs-center text-sm-center col-xs-11

                                {if $countmkt == 1}
                                    col-md-4 col-sm-4 offset-sm-0
                                    {if $i == 0}
                                        offset-md-4 offset-sm-4 
                                    {/if}
                                {/if}

                                {if $countmkt == 2}
                                    col-md-4 col-sm-4 offset-sm-0
                                    {if $i == 0}
                                        offset-md-2 offset-sm-2
                                    {/if}
                                {/if}

                                {if $countmkt == 3 || $countmkt > 3}
                                    col-md-4 col-sm-4
                                {/if}


                                {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}
                                    carousel-cell 
                                {/if}
                            ">
                                <div class="produto-item col-md-12 col-sm-12 col-xs-12">
                                    <p class="img-p">
                                        <a href="{$product['link_product']}">
                                            <img 
                                            class="img-fluid" 
                                            src="http://{$product['img_cover']}" 
                                            alt="{$product['name']}"
                                            >
                                        </a>
                                    </p>
                                    <p class="titulo-p">{$product['name']}</p>
                                    <p class="aro-p">Aro {$product['aro']}</p>
                                    <p class="detalhes-p"><a href="{$product['link_product']}">VER DETALHES DA ARMAÇÃO</a></p>
                                </div>
                            </div>

                            {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}
                    
                            {else}
                                {if $i == 2}
                                    {break}
                                {/if}
                            {/if}
                            

                        {/foreach}
                    </div>
                </div>


                {if Context::getContext()->getDevice() != 1 && !Context::getContext()->isTablet()}
                    
                {else}
                    </div>
                {/if}

                <div class="vermais col-md-12 col-sm-12 col-xs-12 text-md-center text-xs-center text-sm-center">
                    <a href="{url entity='armacoes'}" class="btn branco-sombreado">VER MAIS</a>
                </div>



            </div>
        </div>
    </div>
{/if}
<!-- fim conheça -->

<!-- inicio btns -->
<div class="row btn-acoes">
 <div class="container">
    <div class="col-md-6 col-sm-6 col-xs-6">
       <a href="{$link_voltar}" class="btn azul-vazado">INSERIR OUTRO GRAU</a>
   </div>
   <div class="col-md-6 col-sm-6 col-xs-6">
       <a href="{url entity='checkout-aviso'}" class="btn azul-escuro float-md-right float-sm-right float-xs-right">COMPRAR LENTES</a>
   </div>
</div>
</div>
<!-- fim btns -->

</div>

{/block}