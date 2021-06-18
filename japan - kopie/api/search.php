<?php
// generate json web token
include_once 'layout/header.php';
include_once 'objects/intern_search.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate internsearch object
$intern_search = new InternSearch($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));


// set internsearch property values
$search = (isset($data->search) ? $data->search : '');

// if search is not empty, do the function and return results
if($search != '' ){
    $intern_search->search = $search;

    $results = $intern_search->search();
    echo json_encode($results);
} else { //login failed

    // set response code
    http_response_code(204);

    // tell the user login failed
    echo json_encode(array("message" => "Login failed."));
}
?>