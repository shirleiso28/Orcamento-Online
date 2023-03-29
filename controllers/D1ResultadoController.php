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

class D1ResultadoControllerCore extends FrontController
{
    public $php_self = 'd1-resultado';

    public $resultado = '';

    public $preco = 189;

    /**
     * Assign template vars related to page content
     * @see FrontController::initContent()
     */
    public function initContent()
    {
        $this->registerStylesheet('index', '/assets/css/pages/internas-geral/ferramenta-d1/d1-resultado.css', ['media' => 'all', 'priority' => 1000]);
        $this->registerJavascript('ferramenta-d1', '/assets/js/pages/internas-geral/ferramenta-d1/d1-resultado.js', ['position' => 'bottom', 'priority' => 1000]);
        
        parent::initContent();


        /*$this->setTemplate('internas-geral/ferramenta-d1/'.$this->resultado.'.tpl');*/
        $this->setTemplate('internas-geral/ferramenta-d1/resultado-tokai.tpl');

        $preco_tres =  number_format( $this->preco/3 , 2, ',','.');
        $this->context->smarty->assign(
            array(
                'preco' => number_format( $this->preco , 2, ',','.'),
                'preco_tres' => $preco_tres
            )
        );

        $parcelas = Tools::getParcelasProduto('lenscope', $this->preco);

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

    public function postProcess(){
        if($this->verificaDadosSessao() && Tools::getValue('resultado')){
            $error = false;
            $msnError = '';

            /* INICIO CRIA A INSTANCIA DA RECEITA PARA SER USADA NO CÓDIGO E SALVA NA SESSÃO */
            $Receita = new stdClass; //stdClass é uma classe vazia predefinida do php, que serve para se criar um objeto vazio e ir incorporando propriedades
            $Receita->nome_paciente = Tools::getValue('nome');
            $Receita->email_paciente = Tools::getValue('email');
            $Receita->celular_paciente = Tools::getValue('celular');
            $Receita->cep_paciente = Tools::getValue('cep');
            $Receita->data_cadastro = date('Y-m-d');
            $Receita->esq_esferico = Tools::getValue('esq_esferico');
            $Receita->esq_cilindrico = Tools::getValue('esq_cilindrico');
            $Receita->esq_eixo = Tools::getValue('esq_eixo');
            $Receita->dir_esferico = Tools::getValue('dir_esferico');
            $Receita->dir_cilindrico = Tools::getValue('dir_cilindrico');
            $Receita->dir_eixo = Tools::getValue('dir_eixo');
            $Receita->add = Tools::getValue('add');
            $Receita->esq_esferico_perto = Tools::getValue('esq_esferico_perto');
            $Receita->dir_esferico_perto = Tools::getValue('dir_esferico_perto');
            $Receita->resultado = '';

            /* FIM CRIA A INSTANCIA */

            $resultEsq = $Receita->dir_esferico + $Receita->dir_cilindrico;
            $resultDir = $Receita->dir_esferico + $Receita->dir_cilindrico;



            

            /*Caso cilindrico seja maior que 4, respeitando a grade de progress, vai para pag de overrange.*/

            /*RESULTADO LENSCOPE*/
            /*RESULTADO TOKAI*/

        /*OVERRANGE*/
            

            
        /*FIM OVERRANGE*/

            

            /*FORA DA GRADE*/
            //Soma acima de 25 vai para fora da grade.
            if($resultDir < -25 || $resultEsq < -25){

                $Receita->resultado = 'resultado-fora-da-grade';

            }else{
                
                //Soma do esférico com cilindrico, de 17.25 até 25 entra na página de overrange
                if(($resultDir >= 17.25 && $resultDir <= 25) || ($resultDir <= -17.25 && $resultDir >= -25) || ($resultEsq >= 17.25 && $resultEsq <= 25) || ($resultEsq <= -17.25 && $resultEsq >= -25)){

                    $Receita->resultado = 'resultado-overrange';

                }else{

                    //Até 4 graus de esférico e passar de 2 de cilíndrico e não tiver add: vai para página de overrange
                    if((($Receita->dir_esferico >= -4 && $Receita->dir_esferico <= 4) && $Receita->dir_cilindrico < -2 && $Receita->add='' && $Receita->dir_esferico_perto = '')||($Receita->esq_esferico >= -4 && $Receita->esq_esferico <= 4) && $Receita->esq_cilindrico < -2 && $Receita->add='' && $Receita->esq_esferico_perto=''){

                        $Receita->resultado = 'resultado-overrange';

                    }else{

                        //Até 4 graus, mais add até 3 e até 4 de cilindrico  - calcula e mostra resultado
                        if ((($Receita->dir_esferico >= -4 && $Receita->dir_esferico <= 4) && ($Receita->dir_cilindrico >= -4) && ($Receita->add <= 3 || ($Receita->dir_esferico_perto >= -3 && $Receita->dir_esferico_perto <= 3))) || (($Receita->esq_esferico >= -4 && $Receita->esq_esferico <= 4) && ($Receita->esq_cilindrico >= -4) && ($Receita->add <= 3 || ($Receita->esq_esferico_perto >= -3 && $Receita->esq_esferico_perto <= 3)))) {

                                 $Receita->resultado = 'resultado-lenscope';
                                
                        }else{

                            //Caso cilindrico seja maior que 4, respeitando a grade de progress, vai para pag de overrange.
                            if(($Receita->dir_cilindrico < -4 && ($Receita->add <= 3 || ($Receita->dir_esferico_perto >= -3 && $Receita->dir_esferico_perto <= 3))) || ($Receita->esq_cilindrico < -4 && ($Receita->add <= 3 || ($Receita->esq_esferico_perto >= -3 && $Receita->esq_esferico_perto <= 3)))){

                                $Receita->resultado = 'resultado-overrange';
                            
                            }else{
                                 $Receita->resultado = 'resultado-tokai';
                            }

                        }

                    }
                }
            }


        /*MOSTRAR RESULTADO*/
           
        /*FIM MOSTRAR RESULTADO*/
            $this->resultado = $Receita->resultado;

            setcookie('d1_receita', serialize($Receita), time()+60*60*24*60, '/');
            $this->context->smarty->assign(
                array(
                    'email_paciente' =>  $Receita->email_paciente
                )
            );
        }
    }

/*    public function gravaSessaoReceita(){
        //grava na sessao as informações da receita
        $receitaSerelizada = serialize($this->Receita);
        setcookie('d1_receita', $receitaSerelizada, time()+60*60*24*30, '/');   
    }*/

    //calcular frete quando cliente digitar cep para mostrar na tela de resultado
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

    /* VERIFICA SE OS DADOS NECESSÁRIOS ESTÃO NA SESSÃO */
    public function verificaDadosSessao(){
        //verifica se o tipo de lente está selecionoado
        return TRUE;
    }
   

}