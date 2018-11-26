<?php
error_reporting(E_ALL);
ini_set('display_errors', 'On');
// require_once 'vendor/autoload.php';

$ops = array(
  "profile" => "each",
  "region" => "sa-east-1",
  "version" => "latest"
);

// S3 bucket
// $clientS3 = new Aws\S3\S3Client($ops);
// $clientS3->registerStreamWrapper();

$chave_api = "9cf92b800603de7a266f4400062d865a67ee64eeb4b968b01d608ffa7806b092";

$cookie = '/tmp/cookie.txt';
$url = 'http://api.olhovivo.sptrans.com.br/v2.1';

//echo $url . '/Login/Autenticar?token=' . $chave_api;

// Login. Executar uma vez só.
$ch = curl_init();
curl_setopt ($ch, CURLOPT_URL, $url . '/Login/Autenticar?token=' . $chave_api);
curl_setopt ($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Length: 0'));
curl_setopt ($ch, CURLOPT_COOKIEFILE, $cookie);
curl_setopt ($ch, CURLOPT_COOKIEJAR, $cookie);
$result = curl_exec ($ch);
curl_close ($ch);
echo "<hr>";

$ch = curl_init();
curl_setopt ($ch, CURLOPT_URL, $url . '/Linha/Buscar?termosBusca=Pinheiros');
curl_setopt ($ch, CURLOPT_POST, false);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Length: 0'));
curl_setopt ($ch, CURLOPT_COOKIEFILE, $cookie);
curl_setopt ($ch, CURLOPT_COOKIEJAR, $cookie);
$result = curl_exec ($ch);
curl_close ($ch);
echo "<hr>";

exit;
$ch = curl_init();
curl_setopt ($ch, CURLOPT_URL, $url . '/Posicao/Linha?codigoLinha=34414');
curl_setopt ($ch, CURLOPT_POST, false);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Length: 0'));
curl_setopt ($ch, CURLOPT_COOKIEFILE, $cookie);
curl_setopt ($ch, CURLOPT_COOKIEJAR, $cookie);
$result = curl_exec ($ch);
curl_close ($ch);
echo "<hr>";

$url = $url . "/Posicao/Linha?codigoLinha=34414";
$response = \Httpful\Request::get($url)
    ->expectsJson()
    ->withXTrivialHeader('Content-Length: 0')
    ->addOnCurlOption(CURLOPT_COOKIEJAR, $cookie)
    ->addOnCurlOption(CURLOPT_COOKIEFILE, $cookie)
    ->send();

print_r($response);
