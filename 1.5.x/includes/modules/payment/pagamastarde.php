<?php
/**
 * PagaMasTarde payment module for oscommerce
 *
 * @package     PagaMasTarde
 * @author      Epsilon Eridani CB <contact@epsilon-eridani.com>
 * @copyright   Copyright (c) 2014  PagaMasTarde (http://www.pagamastarde.com)
 *
 * @license     Released under the GNU General Public License
 *
 */


 class pagamastarde {
    var $code, $title, $description, $enabled;

    /*
     * constructor
     */
    function pagamastarde() {
      global $order;
      $this->signature = 'pagamastarde|pagamastarde|1.6|1.0';
      $this->code = 'pagamastarde';
      $this->title = MODULE_PAYMENT_PAGAMASTARDE_TEXT_TITLE;
      $this->description = MODULE_PAYMENT_PAGAMASTARDE_TEXT_DESCRIPTION;
      $this->sort_order = MODULE_PAYMENT_PAGAMASTARDE_SORT_ORDER;
      $this->enabled = ((MODULE_PAYMENT_PAGAMASTARDE_STATUS == 'True') ? true : false);
      $this->mode = ((MODULE_PAYMENT_PAGAMASTARDE_MODE == 'Test') ? 'test' : 'real');

      if ((int)MODULE_PAYMENT_PAGAMASTARDE_PREPARE_ORDER_STATUS_ID > 0) {
        $this->order_status = MODULE_PAYMENT_PAGAMASTARDE_PREPARE_ORDER_STATUS_ID;
      }

      if (is_object($order)) $this->update_status();

      $this->form_action_url = "https://pmt.pagantis.com/v1/installments";

        //list of currencies to process
      $this->allowCurrencyCode = array( 'EUR' );

    }

    /*
     * Actualizar el estado del pedido
     */
    function update_status() {
      global $order,$db;

      if ( ($this->enabled == true) && ((int)MODULE_PAYMENT_PAGAMASTARDE_ZONE > 0) ) {
        $check_flag = false;
        $check_query = $db->Execute("select zone_id from " . TABLE_ZONES_TO_GEO_ZONES . " where geo_zone_id = '" . MODULE_PAYMENT_PAGAMASTARDE_ZONE . "' and zone_country_id = '" . $order->billing['country']['id'] . "' order by zone_id");
        while ($check = $check_query->fields) {
          if ($check['zone_id'] < 1) {
            $check_flag = true;
            break;
          } elseif ($check['zone_id'] == $order->billing['zone_id']) {
            $check_flag = true;
            break;
          }
          $check->MoveNext();
        }

        if ($check_flag == false) {
          $this->enabled = false;
        }
      }
    }


    /*
     *  validacion inicial
     */
    function javascript_validation() {
      return false;
    }


    /*
     * Llamada cuando el usuario esta en la pantalla de eleccion de tipo de pago
     *
     * Si hay un pedido generado previamente y no confirmado, se borra
     * Caso de uso:
     * - el usuario llega a la pantalla de confirmacion
     * - se genera el pedido (pero no se genera entrada en orders_status_history)
     * - el usuario decide realizar algun cambio en su compra antes de pasar a PagaMasTarde
     * - entra de nuevo en la pantalla de seleccion de tipo de pago (puede elegir otra forma de pago)
     * - se comprueba que no exista el pedido generado anteriormente
     * - se borra el pedido que se habia generado inicialmente. Ya no es valido
     *
     */
    function selection() {
      global $currency,$order, $pagamastardeOrderGeneratedInConfirmation, $pagamastardeCartIDinConfirmation, $db;

      if (!empty($pagamastardeOrderGeneratedInConfirmation)){
        $order_id = $pagamastardeOrderGeneratedInConfirmation;

        $check_query = $db->Execute('select orders_id from ' . TABLE_ORDERS_STATUS_HISTORY . ' where orders_id = "' . (int)$order_id . '" limit 1');

        if ($check_query->RecordCount() < 1) {
          $db->Execute('delete from ' . TABLE_ORDERS . ' where orders_id = "' . (int)$order_id . '"');
          $db->Execute('delete from ' . TABLE_ORDERS_TOTAL . ' where orders_id = "' . (int)$order_id . '"');
          $db->Execute('delete from ' . TABLE_ORDERS_STATUS_HISTORY . ' where orders_id = "' . (int)$order_id . '"');
          $db->Execute('delete from ' . TABLE_ORDERS_PRODUCTS . ' where orders_id = "' . (int)$order_id . '"');
          $db->Execute('delete from ' . TABLE_ORDERS_PRODUCTS_ATTRIBUTES . ' where orders_id = "' . (int)$order_id . '"');
          $db->Execute('delete from ' . TABLE_ORDERS_PRODUCTS_DOWNLOAD . ' where orders_id = "' . (int)$order_id . '"');

          $pagamastardeOrderGeneratedInConfirmation='';

        }
      }


      // verificar que la moneda utilizada es aceptada por PagaMasTarde
      if(!in_array($order->info['currency'], $this->allowCurrencyCode))
      {
          return false;
      }

      return array('id' => $this->code,
                   'module' => MODULE_PAYMENT_PAGAMASTARDE_SHOP_TEXT_TITLE);
    }


    /*
     * Validacion antes de pasar a pantalla confirmacion
     */
    function pre_confirmation_check() {
      return false;
    }

    /*
     * Llamada cuando el usuario entra en la pantalla de confirmacion
     *
     * Se genera el pedido:
     * - con el estado predefinido para el modulo PagaMasTarde
     * - sin notificacion a cliente ni administrador
     * - no se borra el carrito asociado al pedido
     *
     */

    function confirmation() {

      global $cartID, $pagamastardeOrderGeneratedInConfirmation, $pagamastardeCartIDinConfirmation, $customer_id, $languages_id, $order, $order_total_modules,$db;
      $insert_order =false;
      if (empty($pagamastardeOrderGeneratedInConfirmation)){
        $insert_order = true;
      }


        // start - proceso estandar para generar el pedido
        //
        // Si el pedido contiene campos extra (NIF, ..)
        // habria que personalizar donde corresponda, de forma similar a la personalizacion
        // que se haya hecho en checkout_process.php

        // La informacion de la sesion activa del usuario se guarda temporalmente en el campo cc_owner
        // De esta forma se evita la creacion de una tabla adicional para seguimiento de la sesion

        if ($insert_order == true) {
          $order_totals = array();
          if (is_array($order_total_modules->modules)) {
            reset($order_total_modules->modules);
            while (list(, $value) = each($order_total_modules->modules)) {
              $class = substr($value, 0, strrpos($value, '.'));
              if ($GLOBALS[$class]->enabled) {
                for ($i=0, $n=sizeof($GLOBALS[$class]->output); $i<$n; $i++) {
                  if (zen_not_null($GLOBALS[$class]->output[$i]['title']) && zen_not_null($GLOBALS[$class]->output[$i]['text'])) {
                    $order_totals[] = array('code' => $GLOBALS[$class]->code,
                                            'title' => $GLOBALS[$class]->output[$i]['title'],
                                            'text' => $GLOBALS[$class]->output[$i]['text'],
                                            'value' => $GLOBALS[$class]->output[$i]['value'],
                                            'sort_order' => $GLOBALS[$class]->sort_order);
                  }
                }
              }
            }
          }

          //customer id not correctly stored, this line fixes it.
          $customer_id = $_SESSION['customer_id'];

          $sql_data_array = array('customers_id' => $customer_id,
                                  'order_total' => $order->info['total'],
                                  'customers_name' => $order->customer['firstname'] . ' ' . $order->customer['lastname'],
                                  'customers_company' => $order->customer['company'],
                                  'customers_street_address' => $order->customer['street_address'],
                                  'customers_suburb' => $order->customer['suburb'],
                                  'customers_city' => $order->customer['city'],
                                  'customers_postcode' => $order->customer['postcode'],
                                  'customers_state' => $order->customer['state'],
                                  'customers_country' => $order->customer['country']['title'],
                                  'customers_telephone' => $order->customer['telephone'],
                                  'customers_email_address' => $order->customer['email_address'],
                                  'customers_address_format_id' => $order->customer['format_id'],
                                  'delivery_name' => $order->delivery['firstname'] . ' ' . $order->delivery['lastname'],
                                  'delivery_company' => $order->delivery['company'],
                                  'delivery_street_address' => $order->delivery['street_address'],
                                  'delivery_suburb' => $order->delivery['suburb'],
                                  'delivery_city' => $order->delivery['city'],
                                  'delivery_postcode' => $order->delivery['postcode'],
                                  'delivery_state' => $order->delivery['state'],
                                  'delivery_country' => $order->delivery['country']['title'],
                                  'delivery_address_format_id' => $order->delivery['format_id'],
                                  'billing_name' => $order->billing['firstname'] . ' ' . $order->billing['lastname'],
                                  'billing_company' => $order->billing['company'],
                                  'billing_street_address' => $order->billing['street_address'],
                                  'billing_suburb' => $order->billing['suburb'],
                                  'billing_city' => $order->billing['city'],
                                  'billing_postcode' => $order->billing['postcode'],
                                  'billing_state' => $order->billing['state'],
                                  'billing_country' => $order->billing['country']['title'],
                                  'billing_address_format_id' => $order->billing['format_id'],
                                  'payment_method' => 'pagamastarde',
                                  'payment_module_code' => 'pagamastarde',
                                  'cc_type' => $order->info['cc_type'],
                                  'cc_owner' => zen_session_id(),
                                  'cc_number' => $order->info['cc_number'],
                                  'cc_expires' => $order->info['cc_expires'],
                                  'date_purchased' => 'now()',
                                  'orders_status' => $order->info['order_status'],
                                  'currency' => $order->info['currency'],
                                  'currency_value' => $order->info['currency_value'],
                                  'shipping_method' => $order->info['shipping_method'],
                                  'shipping_module_code' => $order->info['shipping_module_code'] );
          zen_db_perform(TABLE_ORDERS, $sql_data_array);
          $insert_id = $db->insert_ID();


          //the $_GLOBAL seems to fail. applying patch:
          $sql_data_array = array('orders_id' => $insert_id,
                                  'title' => 'Total:',
                                  'text' => $order->info['total'],
                                  'value' => $order->info['total'],
                                  'class' => 'ot_total',
                                  'sort_order' => 999);

          zen_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);

          for ($i=0, $n=sizeof($order_totals); $i<$n; $i++) {
            $sql_data_array = array('orders_id' => $insert_id,
                                    'title' => $order_totals[$i]['title'],
                                    'text' => $order_totals[$i]['text'],
                                    'value' => $order_totals[$i]['value'],
                                    'class' => $order_totals[$i]['code'],
                                    'sort_order' => $order_totals[$i]['sort_order']);

            zen_db_perform(TABLE_ORDERS_TOTAL, $sql_data_array);
          }

          for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
            $sql_data_array = array('orders_id' => $insert_id,
                                    'products_id' => zen_get_prid($order->products[$i]['id']),
                                    'products_model' => $order->products[$i]['model'],
                                    'products_name' => $order->products[$i]['name'],
                                    'products_price' => $order->products[$i]['price'],
                                    'final_price' => $order->products[$i]['final_price'],
                                    'products_tax' => $order->products[$i]['tax'],
                                    'products_quantity' => $order->products[$i]['qty']);

            zen_db_perform(TABLE_ORDERS_PRODUCTS, $sql_data_array);
			$order_products_id = $db->insert_ID();


            $attributes_exist = '0';
            if (isset($order->products[$i]['attributes'])) {
              $attributes_exist = '1';
              for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
                if (DOWNLOAD_ENABLED == 'true') {
                  $attributes_query = "select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix, pad.products_attributes_maxdays, pad.products_attributes_maxcount , pad.products_attributes_filename
                                       from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa
                                       left join " . TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD . " pad
                                       on pa.products_attributes_id=pad.products_attributes_id
                                       where pa.products_id = '" . $order->products[$i]['id'] . "'
                                       and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "'
                                       and pa.options_id = popt.products_options_id
                                       and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "'
                                       and pa.options_values_id = poval.products_options_values_id
                                       and popt.language_id = '" . $languages_id . "'
                                       and poval.language_id = '" . $languages_id . "'";
                  $attributes = $db->Execute($attributes_query);
                } else {
                  $attributes = $db->Execute("select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa where pa.products_id = '" . $order->products[$i]['id'] . "' and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "' and pa.options_id = popt.products_options_id and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "' and pa.options_values_id = poval.products_options_values_id and popt.language_id = '" . $languages_id . "' and poval.language_id = '" . $languages_id . "'");
                }
                $attributes_values = $attributes->fields;

                $sql_data_array = array('orders_id' => $insert_id,
                                        'orders_products_id' => $order_products_id,
                                        'products_options' => $attributes_values['products_options_name'],
                                        'products_options_values' => $attributes_values['products_options_values_name'],
                                        'options_values_price' => $attributes_values['options_values_price'],
                                        'price_prefix' => $attributes_values['price_prefix']);

                zen_db_perform(TABLE_ORDERS_PRODUCTS_ATTRIBUTES, $sql_data_array);

                if ((DOWNLOAD_ENABLED == 'true') && isset($attributes_values['products_attributes_filename']) && tep_not_null($attributes_values['products_attributes_filename'])) {
                  $sql_data_array = array('orders_id' => $insert_id,
                                          'orders_products_id' => $order_products_id,
                                          'orders_products_filename' => $attributes_values['products_attributes_filename'],
                                          'download_maxdays' => $attributes_values['products_attributes_maxdays'],
                                          'download_count' => $attributes_values['products_attributes_maxcount']);

                  zen_db_perform(TABLE_ORDERS_PRODUCTS_DOWNLOAD, $sql_data_array);
                }
              }
            }
          }


          // end - proceso estandar para generar el pedido
          $pagamastardeOrderGeneratedInConfirmation = $insert_id;
          $_SESSION['order_number_created']=$insert_id;
      }

      return false;
    }


    /*
     * Llamada en la pantalla de confirmacion
     *
     * Se genera el formulario y los campos necesarios para acceder a PagaMasTarde
     * para realizar el pago
     *
     */
    function process_button() {
        global $customer_id, $order, $sendto, $currency, $pagamastardeOrderGeneratedInConfirmation, $shipping,$db;
        $current_order_id = $pagamastardeOrderGeneratedInConfirmation;
        $amount = (int)( $order->info['total'] * 100 );
        $amount = $amount.'';


        if ( $this->mode == 'real'){
          $pagamastarde_account_id = trim( MODULE_PAYMENT_PAGAMASTARDE_ACCOUNT_ID );
          $pagamastarde_secret = trim( MODULE_PAYMENT_PAGAMASTARDE_SECRET );
        }else{
          $pagamastarde_account_id = trim( MODULE_PAYMENT_PAGAMASTARDE_TEST_ACCOUNT_ID );
          $pagamastarde_secret = trim( MODULE_PAYMENT_PAGAMASTARDE_TEST_SECRET );
        }

        $currency='EUR';
        $thiscurrency = $currency;


        if (MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT == 'False'){
          $dicount="false";
        }else{
          $dicount="true";
        }



        $pagamastarde_ok_url = trim( zen_href_link(FILENAME_CHECKOUT_SUCCESS, '', 'SSL', false));
        $pagamastarde_nok_url = trim( zen_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL', false));
        //dynamic callback
        $callback_url =dirname(  sprintf(    "%s://%s%s",
    isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http',
    $_SERVER['SERVER_NAME'],
    $_SERVER['REQUEST_URI'])).'/ext/modules/payment/pagamastarde/callback.php';

        $message = $pagamastarde_secret.$pagamastarde_account_id.$current_order_id.$amount.$thiscurrency.$pagamastarde_ok_url.$pagamastarde_nok_url.$callback_url.$dicount;
        $signature = sha1($message);


        $arrayHiddenFields = array (

            'order_id' => $current_order_id,
            'email' => $order->customer['email_address'],
            'full_name' =>$order->customer['firstname'] . ' ' . $order->customer['lastname'],
            'amount' => $amount,
            'currency' => $currency,
            //'description' => MODULE_PAYMENT_PAGAMASTARDE_SUBJECT.' '.$current_order_id,
            'ok_url' => $pagamastarde_ok_url,
            'nok_url' => $pagamastarde_nok_url,
            'account_id' => $pagamastarde_account_id,
            'signature' => $signature,
            'address[street]' => $order->customer['street_address'],
            'address[city]' => $order->customer['city'],
            'address[province]' =>$order->customer['state'],
            'address[zipcode]' => $order->customer['postcode'],
            'callback_url' => $callback_url,
            'discount[full]' => $dicount,
            'mobile_phone' => $order->customer['telephone'],

        );
        //product descirption
        $desciption=[];
        $i=0;
        if (isset($order->info['shipping_method'])){
          $arrayHiddenFields["items[".$i."][description]"]=$order->info['shipping_method'];
          $arrayHiddenFields["items[".$i."][quantity]"]=1;
          $arrayHiddenFields["items[".$i."][amount]"]=number_format($order->info['shipping_cost'], 2, '.', '');
          $desciption[]=$order->info['shipping_method'];
          $i++;
        }

        foreach ($order->products as $product){
          $arrayHiddenFields["items[".$i."][description]"]=$product['name'] . " (".$product['qty'].") ";
          $arrayHiddenFields["items[".$i."][quantity]"]=$product['qty'];
          $arrayHiddenFields["items[".$i."][amount]"]=number_format($product['final_price'] * $product['qty'], 2, '.','');
          $desciption[]=$product['name'] . " ( ".$product['qty']." )";
          $i++;
        }
        $arrayHiddenFields['description'] = implode(",",$desciption);

        $process_button_string = '';

        foreach($arrayHiddenFields as $key=>$value){
            $process_button_string .= zen_draw_hidden_field($key, $value);
        }
        //need to track the order id, using cc_owner
        $db->Execute("update " . TABLE_ORDERS . " set cc_owner = '" .zen_session_id(). "' where orders_id = '" . (int)$current_order_id . "'");

        return $process_button_string;
    }



    /*
     * Llamada por el script de callback / notificacion desde PagaMasTarde (a traves de callback.php)
     *
     * El pedido ya ha sido generado previamente en la pantalla de confirmacion (antes de acceder a PagaMasTarde).
     * PagaMasTarde notifica el resultado de la operacion al script callback.php
     * El script callback.php lanza checkout_process.php con la sesion activa del usuario
     * Desde checkout_process.php se llama a este metodo, que tiene como objetivos:
     *
     * - se actualiza el estado del pedido
     * - se actualiza el historial del pedido
     * - se construye el mensaje de confirmacion que se envia al cliente y administrador
     * - se vacia el carrito
     *
     * El proceso es practicamente identico al que lleva a cabo oscommerce en checkout_proccess.php
     * una vez confirmado que el pedido es valido
     */
    function before_process() {
      global $customer_id,$db, $order, $order_totals, $sendto, $billto, $languages_id, $payment, $currencies, $cart, $pagamastardeOrderGeneratedInConfirmation;
      global $$payment;

      $order_id = $pagamastardeOrderGeneratedInConfirmation;

      $check_query = $db->Execute("select orders_status from " . TABLE_ORDERS . " where orders_id = '" . (int)$order_id . "'");
      if ($check_query->RecordCount()) {
        $check = $check_query->fields;

        if ($check['orders_status'] == MODULE_PAYMENT_PAGAMASTARDE_PREPARE_ORDER_STATUS_ID) {
          $sql_data_array = array('orders_id' => $order_id,
                                  'orders_status_id' => MODULE_PAYMENT_PAGAMASTARDE_PREPARE_ORDER_STATUS_ID,
                                  'date_added' => 'now()',
                                  'customer_notified' => '0',
                                  'comments' => '');

          zen_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);
        }
      }

      $db->Execute("update " . TABLE_ORDERS . " set orders_status = '" . (MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID > 0 ? (int)MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID : (int)DEFAULT_ORDERS_STATUS_ID) . "', last_modified = now() where orders_id = '" . (int)$order_id . "'");

      $sql_data_array = array('orders_id' => $order_id,
                              'orders_status_id' => (MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID > 0 ? (int)MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID : (int)DEFAULT_ORDERS_STATUS_ID),
                              'date_added' => 'now()',
                              'customer_notified' => (SEND_EMAILS == 'true') ? '1' : '0',
                              'comments' => $order->info['comments']);

      zen_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);

