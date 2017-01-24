<?php
/**
* Paga+Tarde method class
*
* @package paymentMethod
* @copyright Copyright 2016-2017 Paga+Tarde Development Team
* @copyright Paga+Tarde
* @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
* @version $Id: Author: Albert Fatsini  mon dic 19 17:20:52 CET 2016
*/

/**
* Paga+Tarde payment method class
*/

define('TABLE_PAGAMASTARDE', 'pagamastarde');


class pagamastarde extends base {
  /**
  * $code determines the internal 'code' name used to designate "this" payment module
  *
  * @var string
  */
  var $code;
  /**
  * $title is the displayed name for this payment method
  *
  * @var string
  */
  var $title;
  /**
  * $description is a soft name for this payment method
  *
  * @var string
  */
  var $description;
  /**
  * $enabled determines whether this module shows or not... in catalog.
  *
  * @var boolean
  */
  var $enabled;

  /**
  * vars
  */
  var $auth_code;
  var $transaction_id;
  var $order_status;


  /**
  * Constructor
  */
  function __construct() {
    global $order;

    $this->code = 'pagamastarde';
    if (strpos($_SERVER[REQUEST_URI], "checkout_payment") <= 0) {
      $this->title = MODULE_PAYMENT_PAGAMASTARDE_TEXT_ADMIN_TITLE; // Payment module title in Admin
    } else {
      $this->title = MODULE_PAYMENT_PAGAMASTARDE_TEXT_CATALOG_TITLE; // Payment module title in Catalog
    }
    $this->description = MODULE_PAYMENT_PAGAMASTARDE_TEXT_DESCRIPTION;
    $this->enabled = ((MODULE_PAYMENT_PAGAMASTARDE_STATUS == 'True') ? true : false);
    $this->sort_order = MODULE_PAYMENT_PAGAMASTARDE_SORT_ORDER;

    if ((int)MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID > 0) {
      $this->order_status = MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID;
    }
    if (is_object($order)) $this->update_status();

    $this->form_action_url = 'https://pmt.pagantis.com/v1/installments';
    $this->version = '2.2';
    }

