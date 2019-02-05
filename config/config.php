<?php

ob_start(); // output buffering
session_start();

$timezone = date_default_timezone_set("Europe/Skopje");


$con = mysqli_connect('localhost', 'root', 'password', 'social_media');

if(mysqli_connect_errno()){
    echo 'ERROR FOUND' . mysqli_connect_errno();
}