// initialized for the email confirmation
      $products_ordered = '';
      $subtotal = 0;
      $total_tax = 0;

      for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
// Stock Update - Joao Correia
        if (STOCK_LIMITED == 'true') {
          if (DOWNLOAD_ENABLED == 'true') {
            $stock_query_raw = "SELECT products_quantity, pad.products_attributes_filename
                                FROM " . TABLE_PRODUCTS . " p
                                LEFT JOIN " . TABLE_PRODUCTS_ATTRIBUTES . " pa
                                ON p.products_id=pa.products_id
                                LEFT JOIN " . TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD . " pad
                                ON pa.products_attributes_id=pad.products_attributes_id
                                WHERE p.products_id = '" . zen_get_prid($order->products[$i]['id']) . "'";
// Will work with only one option for downloadable products
// otherwise, we have to build the query dynamically with a loop
            $products_attributes = $order->products[$i]['attributes'];
            if (is_array($products_attributes)) {
              $stock_query_raw .= " AND pa.options_id = '" . $products_attributes[0]['option_id'] . "' AND pa.options_values_id = '" . $products_attributes[0]['value_id'] . "'";
            }
            $stock_query = $db->Execute($stock_query_raw);
          } else {
            $stock_query = $db->Execute("select products_quantity from " . TABLE_PRODUCTS . " where products_id = '" . zen_get_prid($order->products[$i]['id']) . "'");
          }
          if ($stock_query->RecordCount() > 0) {
            $stock_values = $stock_query->fields;
// do not decrement quantities if products_attributes_filename exists
            if ((DOWNLOAD_ENABLED != 'true') || (!$stock_values['products_attributes_filename'])) {
              $stock_left = $stock_values['products_quantity'] - $order->products[$i]['qty'];
            } else {
              $stock_left = $stock_values['products_quantity'];
            }
            $db->Execute("update " . TABLE_PRODUCTS . " set products_quantity = '" . $stock_left . "' where products_id = '" . zen_get_prid($order->products[$i]['id']) . "'");
            if ( ($stock_left < 1) && (STOCK_ALLOW_CHECKOUT == 'false') ) {
              $db->Execute("update " . TABLE_PRODUCTS . " set products_status = '0' where products_id = '" . zen_get_prid($order->products[$i]['id']) . "'");
            }
          }
        }

