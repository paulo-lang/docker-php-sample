<?php
  require_once __DIR__ . '/../vendor/autoload.php';

  $uri = 'mongodb://mongo';
  $client = new MongoDB\Client($uri, [], ['disableClientPersistence' => true]);
  $collection = $client->carmen->campaigns;
  $result = $collection->find();
  if ($result) {
    foreach ($result as $doc) {
      echo json_encode($doc), PHP_EOL;
    }
  } else {
      echo 'Document not found';
  }