    // class methods
    /**
    * Calculate zone matches and flag settings to determine whether this module should display to customers or not
    */
    function update_status() {
      global $order, $db;

      if ($this->enabled && (int)MODULE_PAYMENT_PAGAMASTARDE_ZONE > 0 && isset($order->billing['country']['id'])) {
        $check_flag = false;
        $check = $db->Execute("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_PAGAMASTARDE_ZONE . "' and zone_country_id = '" . (int)$order->billing['country']['id'] . "' order by zone_id");
        while (!$check->EOF) {
          if ($check->fields['zone_id'] < 1) {
            $check_flag = true;
            break;
          } elseif ($check->fields['zone_id'] == $order->billing['zone_id']) {
            $check_flag = true;
            break;
          }
          $check->MoveNext();
        }

        if ($check_flag == false) {
          $this->enabled = false;
        }
      }

      // other status checks?
      if ($this->enabled) {
        // other checks here
      }
    }
    /**
    * JS validation which does error-checking of data-entry if this module is selected for use
    * (Number, Owner Lengths)
    *
    * @return string
    */
    function javascript_validation() {
      return false;
    }
    /**
    * Display Credit Card Information Submission Fields on the Checkout Payment Page
    *
    * @return array
    */
    function selection() {
      return array('id' => $this->code,
      'module' => $this->title);
    }
    /**
    * Evaluates the Credit Card Type for acceptance and the validity of the Credit Card Number & Expiration Date
    *
    */
    function pre_confirmation_check() {
      return false;
    }
    /**
    * Display Credit Card Information on the Checkout Confirmation Page
    *
    * @return array
    */
    function confirmation() {
      return false;
    }
    /**
    * Build the data and actions to process when the "Submit" button is pressed on the order-confirmation screen.
    * This sends the data to the payment gateway for processing.
    * (These are hidden fields on the checkout confirmation page)
    *
    * @return string
    */
    function process_button() {
      global $order, $db;
      $this->order_id = md5(serialize($order->products) .''. serialize($order->customer) .''. serialize($order->delivery));
      $_SESSION['order_id'] = $this->order_id;
      $sql = sprintf("insert into " . TABLE_PAGAMASTARDE . " (order_id) values ('%s')", $this->order_id);
      $db->Execute($sql);
      $base_url = dirname(  sprintf(    "%s://%s%s",
      isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http',
      $_SERVER['SERVER_NAME'],
      $_SERVER['REQUEST_URI']));
      $callback_url = $base_url . '/ext/modules/payment/pagamastarde/callback.php';
      $pagamastarde_ok_url = htmlspecialchars_decode(zen_href_link(FILENAME_CHECKOUT_PROCESS, 'action=confirm', 'SSL', true, false));
      $pagamastarde_nok_url = trim( zen_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL', false));
      $cancelled_url = trim( zen_href_link(FILENAME_CHECKOUT_PROCESS, '', 'SSL', false));
      $amount = number_format($order->info['total'] * 100, 0, '', '');
      $currency = $_SESSION['currency'];
      $currency = 'EUR';
      if (MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT == 'False'){
        $discount = 'false';
      }else{
        $discount = 'true';
      }
      if (MODULE_PAYMENT_PAGAMASTARDE_TESTMODE == 'Test'){
        $secret_key = MODULE_PAYMENT_PAGAMASTARDE_TSK;
        $public_key = MODULE_PAYMENT_PAGAMASTARDE_TK;
      } else {
        $secret_key = MODULE_PAYMENT_PAGAMASTARDE_PSK;
        $public_key = MODULE_PAYMENT_PAGAMASTARDE_PK;
      }
      $message = $secret_key.
      $public_key.
      $this->order_id.
      $amount.
      $currency.
      $pagamastarde_ok_url.
      $pagamastarde_nok_url.
      $callback_url.
      $discount.
      $cancelled_url;
      $signature = hash('sha512', $message);

      // extra parameters for logged users
      $sign_up = '';
      $dob = '';
      $order_total = 0;
      $order_count = 0;
      if (trim($_SESSION['customer_id']) != '')
      {
        $sql = sprintf("SELECT *
                        FROM %s
                        JOIN %s ON customers_info.customers_info_id = customers.customers_id
                        Where  customers.customers_id = %d",
                        TABLE_CUSTOMERS, TABLE_CUSTOMERS_INFO, $_SESSION['customer_id']);
        $check = $db->Execute($sql);
        while (!$check->EOF) {
          $sign_up = substr($check->fields['customers_info_date_account_created'],0,10);
          $dob = substr($check->fields['customers_dob'],0,10);
          $check->MoveNext();
        }

         $sql = sprintf("select * from %s join %s on orders_status.orders_status_id = orders.orders_status
                        where customers_id=%d
                        and orders_status.orders_status_name in ('Processing','Delivered')
                         order by orders_id",
         TABLE_ORDERS_STATUS, TABLE_ORDERS, $_SESSION['customer_id']);
         $check = $db->Execute($sql);

         while (!$check->EOF) {
           $order_total += $check->fields['order_total'];
           $order_count += 1;
           $check->MoveNext();
         }
      }

      $submit_data = array(
        'order_id' => $this->order_id,
        'email' => $order->customer['email_address'],
        'full_name' =>$order->customer['firstname'] . ' ' . $order->customer['lastname'],
        'amount' => $amount,
        'currency' => $currency,
        'ok_url' => $pagamastarde_ok_url,
        'nok_url' => $pagamastarde_nok_url,
        'cancelled_url' => $cancelled_url,
        'account_id' => $public_key,
        'signature' => $signature,
        'address[street]' => $order->customer['street_address'],
        'address[city]' => $order->customer['city'],
        'address[province]' =>$order->customer['state'],
        'address[zipcode]' => $order->customer['postcode'],
        'shipping[street]' => $order->delivery['street_address'],
        'shipping[city]' => $order->delivery['city'],
        'shipping[province]' =>$order->delivery['state'],
        'shipping[zipcode]' => $order->delivery['postcode'],
        'callback_url' => $callback_url,
        'discount[full]' => $discount,
        'mobile_phone' => $order->customer['telephone'],
        'metadata[num_orders]' => $order_count,
        'metadata[amount_orders]' => $order_total,
        'dob' => $dob,
        'metadata[member_since]' => $sign_up,
        'metadata[module_version]' => $this->version,
        'metadata[platform]' => 'zencart '.PROJECT_VERSION_MAJOR.'.'.PROJECT_VERSION_MINOR
      );

      //product descirption
      $desciption=[];
      $i=0;
      if (isset($order->info['shipping_method'])){
        $submit_data["items[".$i."][description]"]=$order->info['shipping_method'];
        $submit_data["items[".$i."][quantity]"]=1;
        $submit_data["items[".$i."][amount]"]=number_format($order->info['shipping_cost'], 2, '.', '');
        $desciption[]=$order->info['shipping_method'];
        $i++;
      }

      foreach ($order->products as $product){
        $submit_data["items[".$i."][description]"]=$product['name'];
        $submit_data["items[".$i."][quantity]"]=$product['qty'];
        $submit_data["items[".$i."][amount]"]=number_format($product['final_price'] * $product['qty'], 2, '.','');
        $desciption[]=$product['name'] . " ( ".$product['qty']." )";
        $i++;
      }
      $submit_data['description'] = implode(",",$desciption);

      $this->notify('NOTIFY_PAYMENT_AUTHNETSIM_PRESUBMIT_HOOK');

      if (MODULE_PAYMENT_PAGAMASTARDE_TESTMODE == 'Test') $submit_data['x_Test_Request'] = 'TRUE';
      $submit_data[zen_session_name()] = zen_session_id();

      $process_button_string = "\n";
      foreach($submit_data as $key => $value) {
        $process_button_string .= zen_draw_hidden_field($key, $value) . "\n";
      }

      return $process_button_string;
    }
    /**
    * Store the CC info to the order and process any results that come back from the payment gateway
    *
    */
    function before_process() {
      global $messageStack, $order, $db;
      $this->order_id = $_SESSION['order_id'];
      $sql = sprintf("select json from %s where order_id='%s' order by id desc limit 1", TABLE_PAGAMASTARDE, $this->order_id);
      $check = $db->Execute($sql);
      if (!$check->EOF) {
        $this->notification = json_decode(stripcslashes($check->fields['json']),true);
      } else {
        return;
      }
      if (MODULE_PAYMENT_PAGAMASTARDE_TESTMODE == 'Test'){
        $secret_key = MODULE_PAYMENT_PAGAMASTARDE_TSK;
        $public_key = MODULE_PAYMENT_PAGAMASTARDE_TK;
      } else {
        $secret_key = MODULE_PAYMENT_PAGAMASTARDE_PSK;
        $public_key = MODULE_PAYMENT_PAGAMASTARDE_PK;
      }

      $notififcation_check = true;
      $signature_check = sha1($secret_key.
      $this->notification['account_id'].
      $this->notification['api_version'].
      $this->notification['event'].
      $this->notification['data']['id']);
      $signature_check_sha512 = hash('sha512',
      $secret_key.
      $this->notification['account_id'].
      $this->notification['api_version'].
      $this->notification['event'].
      $this->notification['data']['id']);
      if ($signature_check != $this->notification['signature'] && $signature_check_sha512 != $this->notification['signature'] ){
        $notififcation_check = false;
      }

      if ($notififcation_check && $this->notification['event'] == 'charge.created'){
        $this->notify('NOTIFY_PAYMENT_AUTHNETSIM_POSTSUBMIT_HOOK', $this->notification);
        $this->auth_code = 'paga+tarde';
        $this->transaction_id = $this->notification['data']['id'];
        return;
      } else {
        $messageStack->add_session('checkout_payment', MODULE_PAYMENT_PAGAMASTARDE_TEXT_DECLINED_MESSAGE, 'error');
        zen_redirect(zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL', true, false));
      }
    }
    /**
    * Post-processing activities
    *
    * @return boolean
    */
    function after_process() {
      global $insert_id, $db, $order, $currencies;
      $this->order_id = $_SESSION['order_id'];
      $sql = sprintf("select json from %s where order_id='%s' order by id desc limit 1", TABLE_PAGAMASTARDE, $this->order_id);
      $check = $db->Execute($sql);
      if (!$check->EOF) {
        $this->notification = json_decode(stripcslashes($check->fields['json']),true);
      } else {
        return;
      }
      if (MODULE_PAYMENT_PAGAMASTARDE_TESTMODE == 'Test'){
        $secret_key = MODULE_PAYMENT_PAGAMASTARDE_TSK;
        $public_key = MODULE_PAYMENT_PAGAMASTARDE_TK;
      } else {
        $secret_key = MODULE_PAYMENT_PAGAMASTARDE_PSK;
        $public_key = MODULE_PAYMENT_PAGAMASTARDE_PK;
      }
      $notififcation_check = true;
      $signature_check = sha1($secret_key.
      $this->notification['account_id'].
      $this->notification['api_version'].
      $this->notification['event'].
      $this->notification['data']['id']);
      $signature_check_sha512 = hash('sha512',
      $secret_key.
      $this->notification['account_id'].
      $this->notification['api_version'].
      $this->notification['event'].
      $this->notification['data']['id']);
      if ($signature_check != $this->notification['signature'] && $signature_check_sha512 != $this->notification['signature'] ){
        $notififcation_check = false;
      }
      $this->notify('NOTIFY_PAYMENT_AUTHNETSIM_POSTPROCESS_HOOK');
      if ($notififcation_check && $this->notification['event'] == 'charge.created'){
        $sql = "insert into " . TABLE_ORDERS_STATUS_HISTORY . " (comments, orders_id, orders_status_id, customer_notified, date_added) values (:orderComments, :orderID, :orderStatus, -1, now() )";
        $sql = $db->bindVars($sql, ':orderComments', 'Paga+tarde.  Transaction ID: ' .$this->notification['data']['id'], 'string');
        $sql = $db->bindVars($sql, ':orderID', $insert_id, 'integer');
        $sql = $db->bindVars($sql, ':orderStatus', $this->order_status, 'integer');
        $db->Execute($sql);
      }
      unset($_SESSION['order_id']);
      return false;
    }
    /**
    * Check to see whether module is installed
    *
    * @return boolean
    */
    function check() {
      global $db;
      if (!isset($this->_check)) {
        $check_query = $db->Execute("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_PAGAMASTARDE_STATUS'");
        $this->_check = $check_query->RecordCount();
      }
      $this->_check_install_pmt_table();
      return $this->_check;
    }
    /**
    * Install the payment module and its configuration settings
    *
    */
    function install() {
      global $db, $messageStack;
      if (defined('MODULE_PAYMENT_PAGAMASTARDE_STATUS')) {
        $messageStack->add_session('Paga+Tarde - Authorize.net protocol module already installed.', 'error');
        zen_redirect(zen_href_link(FILENAME_MODULES, 'set=payment&module=pagamastarde', 'NONSSL'));
        return 'failed';
      }
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Paga+Tarde Module', 'MODULE_PAYMENT_PAGAMASTARDE_STATUS', 'True', 'Do you want to accept Paga+Tarde payments?', '6', '0', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('TEST Public Key', 'MODULE_PAYMENT_PAGAMASTARDE_TK', 'tk_XXXX', 'The test public key used for the Paga+Tarde service', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('TEST Secret Key', 'MODULE_PAYMENT_PAGAMASTARDE_TSK', 'secret', 'The test secret key used for the Paga+Tarde service', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('REAL Public Key', 'MODULE_PAYMENT_PAGAMASTARDE_PK', 'pk_XXXX', 'The real public key used for the Paga+Tarde service', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('REAL Secret Key', 'MODULE_PAYMENT_PAGAMASTARDE_PSK', 'secret', 'The real public key used for the Paga+Tarde service', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Discount', 'MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT', 'False', 'Do you want to asume loan comissions?', '6', '3', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Include Widget', 'MODULE_PAYMENT_PAGAMASTARDE_WIDGET', 'False', 'Do you want to include the Paga+Tarde widget in the checkout page?', '6', '3', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Transaction Mode', 'MODULE_PAYMENT_PAGAMASTARDE_TESTMODE', 'Test', 'Transaction mode used for processing orders.<br><strong>Production</strong>=Live processing with real account credentials<br><strong>Test</strong>=Simulations with real account credentials', '6', '0', 'zen_cfg_select_option(array(\'Test\', \'Production\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort order of display.', 'MODULE_PAYMENT_PAGAMASTARDE_SORT_ORDER', '0', 'Sort order of displaying payment options to the customer. Lowest is displayed first.', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Payment Zone', 'MODULE_PAYMENT_PAGAMASTARDE_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Set Order Status', 'MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID', '2', 'Set the status of orders made with this payment module to this value', '6', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now())");

      $this->_check_install_pmt_table();
    }
    /**
    * Remove the module and all its settings
    *
    */
    function remove() {
      global $db;
      $db->Execute("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
      $db->Execute("drop table " . TABLE_PAGAMASTARDE);
    }

    function _check_install_pmt_table() {
      global $sniffer, $db;
      if (!$sniffer->table_exists(TABLE_PAGAMASTARDE)) {
        $sql = "CREATE TABLE " . TABLE_PAGAMASTARDE . " (
          `id` int(11) NOT NULL auto_increment,
          `insert_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
          `order_id` varchar(150) NOT NULL,
          `json` TEXT,
          PRIMARY KEY (id),
          KEY (order_id))";
          $db->Execute($sql);
        }
      }

      /**
      * Internal list of configuration keys used for configuration of the module
      *
      * @return array
      */
      function keys() {
        return array('MODULE_PAYMENT_PAGAMASTARDE_STATUS',
                     'MODULE_PAYMENT_PAGAMASTARDE_TK',
                     'MODULE_PAYMENT_PAGAMASTARDE_TSK',
                     'MODULE_PAYMENT_PAGAMASTARDE_PK',
                     'MODULE_PAYMENT_PAGAMASTARDE_PSK',
                     'MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT',
                     'MODULE_PAYMENT_PAGAMASTARDE_WIDGET',
                     'MODULE_PAYMENT_PAGAMASTARDE_TESTMODE',
                     'MODULE_PAYMENT_PAGAMASTARDE_SORT_ORDER',
                     'MODULE_PAYMENT_PAGAMASTARDE_ZONE',
                     'MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID');
      }

    }
