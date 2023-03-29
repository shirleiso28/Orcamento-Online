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

class D1OrcamentoControllerCore extends FrontController
{
    public $php_self = 'd1-orcamento';

    /**
     * Assign template vars related to page content
     * @see FrontController::initContent()
     */
    public function initContent()
    {
        $this->registerStylesheet('index', '/assets/css/pages/internas-geral/ferramenta-d1/d1-orcamento.css', ['media' => 'all', 'priority' => 1000]);

        $this->registerJavascript('input-mask', '/assets/js/libs/jquery.mask.min.js', ['position' => 'bottom', 'priority' => 10000]);
        
        $this->registerJavascript('ferramenta-d1', '/assets/js/pages/internas-geral/ferramenta-d1/d1-orcamento.js', ['position' => 'bottom', 'priority' => 1000]);
        
        //Verifica se existe sessão, se sim popula as informações 
        /*if(isset($_COOKIE['d1_receita'])){
            $receita = unserialize($_COOKIE['d1_receita']);
            var_dump($receita);
            $esq_esferico = $receita->esq_esferico;
            $dir_esferico = $receita->dir_esferico;
            $esq_cilindrico = $receita->esq_cilindrico;
            $dir_cilindrico = $receita->dir_cilindrico;
            $esq_eixo = $receita->esq_eixo;
            $dir_eixo = $receita->dir_eixo;
            $add = $receita->add;
            $esq_esferico_perto =  $receita->esq_esferico_perto;
            $dir_esferico_perto =  $receita->dir_esferico_perto;
            $cook = true;

        }else{
            $esq_esferico = '';
            $dir_esferico = '';
            $esq_cilindrico = '';
            $dir_cilindrico = '';
            $esq_eixo = '';
            $dir_eixo = '';
            $add = '';
            $esq_esferico_perto = '';
            $dir_esferico_perto = '';

            $cook = false;
            // $esq_tipo_ametropia = '';
            // $dir_tipo_ametropia = '';
        }

        //Assinaturas de variaveis a ser usadas na sessão
        $this->context->smarty->assign(
            array(
                'esq_esferico' => $esq_esferico,
                'dir_esferico' => $dir_esferico,
                'esq_cilindrico' => $esq_cilindrico,
                'dir_cilindrico' => $dir_cilindrico,
                'esq_eixo' => $esq_eixo,
                'dir_eixo' => $dir_eixo,
                'add' => $add,
                'esq_esferico_perto' => $esq_esferico_perto,
                'dir_esferico_perto' => $dir_esferico_perto,
                'cook' => $cook
                )
        );*/

        parent::initContent();

        $this->setTemplate('internas-geral/ferramenta-d1/orcamento.tpl'); 

    }

}