<?php

// show error reporting
error_reporting(E_ALL);

// set your default time-zone
date_default_timezone_set('Europe/Amsterdam');

// variables used for jwt
$key = "japan123intershipsecretkeywaterdog"; // the secret jwt key
$issued_at = time();
$expiration_time = $issued_at + (60 * 60); // valid for 1 hour
$issuer = "http://localhost:8080/php/japan/api/";