// Update products_ordered (for bestsellers list)
        $db->Execute("update " . TABLE_PRODUCTS . " set products_ordered = products_ordered + " . sprintf('%d', $order->products[$i]['qty']) . " where products_id = '" . zen_get_prid($order->products[$i]['id']) . "'");

//------insert customer choosen option to order--------
        $attributes_exist = '0';
        $products_ordered_attributes = '';
        if (isset($order->products[$i]['attributes'])) {
          $attributes_exist = '1';
          for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
            if (DOWNLOAD_ENABLED == 'true') {
              $attributes_query = "select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix, pad.products_attributes_maxdays, pad.products_attributes_maxcount , pad.products_attributes_filename
                                   from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa
                                   left join " . TABLE_PRODUCTS_ATTRIBUTES_DOWNLOAD . " pad
                                   on pa.products_attributes_id=pad.products_attributes_id
                                   where pa.products_id = '" . $order->products[$i]['id'] . "'
                                   and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "'
                                   and pa.options_id = popt.products_options_id
                                   and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "'
                                   and pa.options_values_id = poval.products_options_values_id
                                   and popt.language_id = '" . $languages_id . "'
                                   and poval.language_id = '" . $languages_id . "'";
              $attributes = $db->Execute($attributes_query);
            } else {
              $attributes = $db->Execute("select popt.products_options_name, poval.products_options_values_name, pa.options_values_price, pa.price_prefix from " . TABLE_PRODUCTS_OPTIONS . " popt, " . TABLE_PRODUCTS_OPTIONS_VALUES . " poval, " . TABLE_PRODUCTS_ATTRIBUTES . " pa where pa.products_id = '" . $order->products[$i]['id'] . "' and pa.options_id = '" . $order->products[$i]['attributes'][$j]['option_id'] . "' and pa.options_id = popt.products_options_id and pa.options_values_id = '" . $order->products[$i]['attributes'][$j]['value_id'] . "' and pa.options_values_id = poval.products_options_values_id and popt.language_id = '" . $languages_id . "' and poval.language_id = '" . $languages_id . "'");
            }
            $attributes_values = $attributes->fields;

            $products_ordered_attributes .= "\n\t" . $attributes_values['products_options_name'] . ' ' . $attributes_values['products_options_values_name'];
          }
        }
