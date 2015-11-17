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

define('MODULE_PAYMENT_PAGAMASTARDE_TEXT_TITLE', 'Paga Más Tarde');
define('MODULE_PAYMENT_PAGAMASTARDE_FINANCING','Financiación');
define('MODULE_PAYMENT_PAGAMASTARDE_MONTH','mes');
define('MODULE_PAYMENT_PAGAMASTARDE_MONTHS','meses');
define('MODULE_PAYMENT_PAGAMASTARDE_FOR','durante');
define('MODULE_PAYMENT_PAGAMASTARDE_TEXT_DESCRIPTION', '
<strong>What is Paga Más Tarde?</strong><br />
          PagaMasTarde is an extra payment option for webshops, that allows customers to pay the products by fractionating payments.<br />
          <br />
          <strong>Increase profits</strong><br />
        By allowing shoppers to pay using financing, you can now sell to customers that are otherwise unable or unwilling to pay today.<br />
<br />
<strong>No risk</strong><br />
If an order is processed via PagaMasTarde, you get paid. 100% secure.
<br/>
<br/>

<img src="images/icon_popup.gif" border="0"> <a target="_blank" style="text-decoration: underline; font-weight: bold;" href="http://pagamastarde.com">Visit Pagamastarde website</a>');


    $inst6 = instAmount(6);
    $inst5 = instAmount(5);
    $inst4 = instAmount(4);
    $inst3 = instAmount(3);
    $inst2 = instAmount(2);
    $widget = 	" <script>function updateAmount(value){document.getElementById('inst_value').innerHTML=value; }
    </script><span id='inst_value'>".$inst6."</span> € /".MODULE_PAYMENT_PAGAMASTARDE_MONTH." ".MODULE_PAYMENT_PAGAMASTARDE_FOR." <select onChange=\"updateAmount(this.value);\">
    <option value='".$inst6."'>6</option><option value='".$inst5."'>5</option>
    <option value='".$inst4."'>4</option>
    <option value='".$inst3."'>3</option>
    <option value='".$inst2."'>2</option>
    </select> ".MODULE_PAYMENT_PAGAMASTARDE_MONTHS;
      define('MODULE_PAYMENT_PAGAMASTARDE_SHOP_TEXT_TITLE', MODULE_PAYMENT_PAGAMASTARDE_FINANCING .": ".$widget);

// calculate installment price
function instAmount ($num_installments=6) {
  global $customer_id, $order, $sendto, $currency, $pagamastardeOrderGeneratedInConfirmation, $shipping;
  $amount = (float)( $order->info['total']  );
  if ( MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT == 'True' ){
    $result= ($amount) / $num_installments;
  }else{
  $r = 0.25/365; #daily int
  $X = $amount; #total loan
  $aux = 1;  #first inst value
  for ($i=0; $i<=$num_installments-2;$i++) {
    $aux = $aux + pow(1/(1+$r) ,(45+30*$i));
  }
$result= (float)($X/$aux);
}
//add result to template
return round($result,2);
}
?>
