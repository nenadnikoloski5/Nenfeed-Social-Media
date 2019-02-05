<?php  
require_once '../config/config.php';
include("classes/User.php");
include("classes/Post.php");

$limit = 10; //Number of posts to be loaded per cal

$posts = new Post($con, $_REQUEST['userLoggedIn']);
$posts->loadPostsFriends($_REQUEST, $limit);
?>