//------insert customer choosen option eof ----
        $total_weight += ($order->products[$i]['qty'] * $order->products[$i]['weight']);
        $total_tax += zen_calculate_tax($total_products_price, $products_tax) * $order->products[$i]['qty'];
        $total_cost += $total_products_price;

        $products_ordered .= $order->products[$i]['qty'] . ' x ' . $order->products[$i]['name'] . ' (' . $order->products[$i]['model'] . ') = ' . $currencies->display_price($order->products[$i]['final_price'], $order->products[$i]['tax'], $order->products[$i]['qty']) . $products_ordered_attributes . "\n";
      }

// lets start with the email confirmation
      $email_order = STORE_NAME . "\n" .
                     EMAIL_SEPARATOR . "\n" .
                     EMAIL_TEXT_ORDER_NUMBER . ' ' . $order_id . "\n" .
                     EMAIL_TEXT_INVOICE_URL . ' ' . zen_href_link(FILENAME_ACCOUNT_HISTORY_INFO, 'order_id=' . $order_id, 'SSL', false) . "\n" .
                     EMAIL_TEXT_DATE_ORDERED . ' ' . strftime(DATE_FORMAT_LONG) . "\n\n";
      if ($order->info['comments']) {
        $email_order .= zen_db_output($order->info['comments']) . "\n\n";
      }
      $email_order .= EMAIL_TEXT_PRODUCTS . "\n" .
                      EMAIL_SEPARATOR . "\n" .
                      $products_ordered .
                      EMAIL_SEPARATOR . "\n";

      for ($i=0, $n=sizeof($order_totals); $i<$n; $i++) {
        $email_order .= strip_tags($order_totals[$i]['title']) . ' ' . strip_tags($order_totals[$i]['text']) . "\n";
      }

      if ($order->content_type != 'virtual') {
        $email_order .= "\n" . EMAIL_TEXT_DELIVERY_ADDRESS . "\n" .
                        EMAIL_SEPARATOR . "\n" .
                        zen_address_label($customer_id, $sendto, 0, '', "\n") . "\n";
      }

      $email_order .= "\n" . EMAIL_TEXT_BILLING_ADDRESS . "\n" .
                      EMAIL_SEPARATOR . "\n" .
                      zen_address_label($customer_id, $billto, 0, '', "\n") . "\n\n";

      if (is_object($$payment)) {
        $email_order .= EMAIL_TEXT_PAYMENT_METHOD . "\n" .
                        EMAIL_SEPARATOR . "\n";
        $payment_class = $$payment;
        $email_order .= $payment_class->title . "\n\n";
        if ($payment_class->email_footer) {
          $email_order .= $payment_class->email_footer . "\n\n";
        }
      }

      zen_mail($order->customer['firstname'] . ' ' . $order->customer['lastname'], $order->customer['email_address'], EMAIL_TEXT_SUBJECT, $email_order, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);

