<?php
/**
 * Pagantis payment module for oscommerce
 *
 * @package     Pagantis
 * @author      Epsilon Eridani CB <contact@epsilon-eridani.com>
 * @copyright   Copyright (c) 2014  Pagantis (http://www.pagamastarde.com)
 *
 * @license     Released under the GNU General Public License
 *
 */
 global $customer_id, $order, $sendto, $currency, $pagamastardeOrderGeneratedInConfirmation, $shipping;
 if ( MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT == 'True' ){
   $discount = 1;
 }else{
   $discount = 0;
 }
 $widget =   '<div class="PmtSimulator" data-pmt-num-quota="4" data-pmt-style="neutral" data-pmt-type="3" data-pmt-discount="'.$discount.'" data-pmt-amount="'.(float)( $order->info['total']  ).'" data-pmt-expanded="no"></div>
   <script type ="text/javascript" src ="https://cdn.pagamastarde.com/pmt-simulator/3/js/pmt-simulator.min.js">
   </script>
   <script>
    jQuery( document ).ready(function() {
      pmtSimulator.simulator_app.load_jquery();
   });
   jQuery( document ).ajaxComplete(function() {
     pmtSimulator.simulator_app.updateSimulators();
   });
   </script>';
define('MODULE_PAYMENT_PAGAMASTARDE_TEXT_TITLE', 'Paga Más Tarde');
define('MODULE_PAYMENT_PAGAMASTARDE_FINANCING','Financiación con Paga+Tarde');
define('MODULE_PAYMENT_PAGAMASTARDE_MONTH','mes');
define('MODULE_PAYMENT_PAGAMASTARDE_MONTHS','meses');
define('MODULE_PAYMENT_PAGAMASTARDE_FOR','durante');
define('MODULE_PAYMENT_PAGAMASTARDE_TEXT_DESCRIPTION', '
<strong>Paga+Tarde</strong><br /><br/>
          Paga+Tarde es una plataforma de financiación online. Escoge Paga+Tarde como tu método de pago para permitir el pago a plazos.
          <br /><br/>
<img src="images/icon_popup.gif" border="0">
<a target="_blank" style="text-decoration: underline; font-weight: bold;" href="https://bo.pagamastarde.com/">Login al panel de Paga+Tarde</a>
<br/><br/>
<img src="images/icon_popup.gif" border="0">
<a target="_blank" style="text-decoration: underline; font-weight: bold;" href="http://docs.pagamastarde.com/">Documentación</a>');

define('MODULE_PAYMENT_PAGAMASTARDE_SHOP_TEXT_TITLE', MODULE_PAYMENT_PAGAMASTARDE_FINANCING .": ".$widget);

?>
