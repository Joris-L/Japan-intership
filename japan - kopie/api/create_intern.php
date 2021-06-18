<?php

// files needed to connect to database
include_once 'layout/header.php';
include_once 'objects/intern.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// instantiate Intern object
$intern = new Intern($db);

// get posted data
$data = json_decode(file_get_contents("php://input"));

// set Intern property values, if its not set make it a empty string
$intern->user_id = (isset($data->user_id) ? $data->user_id : '');
$intern->fullname = (isset($data->fullname) ? $data->fullname : '');
$intern->email = (isset($data->email) ? $data->email : '');
$intern->description = (isset($data->description) ? $data->description : '');
$intern->profile_picture = (isset($data->profile_picture) ? $data->profile_picture : '');
$intern->video_link = (isset($data->video_link) ? $data->video_link : '');
$intern->tags = (isset($data->tags) ? $data->tags : '');
$intern->nationality = (isset($data->nationality) ? $data->nationality : '');
$intern->living_country = (isset($data->living_country) ? $data->living_country : '');
$intern->graduated = (isset($data->graduated) ? $data->graduated : '');
$intern->student = (isset($data->student) ? $data->student : '');
$intern->native_lang = (isset($data->native_lang) ? $data->native_lang : '');
$intern->fluent_lang = (isset($data->fluent_lang) ? $data->fluent_lang : '');

// create the intern if properties are not empty
if(
    !empty($intern->user_id) &&
    !empty($intern->fullname) &&
    !empty($intern->description) &&
    !empty($intern->profile_picture) &&
    !empty($intern->video_link) &&
    !empty($intern->tags) &&
    !empty($intern->nationality) &&
    !empty($intern->living_country) &&
    !empty($intern->graduated) &&
    !empty($intern->student) &&
    !empty($intern->native_lang) &&
    !empty($intern->fluent_lang) &&
    $intern->create()
){

    // set response code
    http_response_code(200);

    // display message: intern was created
    echo json_encode(array("message" => "Intern (Profile) was created."));
}

// message if unable to create intern
else{

    // set response code
    http_response_code(400);

    // display message: unable to create intern
    echo json_encode(array("message" => "Unable to create intern (Profile)."));
}
?>