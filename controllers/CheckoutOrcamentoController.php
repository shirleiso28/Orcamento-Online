<?php
/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
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
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */

class CheckoutOrcamentoControllerCore extends FrontController
{
    public $php_self = 'checkout-orcamento';

    public $lenteDir;
    public $lenteEsq;
    public $Receita;
    public $lente = NULL;
    public $armacao = NULL;

    //Variavel de controle para saber se miopia ou hipermetropia (será usada na view para mudar texto de dica, conforme grau do cliente)
    public $miopiaHiper;

    public $auxLente;
    public $auxTotal;

    public function init(){
        parent::init();
        if(Tools::getValue('lente')){
            $this->lente = Tools::getValue('lente');
        }
        if(Tools::getValue('armacao')){
            $this->armacao = Tools::getValue('armacao');
        }
    }


    /**
     * Assign template vars related to page content
     * @see FrontController::initContent()
     */
    public function initContent()
    {
        $this->registerStylesheet('checkout-orcamento', '/assets/css/pages/checkout-orcamento.css', ['media' => 'all', 'priority' => 1000]);
        $this->registerStylesheet('checkout-orcamento-dicas', '/assets/css/pages/checkout-orcamento-dicas.css', ['media' => 'all', 'priority' => 1001]);
        
        $this->registerJavascript(
           'checkout-orcamentop-js',
           '/assets/js/pages/checkout-orcamento-js.js',
           [
             'priority' => 1044,
             'attribute' => 'async',
             'position' => 'bottom'
           ]
        );

        $this->registerJavascript(
           'checkout-orcamentop-dicas',
           '/assets/js/pages/checkout-orcamento-dicas.js',
           [
             'priority' => 1045,
             'attribute' => 'async',
             'position' => 'bottom'
           ]
        );
        
        $this->context->smarty->assign('consultor_img', _MODULE_DIR_.'lcp_consultor/views/img/');

        parent::initContent();
        $this->setTemplate('catalog/checkout-orcamento');

    }