// send emails to other people
      if (SEND_EXTRA_ORDER_EMAILS_TO != '') {
        zen_mail('', SEND_EXTRA_ORDER_EMAILS_TO, EMAIL_TEXT_SUBJECT, $email_order, STORE_OWNER, STORE_OWNER_EMAIL_ADDRESS);
      }

      // load the after_process function from the payment modules

      $_SESSION['pagamastardeOrderGeneratedInConfirmation']='';
      $_SESSION['pagamastardeCartIDinConfirmation']='';
      $pagamastardeOrderGeneratedInConfirmation='';


      // no continua el proceso normal
      // el servidor de pago ha notificado a traves de callback.php
      // Este metodo se ejecuta
      exit;

    }

    function after_process() {
      $_SESSION['pagamastardeOrderGeneratedInConfirmation']='';
      $_SESSION['order_created'] = '';
      $_SESSION['cart']->reset(true);
      return false;
    }

    function output_error() {
      return false;
    }

    function check() {
      global $db;
      if (!isset($this->_check)) {
        $check_query = $db->Execute("select configuration_value from " . TABLE_CONFIGURATION . " where configuration_key = 'MODULE_PAYMENT_PAGAMASTARDE_STATUS'");
        $this->_check =$check_query->RecordCount() ;
      }
      return $this->_check;
    }

    function install() {
      global $db;

      $check_query = $db->Execute("select orders_status_id from " . TABLE_ORDERS_STATUS . " where orders_status_name = 'Pago pendiente [PagaMasTarde]' limit 1");
      if ($check_query->RecordCount() < 1) {
        $status_query = $db->Execute("select max(orders_status_id) as status_id from " . TABLE_ORDERS_STATUS);
        $status = $status_query->fields;

        $status_id = $status['status_id']+1;



        $languages = zen_get_languages();

        foreach ($languages as $lang) {
           $db->Execute("insert into " . TABLE_ORDERS_STATUS . " (orders_status_id, language_id, orders_status_name) values ('" . $status_id . "', '" . $lang['id'] . "', 'Pago pendiente [PagaMasTarde]')");
        }

        $flags_query =  $db->Execute("describe " . TABLE_ORDERS_STATUS . " public_flag");
        if ($flags_query->RecordCount() == 1) {
          $db->Execute("update " . TABLE_ORDERS_STATUS . " set public_flag = 0 and downloads_flag = 0 where orders_status_id = '" . $status_id . "'");
        }
      } else {
        $check = $check_query->fields;
        $status_id = $check['orders_status_id'];
      }

      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Enable Paga Más Tarde', 'MODULE_PAYMENT_PAGAMASTARDE_STATUS', 'False', 'Do you want to accept Paga Mas Tarde payments?', '6', '3', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('TEST Public Key', 'MODULE_PAYMENT_PAGAMASTARDE_TEST_ACCOUNT_ID', '', 'Codigo de tu cuenta de TEST de Paga Mas Tarde', '6', '4', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('TEST Secret Key', 'MODULE_PAYMENT_PAGAMASTARDE_TEST_SECRET', '', 'Clave de firma de tu cuenta de TEST de Paga Mas Tarde.', '6', '4', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('REAL Public Key', 'MODULE_PAYMENT_PAGAMASTARDE_ACCOUNT_ID', '', 'Codigo de tu cuenta REAL de Paga Mas Tarde', '6', '4', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('REAL Secret Key', 'MODULE_PAYMENT_PAGAMASTARDE_SECRET', '', 'Clave de firma de tu cuenta REAL de Paga Mas Tarde.', '6', '4', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Modo de pago', 'MODULE_PAYMENT_PAGAMASTARDE_MODE', 'Test', 'Change payment mode?', '6', '3', 'zen_cfg_select_option(array(\'Test\', \'Real\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, date_added) values ('Descuento - asumir comisiones', 'MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT', 'False', 'Do you want to asume comissions?', '6', '3', 'zen_cfg_select_option(array(\'True\', \'False\'), ', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added) values ('Sort order of display.', 'MODULE_PAYMENT_PAGAMASTARDE_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, use_function, set_function, date_added) values ('Zona en la que está operativo', 'MODULE_PAYMENT_PAGAMASTARDE_ZONE', '0', 'Si selecciona una zona, esta forma de pago solo estara disponible para dicha zona.', '6', '2', 'zen_get_zone_class_title', 'zen_cfg_pull_down_zone_classes(', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Estado del pedido antes de confirmar', 'MODULE_PAYMENT_PAGAMASTARDE_PREPARE_ORDER_STATUS_ID', '" . $status_id . "', 'El pedido se guarda inicialmente en este estado antes de que PagaMasTarde confirme el pago', '6', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now())");
      $db->Execute("insert into " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, set_function, use_function, date_added) values ('Estado del pedido confirmado', 'MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID', '0', 'Cuando PagaMasTarde confirma el pago, el pedido pasara a este estado', '6', '0', 'zen_cfg_pull_down_order_statuses(', 'zen_get_order_status_name', now())");


    }

    function remove() {
      global $db;
      $db->Execute("delete from " . TABLE_CONFIGURATION . " where configuration_key in ('" . implode("', '", $this->keys()) . "')");
    }

    function keys() {
      return array('MODULE_PAYMENT_PAGAMASTARDE_STATUS','MODULE_PAYMENT_PAGAMASTARDE_MODE', 'MODULE_PAYMENT_PAGAMASTARDE_TEST_ACCOUNT_ID', 'MODULE_PAYMENT_PAGAMASTARDE_TEST_SECRET', 'MODULE_PAYMENT_PAGAMASTARDE_ACCOUNT_ID', 'MODULE_PAYMENT_PAGAMASTARDE_SECRET', 'MODULE_PAYMENT_PAGAMASTARDE_ZONE', 'MODULE_PAYMENT_PAGAMASTARDE_PREPARE_ORDER_STATUS_ID', 'MODULE_PAYMENT_PAGAMASTARDE_ORDER_STATUS_ID', 'MODULE_PAYMENT_PAGAMASTARDE_DISCOUNT','MODULE_PAYMENT_PAGAMASTARDE_SORT_ORDER');
    }


  }



?>
