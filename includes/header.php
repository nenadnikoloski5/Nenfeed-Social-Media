<?php

require_once 'config/config.php';
// require_once 'includes/classes/Post.php';
// require_once 'includes/classes/User.php';
require_once 'includes/classes/Message.php';


if($_SESSION['username']){
    $userLoggedIn = $_SESSION['username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: register.php");
}

?>

<!DOCTYPE html>
<html lang="en" style="height: 100%">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Social Media</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/demo.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <script src="assets/js/jquery.jcrop.js"></script>
    <link rel="stylesheet" href="assets/css/jquery.Jcrop.css">
    <script src="assets/js/jcrop_bits.js"></script>


</head>
<body>


<div class="top_bar">

    <div class="logo">
        <a href="index.php">Nenfeed</a>
    </div>

    <div class="search">
        <form action="search.php" method="get" name="search_form">
            <input type="text" name="q" placeholder="Search" onkeyup="getLiveSearchUsers(this.value, '<?= $userLoggedIn; ?>')" id="search_text_input" autocomplete="off">

            <div class="button_holder">
            <img src="assets/images/icons/magnifying_glass.png" alt="" srcset="">
        </div>

        </form>

        <div class="search_results"></div>
        <div class="search_results_footer_empty"></div>

    </div>

    <nav>
    <a id="nav-username" href="<?= $userLoggedIn ?>">
        <?php echo $user['first_name']; ?>
    </a>
    <a href="index.php">
        <i class="fa fa-home fa-lg"></i>
    </a>
    <a href="messages.php">
    <i class="fa fa-envelope fa-lg"></i>
    </a>
    
    <a href="requests.php">
    <i class="fa fa-users fa-lg"></i>
    </a>
    <a href="settings.php">
    <i class="fa fa-cog fa-lg"></i>
    </a>
    <a href="includes/logout.php">
    <i class="fa fa-sign-out-alt fa-lg"></i>
    </a>




    </nav>

</div>



<div class="wrapper">