    public function postProcess(){
        if($this->verificaDadosSessao() && Tools::getValue('submit-prescricao')){
            $error = false;
            $msnError = '';

            
            /* INICIO CRIA A INSTANCIA DA RECEITA PARA SER USADA NO CÓDIGO E SALVA NA SESSÃO */
            $Receita = new stdClass;
            $Receita->nome_paciente = Tools::getValue('nome_paciente');
            $Receita->email_paciente = Tools::getValue('email');
            $Receita->data_cadastro = date('Y-m-d');
            $Receita->esq_esferico = Tools::getValue('esq_esferico');
            $Receita->esq_cilindrico = Tools::getValue('esq_cilindrico');
            $Receita->esq_eixo = Tools::getValue('esq_eixo');
            $Receita->esq_dnp = Tools::getValue('esq_dnp');
            $Receita->esq_altura = Tools::getValue('esq_altura');
            $Receita->dir_esferico = Tools::getValue('dir_esferico');
            $Receita->dir_cilindrico = Tools::getValue('dir_cilindrico');
            $Receita->dir_eixo = Tools::getValue('dir_eixo');
            $Receita->dir_dnp = Tools::getValue('dir_dnp');
            $Receita->dir_altura = Tools::getValue('dir_altura');
            $Receita->add = Tools::getValue('add');
            $Receita->dp = Tools::getValue('dp');
            $Receita->observacoes = Tools::getValue('observacoes');
            $Receita->ta = '';
            $Receita->colocouDP = FALSE;
            $Receita->nomeLente = '';
            /* FIM CRIA A INSTANCIA */

            $resultEsq = $Receita->dir_esferico + $Receita->dir_cilindrico;
            $resultDir = $Receita->dir_esferico + $Receita->dir_cilindrico;

            if($resultDir >= -20 && $resultEsq >= -20){
                /* INICIO VERIFICA SE A LENTE É PRONTA OU SURFAÇADA */
                $dioptriaOD = $Receita->dir_esferico;
                $dioptriaOE = $Receita->esq_esferico;
                $cilindricoOD = $Receita->dir_cilindrico;
                $cilindricoOE = $Receita->esq_cilindrico;
                $lenteEsq = 'pronta';
                $lenteDir = 'pronta';
                $this->lenteDir = 'pronta';
                $this->lenteEsq = 'pronta';

                if ($dioptriaOE > -2 || $dioptriaOE < -12) {
                  $lenteEsq = 'surfacada';
                  $this->lenteEsq = 'surfacada';
                };
                if ($dioptriaOD > -2 || $dioptriaOD < -12) {
                  $lenteDir = 'surfacada';
                  $this->lenteDir = 'surfacada';
                };
                if ($cilindricoOD < -2) {
                  $lenteDir = 'surfacada';
                  $this->lenteDir = 'surfacada';
                };
                if ($cilindricoOE < -2) {
                  $lenteEsq = 'surfacada';
                  $this->lenteEsq = 'surfacada';
                };
                if ($dioptriaOE < -10  && $cilindricoOE != 0) {
                    $lenteEsq = 'surfacada';
                    $this->lenteEsq = 'surfacada';
                };
                if ($dioptriaOD < -10  && $cilindricoOD != 0) {
                    $lenteDir = 'surfacada';
                    $this->lenteDir = 'surfacada';
                };
                /* FIM SE É PRONTA OU SURFAÇADA */

                /* INICIO LÓGICA QUE SELECIONA O TAMANHO DO ARO E A 'DP' QUANDO INFORMADA */
                // Inicializando variáveis GE (Grau Esférico) e TB (Tamanho de Bloco)
                $GE = 0;
                $TB = 0;
                $GC = 0;
                
                // Em caso de Miopia
                if ($dioptriaOD <= 0 && $dioptriaOE <= 0){
                    $this->miopiaHiper = 'miopia';
                    if (($dioptriaOD + $cilindricoOD)  <= ($dioptriaOE + $cilindricoOE)) {
                       $GE = $dioptriaOD;
                       $GC = $cilindricoOD;                    
                    } else{
                       $GE = $dioptriaOE;
                       $GC = $cilindricoOE;
                    }
                }
                // Em caso de Hipermetropia
                else if ($dioptriaOD > 0 && $dioptriaOE > 0){
                    $this->miopiaHiper = 'hipermetropia';
                    if (($dioptriaOD + $cilindricoOD) >= ($dioptriaOE + $cilindricoOE)) {
                       $GE = $dioptriaOD;
                       $GC = $cilindricoOD;
                    } else {
                       $GE = $dioptriaOE;
                       $GC = $cilindricoOE;
                    }
                // Em caso não previsto
                } else {
                    $error = true;
                    $msnError =  "ATENÇÃO! Miopia e Hipermetropia juntos no mesmo óculos! Não atendemos este caso :(";
                }


                // Caso as lentes sejam ambas Prontas (caso que se aplica somente a Miopia e/ou Astigmatismo)
                if ($lenteEsq == 'pronta' && $lenteDir == 'pronta') {
                    if ( -7.5 <= $GE && $GE <= -2){
                        $TB = 75;
                    } else if (-10 <= $GE && $GE < -7.5) {
                        $TB = 70;
                    } else if (-12 <= $GE && $GE < -10) {
                        $TB = 65;
                    } else {
                        $error = true;
                        /*$msnError = "ATENÇÃO! Dioptria (Miopia e/ou Astigmatismo) não atendida pelas Lentes Prontas, entre em contato conosco!";*/
                        Tools::redirect($this->context->link->getPageLink('over-range',true));
                    } 
                }

                // Caso as lentes sejam ambas Surfaçadas (se aplica a Miopia e Hipermetropia e/ou Astigmatismo)
                else {
                    // Em caso de Miopia
                    if ($GE <= 0) {
                        // Caso Astigmatismo seja menor ou igual a 2
                        //if ($cilindricoOD >= -2) {//bug corrigdo 2019-04-15 JB
                        if ($GC >= -2) {
                            if ( -7.5 <= $GE && $GE <= 0) {
                                $TB = 75;
                            } else if (-10 <= $GE && $GE < -7.5) {
                                $TB = 70;
                            } else if ($GE < -10) {
                                if (-17 <= ($GE + $GC)) {
                                    $TB = 65;
                                } else if (-20 <= ($GE + $GC) && ($GE + $GC) < -17) {
                                    $error = true;
                                    /*$msnError = "ATENÇÃO! Dioptria (Miopia e/ou Astigmatismo) pode não ser atendida pelas Lentes Personalizadas, entre em contato conosco!";*/
                                    Tools::redirect($this->context->link->getPageLink('over-range',true));
                                    
                                }                           
                            } else {
                                $error = true;
                                /*$msnError =  "ATENÇÃO! Dioptria (Miopia e/ou Astigmatismo) não atendida pelas Lentes Personalizadas, entre em contato conosco!";*/
                                Tools::redirect($this->context->link->getPageLink('over-range',true));
                            }
                        // Caso Astigmatismo seja maior do que 2
                        } else {
                            if (-9.5 <= ($GE + $GC) && ($GE + $GC) <= 0) {
                                $TB = 75;
                            } else if (-12 <= ($GE + $GC) && ($GE + $GC) < -9.5) {
                                $TB = 70;
                            } else if (-17 <= ($GE + $GC) && ($GE + $GC) < -12) {
                                $TB = 65;
                            } else if (-20 <= ($GE + $GC) && ($GE + $GC) < -17) {
                                $error = true;
                                /*$msnError = "ATENÇÃO! Dioptria (Miopia e Astigmatismo alto) pode não ser atendida pelas Lentes Personalizadas, entre em contato conosco!";*/
                                Tools::redirect($this->context->link->getPageLink('over-range',true));
                                
                            } else {
                                $error = true;
                                /*$msnError = "ATENÇÃO! Dioptria (Miopia e Astigmatismo alto) não atendida pelas Lentes Personalizadas, entre em contato conosco!";*/
                                Tools::redirect($this->context->link->getPageLink('over-range',true));
                            }
                        }
                    // Em caso de Hipermetropia
                    } else {
                        if ($GE <= 3){
                            $TB = 75;
                        }
                        else if (3 < $GE && $GE <= 5){
                            $TB = 70;
                        }
                        else if (5 < $GE && $GE <= 10){
                            $TB = 65;
                        }
                        else {
                            $error = true;
                            /*$msnError =  "ATENÇÃO! Dioptria (Hipermetropia e/ou Astigmatismo) não atendida, entre em contato conosco!";*/
                            Tools::redirect($this->context->link->getPageLink('over-range',true));
                        }
                    }
                }

                $TA = 0;
                $D = 0;
                $DP = $Receita->dp;
                $DNPE = $Receita->esq_dnp;
                $DNPD = $Receita->dir_dnp;
                $sex = 'masc';

                if ($DNPD != 0 && $DNPE != 0) {
                    $D =  $DNPE  + $DNPD;
                    //$TA = ($TB - 27 + $D)/2;
                    $TA = floor(($TB - 27 + $D)/2);

                }
                else if ($DP != 0) {
                    $D = $DP;
                    //$TA = ($TB - 27 + $D)/2;
                    $TA = floor(($TB - 27 + $D)/2);
                }
                else {
                    if ($sex == 'masc') {
                        if ($TB == 75) {
                            $TA = 53;
                        }
                        else if ($TB == 70) {
                            $TA = 51;
                        }
                        else if ($TB == 65) {
                            $TA = 48;
                        }
                        else {
                            //echo "ERRO";
                        }
                    }
                    else {
                        if ($TB == 75){
                            $TA = 52;
                        }
                        else if ($TB == 70){
                            $TA = 50;
                        }
                        else if ($TB == 65){
                            $TA = 47;
                        }
                        else {
                            //echo "ERRO";
                        }
                    }
                }

                
                if ($DP != 0 && $DNPE != 0 || $DNPD != 0){
                    $Receita->colocouDP = FALSE;
                }else {
                    $Receita->colocouDP = TRUE;
                }

                $Receita->ta =  $TA;
                $Receita->nomeLente = $this->lente;
                /* FIM LÓGICA QUE SELECIONA O TAMANHO DO ARO E A 'DP' QUANDO INFORMADA */

                /* VERIFICA SE ACONTECEU ALGUM ERRO CASO NÃO OCORRA CONTINUA O FLUXO*/
                
                setcookie('prescricao_receita', serialize($Receita), time()+60*60*24*60, '/');
                
                if($error){
                    Tools::redirect($this->context->link->getPageLink('prescricao',true).'?msn='.urlencode($msnError).'&lente='.$this->lente.($this->armacao?'&armacao='.$this->armacao:''));
                }else{

                    $this->Receita = $Receita; //Adiciona a variavel locaL receita na global com o mesmo nome
                    
                    /*
                        * - Adiciona os produtos no carrinho
                        * - Calcula o frete se informado
                        * - Grava na instacia de receita e o TA
                        * - Selecina as armações da div do marketplace 
                        * - cria a variavel com o nome da lente e o valor
                    */

                    $this->addProductCart();
                    $this->calculaFrete();
                    $this->gravaSessaoReceita();
                    $this->getListaMarketplaceAro();
                    $this->addVariaveis();
                    $this->getParcelasProduto('tokai', $this->auxTotal);
                    
                }

            }else{
                //erro redireciona para over-range
                Tools::redirect($this->context->link->getPageLink('over-range', 1));
            }
        }else{
            //erro redireciona para prescricao novamente
            Tools::redirect($this->context->link->getPageLink('prescricao',1).'?lente='.$this->lente.($this->armacao?'&armacao='.$this->armacao:''));
        }
    }

