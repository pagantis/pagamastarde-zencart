<?php
/**
 * PagaMasTarde payment module for zencart
 *
 * @package     PagaMasTarde
 * @author      Albert Fatsini <afatsini@digitalorigin.com>
 * @copyright   Copyright (c) 2015  PagaMasTarde (http://www.pagamastarde.com)
 *
 * @license     Released under the GNU General Public License
 *
 */

    chdir('../../../../');
    require('includes/application_top.php');



    /*
     * Notificacion desde Pagantis
     */

    $json = file_get_contents('php://input');

    $notification = json_decode($json, true);
    if(isset($notification['event']) && $notification['event'] == 'sale.created')  {

        // customer is in the pagantis gateway page, but the payment is not complete
        // se ha abierto la pagina de pago, pero todavia no se ha realizado el cobro
        exit;
    }


    $mode = ((MODULE_PAYMENT_PAGAMASTARDE_EOM_MODE == 'Test') ? 'test' : 'real');
    if ( $mode == 'real'){
      $pagamastarde_secret = trim( MODULE_PAYMENT_PAGAMASTARDE_EOM_SECRET );
    }else{
      $pagamastarde_secret = trim( MODULE_PAYMENT_PAGAMASTARDE_EOM_TEST_SECRET );
    }
    $signature_check = sha1($pagamastarde_secret.$notification['account_id'].$notification['api_version'].$notification['event'].$notification['data']['id']);
    if ($signature_check != $notification['signature'] ){
      //hack detected - not implemented yet
      die( 'Fallo en el proceso de pago. Su pedido ha sido cancelado.' );
      exit;
    }


    if(isset($notification['event']) && $notification['event'] == 'charge.created')  {


        // recoger informacion del pedido
        $order_id_from_pagantis = $notification['data']['order_id'];



        $order_query = $db->Execute("select * from " . TABLE_ORDERS . " where orders_id = '" . (int)$order_id_from_pagantis . "' ");

        $order = false;
        if ($order_query->RecordCount() > 0) {
            $order = $order_query->fields;
        }



        if($order)
        {

            // recoger informacion de la sesion del cliente
            // ahora estamos en una sesion nueva abierta desde el servidor de Pagantis
            $customer_session_id = trim($order['cc_owner']);

                // Actualizar estado del pedido
                // Actualizar historial del pedido
                // Quitar la referencia a la sesion que se incluyo en el pedido

                $order_query = $db->Execute("select orders_status, currency, currency_value from " . TABLE_ORDERS . " where orders_id = '" . (int)$order_id_from_pagantis . "' ");
                if ($order_query->RecordCount() > 0) {
                    $order =  $order_query->fields;
                    //if ($order['orders_status'] == MODULE_PAYMENT_PAGAMASTARDE_EOM_PREPARE_ORDER_STATUS_ID) {
                      $sql_data_array = array('orders_id' => $order_id_from_pagantis,
                                              'orders_status_id' => MODULE_PAYMENT_PAGAMASTARDE_EOM_PREPARE_ORDER_STATUS_ID,
                                              'date_added' => 'now()',
                                              'customer_notified' => '0',
                                              'comments' => '');

                      zen_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);

                      $db->Execute("update " . TABLE_ORDERS . " set orders_status = '" . (MODULE_PAYMENT_PAGAMASTARDE_EOM_ORDER_STATUS_ID > 0 ? (int)MODULE_PAYMENT_PAGAMASTARDE_EOM_ORDER_STATUS_ID : (int)DEFAULT_ORDERS_STATUS_ID) . "', last_modified = now() where orders_id = '" . (int)$order_id_from_pagantis . "'");
                    //}

                    $total_query = $db->Execute("select value from " . TABLE_ORDERS_TOTAL . " where orders_id = '" . (int)$order_id_from_pagantis . "' and class = 'ot_total' limit 1");
                    $total = $total_query->fields;

                    $order_state_msg  = 'PagaMasTarde Auth: '.$notification['data']['authorization_code'];
                    $order_state_msg .= ' ID: '.$notification['data']['id'];


                    $sql_data_array = array('orders_id' => $order_id_from_pagantis,
                                            'orders_status_id' => (MODULE_PAYMENT_PAGAMASTARDE_EOM_ORDER_STATUS_ID > 0 ? (int)MODULE_PAYMENT_PAGAMASTARDE_EOM_ORDER_STATUS_ID : (int)DEFAULT_ORDERS_STATUS_ID),
                                            'date_added' => 'now()',
                                            'customer_notified' => '0',
                                            'comments' => $order_state_msg);

                    zen_db_perform(TABLE_ORDERS_STATUS_HISTORY, $sql_data_array);


                    // quitar referencia sesion
                    $db->Execute("update " . TABLE_ORDERS . " set cc_owner = '' where orders_id = '" . (int)$order_id_from_pagantis . "'");


                }



                // hacemos la notificacion en la sesion del cliente
                // para enviar los emails de confirmacion
                if (function_exists('curl_exec')) {


                    $url = trim( zen_href_link(FILENAME_CHECKOUT_PROCESS, 'cID='.$customer_session_id, 'SSL', false));
                    $ch = curl_init();

                    curl_setopt($ch, CURLOPT_URL, $url);
                    curl_setopt($ch, CURLOPT_HTTPGET, true);
                    curl_setopt($ch, CURLOPT_COOKIE, 'cID='.$customer_session_id);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($ch, CURLOPT_HEADER, false);
                    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

                    $result = curl_exec($ch);

                    curl_close($ch);
                }



        }else{
            throw new Exception('Order not found');
        }

    }


    require('includes/application_bottom.php');
?>
