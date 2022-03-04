<?php 
require_once('libraries/razorpay-php/razorpay_config.php');
require_once('libraries/razorpay-php/Razorpay.php');

use Razorpay\Api\Api;

$api = new Api($keyId, $keySecret);

$orderData = [
    'receipt' => 'recipt_'. time(),
    'amount' => $total * 100,
    'currency' => 'INR',
    'payment_capture' => 1 // auto capture
];

$razorpayOrder = $api->order->create($orderData);

$razorpayOrderId = $razorpayOrder['id'];

$_SESSION['razorpay_order_id'] = $razorpayOrderId;

$displayAmount = $amount = $orderData['amount'];

$orderData = [
    "key"               => $keyId,
    "amount"            => $amount,
    "name"              => "Shree Vimal Publishers",
    "description"       => "Books publishers and sellers",
    "image"             => "https://s29.postimg.org/r6dj1g85z/daft_punk.jpg",
    "prefill"           => [
    "name"              => "Daft Punk",
    "email"             => "customer@merchant123.com",
    "contact"           => "9999999999",
    ],
    "notes"             => [
    "address"           => "Hello World",
    "merchant_order_id" => "12312321",
    ],
    "theme"             => [
    "color"             => "#F37254"
    ],
    "order_id"          => $razorpayOrderId,
];

$jsonOrderData = json_encode($orderData);