    public function addVariaveis(){
        if($this->lente=='foto'){
            $this->auxLente = 'Lentes Tokai 1.76 Transitions';
        }elseif($this->lente=='tokai_cinza'){
            $this->auxLente = 'Lente Tokai 1.76 Shades';
        }elseif($this->lente=='tokai_cinza_gradiente'){
            $this->auxLente = 'Lente Tokai 1.76 Shades';
        }elseif($this->lente=='tokai_marrom'){
            $this->auxLente = 'Lente Tokai 1.76 Shades';  
        }elseif($this->lente=='tokai_marrom_gradiente'){
            $this->auxLente = 'Lente Tokai 1.76 Shades';    
        }elseif($this->lente=='tokai_verde'){
            $this->auxLente = 'Lente Tokai 1.76 Shades';  
        }elseif($this->lente=='tokai_verde_gradiente'){
            $this->auxLente = 'Lente Tokai 1.76 Shades';    
        }else{    
            $this->auxLente = 'Lentes Tokai 1.76';   
        }

        $this->auxTotal = Tools::getTotalPriceByTipo('tokai');

        $this->context->smarty->assign(
            array(
                'nome_lente' => $this->auxLente,
                'total_tokai' => $this->auxTotal,
                'total_tokai_real' => number_format($this->auxTotal,2,',','.'),
                'total_parcelas' => number_format(($this->auxTotal/6),2,',','.'),
                'nome_paciente' => $this->Receita->nome_paciente,
                'ta' => $this->Receita->ta,
                'lente' => $this->lente,
                'armacao' => $this->armacao,
                'link_voltar'  => $this->context->link->getPageLink('prescricao',1).'?lente='.$this->lente.($this->armacao?'&armacao='.$this->armacao:''),
                'miopia_hiper' => $this->miopiaHiper
            )
        );
    }

