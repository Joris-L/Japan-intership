<?php
// generate json web token
include_once 'layout/header.php';
include_once 'objects/intern.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate Intern object
$intern = new Intern($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));


// set intern property values
$user_id = (isset($data->user_id) ? $data->user_id : 0);

// check if profile exists and then return the result
if($user_id != 0 ){
    $intern->id = $user_id;

    $result = $intern->getProfile();
    echo json_encode($result);
} else { //no priofile fournd

    // set response code
    http_response_code(404);

    // tell the user login failed
    echo json_encode(array("message" => "Failed to get profile."));
}
?>