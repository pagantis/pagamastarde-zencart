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

define('MODULE_PAYMENT_PAGAMASTARDE_EOM_TEXT_TITLE', 'Paga a fin de mes');
define('MODULE_PAYMENT_PAGAMASTARDE_EOM_FINANCING','Paga al final de mes');
define('MODULE_PAYMENT_PAGAMASTARDE_EOM_MONTH','mes');
define('MODULE_PAYMENT_PAGAMASTARDE_EOM_MONTHS','meses');
define('MODULE_PAYMENT_PAGAMASTARDE_EOM_FOR','durante');
define('MODULE_PAYMENT_PAGAMASTARDE_EOM_TEXT_DESCRIPTION', '
<strong>Paga+Tarde</strong><br /><br/>
          Paga+Tarde es una plataforma de financiación online. Escoge Paga+Tarde como tu método de pago para permitir el pago aplazado.
          <br /><br/>
<img src="images/icon_popup.gif" border="0">
<a target="_blank" style="text-decoration: underline; font-weight: bold;" href="https://bo.pagamastarde.com/">Login al panel de Paga+Tarde</a>
<br/><br/>
<img src="images/icon_popup.gif" border="0">
<a target="_blank" style="text-decoration: underline; font-weight: bold;" href="http://docs.pagamastarde.com/">Documentación</a>');

define('MODULE_PAYMENT_PAGAMASTARDE_EOM_SHOP_TEXT_TITLE', MODULE_PAYMENT_PAGAMASTARDE_EOM_FINANCING);

?>