    public function gravaSessaoReceita(){
        //grava na sessao as informações da receita
        $receitaSerelizada = serialize($this->Receita);
        setcookie('prescricao_cliente', $receitaSerelizada, time()+60*60*24*30, '/');   
    }

    public function calculaFrete(){
        $isCep = FALSE;
        $listaDadosEntrega = array();
        if(Tools::getValue('cep') && Tools::getValue('simula_frete')){
            $isCep = TRUE;
            $carrier_lista = Carrier::getCarriers($this->context->language->id, 1, false, false, null, ALL_CARRIERS
            );
            foreach ($carrier_lista as $carrier) {
                $module_name = $carrier['external_module_name'];
                $nomeEntrega = $carrier['name'];
                $module = Module::getInstanceByName($module_name);
                if (Validate::isLoadedObject($module)) {
                    $module->id_carrier = $carrier['id_carrier'];

                    $moduleValue = $module->getOrderShippingCost($this->context->cart,0);
                    if($moduleValue !== false){
                        
                        $listaDadosEntrega[] = array('nome'=> $nomeEntrega, 'valor'=>number_format($moduleValue, 2, ',','.'), 'nome_modulo'=>$module_name);
                    }
                    
                }
            }

        }

        $this->context->smarty->assign(
            array(
                'isCep' => $isCep,
                'listaDadosEntrega'=> $listaDadosEntrega
            )
        );
    }

    public function getParcelasProduto($tipoProduto, $totalProduto){
        $parcelas = Tools::getParcelasProduto($tipoProduto, $totalProduto);
        for ($i=0; $i < count($parcelas) ; $i++) {
            $parcelas[$i]['total_parcela'] = number_format($parcelas[$i]['total_parcela'], 2, ',','.');
            $parcelas[$i]['total_com_juros'] = number_format($parcelas[$i]['total_com_juros'], 2, ',','.');
        }
        $this->context->smarty->assign(
            array(
                'parcelas' => $parcelas
            )
        );
    }

