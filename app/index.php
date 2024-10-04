<?php
  require_once __DIR__ . '/../vendor/autoload.php';

  $uri = 'mongodb://mongo/?maxPoolConnections=1';
  $client = new MongoDB\Client($uri);
  $collection = $client->carmen->campaigns;
  $result = $collection->find();
  if ($result) {
    foreach ($result as $doc) {
      echo json_encode($doc), PHP_EOL;
  }
  } else {
      echo 'Document not found';
  }