    public function addProductCart(){
        /* Adiciona os produtos no carrinho */
        $CartController = new CartController();
        $listaCart = array();
        if($this->lenteEsq == $this->lenteDir){
            //adiciona par de produto ao carrinho
            $listaCart[] = $this->selectLenteSKUCarrinho($this->lente, $this->lenteEsq, FALSE);
        }else{
            //adcionoa unidade de produto ao carrinho
            $listaCart[] = $this->selectLenteSKUCarrinho($this->lente, $this->lenteEsq, TRUE);
            $listaCart[] = $this->selectLenteSKUCarrinho($this->lente, $this->lenteDir, TRUE);
        }
        //verifica se tem marketplace para adicionar
        if($this->armacao){
            $listaCart[] = $this->armacao;
        }

        $CartController->addCartCustom($listaCart);
    }

    /**
     * Retorna o sku da lente selecionada
     * @param String $LenteCodigo
     * @param String $tipo (pronta | surfacada)
     * @param Boolean $isUnidade
     * @return String SKU
     */
    public function selectLenteSKUCarrinho($lenteCodigo, $tipo, $isUnidade){

        if($this->lente=='foto'){
            //no caso da transitionos não tem diferenciação de par ou unidade
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_S_TTR_unid';
                }else{
                    $sku = 'VS_76_S_TTR';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_S_TTR_unid';
                }else{
                    $sku = 'VS_76_S_TTR';
                }
            }
        }elseif($this->lente=='tokai_cinza'){
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_S_C_FULL_unid';
                }else{
                    $sku = 'VS_76_P_C_FULL';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_P_C_FULL_unid';
                }else{
                    $sku = 'VS_76_S_C_FULL';
                }
            }
        }elseif($this->lente=='tokai_cinza_gradiente'){
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_S_C_DGD_unid';
                }else{
                    $sku = 'VS_76_P_C_DGD_unid';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_P_C_DGD';
                }else{
                    $sku = 'VS_76_S_C_DGD';
                }
            }
        }elseif($this->lente=='tokai_verde'){
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_S_V_FULL_unid';
                }else{
                    $sku = 'VS_76_P_V_FULL';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_P_V_FULL_unid';
                }else{
                    $sku = 'VS_76_S_V_FULL';
                }
            }
        }elseif($this->lente=='tokai_verde_gradiente'){
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_S_V_DGD_unid';
                }else{
                    $sku = 'VS_76_P_V_DGD_unid';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_P_V_DGD';
                }else{
                    $sku = 'VS_76_S_V_DGD';
                }
            }
        }elseif($this->lente=='tokai_marrom'){
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_P_M_FULL_unid';
                }else{
                    $sku = 'VS_76_P_M_FULL';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_S_M_FULL_unid';
                }else{
                    $sku = 'VS_76_S_M_FULL';
                }
            }   
        }elseif($this->lente=='tokai_marrom_gradiente'){
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_P_M_DGD_unid';
                }else{
                    $sku = 'VS_76_P_M_DGD';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_S_M_DGD_unid';
                }else{
                    $sku = 'VS_76_S_M_DGD';
                }
            }    
        }else{    
            if($tipo=='pronta'){
                if($isUnidade){
                    $sku = 'VS_76_P_unid';
                }else{
                    $sku = 'VS_76_P';
                }
            }
            if($tipo=='surfacada'){
                if($isUnidade){
                    $sku = 'VS_76_S_unid';
                }else{
                    $sku = 'VS_76_S';
                }
            }   
        }

        return($sku);
    }

    public function getListaMarketplaceAro(){
        $aro = $this->Receita->ta.'mm';
        $Product = new Product();
        $idLang = $this->context->language->id;
        $listaP = $Product->getByFeatureValue($idLang, $aro, 8);

        $listaMKTAro = array();
        $isMKT = FALSE;
        foreach ($listaP as $produto) {
            $isMKT = TRUE;
            $Prod = new Product($produto['id_product']);
            $image = $Prod->getCover($Prod->id);
            $link = new Link;
            $img_cover = $link->getImageLink($Prod->link_rewrite[$idLang], (int)$image['id_image'], 'medium_default');
            $produto = array(
                'id_product' => $produto['id_product'],
                'name' => $produto['name'],
                'link_product' => $Prod->getLink(),
                'img_cover' => $img_cover,
                'aro' => $aro
            );
            $listaMKTAro[] = $produto;
        }
        
        $this->context->smarty->assign(
            array(
                'listaMKTAro'=>     $listaMKTAro,
                'isMKT'=>           $isMKT
                )
        );
    }

    /* VERIFICA SE OS DADOS NECESSÁRIOS ESTÃO NA SESSÃO */
    public function verificaDadosSessao(){
        //verifica se o tipo de lente está selecionoado
        return TRUE;
    }

}
