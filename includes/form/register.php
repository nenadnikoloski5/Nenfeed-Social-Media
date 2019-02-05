<?php

$fname = ""; // First Name
$lname = "";
$email = "";
$email2 = "";
$password = "";
$password2 = ""; // password confirm
$date = "";
$profile_pic = "";

$error_array = []; // holds error messages


if (isset($_POST['register_button'])) {

    // First Name
    $fname = strip_tags($_POST['reg_fname']);
    $fname = str_replace(' ', '', $fname); // remove spaces
    $fname = ucfirst(strtolower($fname));
    $_SESSION['reg_fname'] = $fname;

    // Last Name
    $lname = strip_tags($_POST['reg_lname']);
    $lname = str_replace(' ', '', $lname); // remove spaces
    $lname = ucfirst(strtolower($lname));
    $_SESSION['reg_lname'] = $lname;

    // Email
    $email = strip_tags($_POST['reg_email']);
    $email = str_replace(' ', '', $email); // remove spaces
    $_SESSION['reg_email'] = $email;


    // Email 2
    $email2 = strip_tags($_POST['reg_email2']);
    $email2 = str_replace(' ', '', $email2); // remove spaces
    $_SESSION['reg_email2'] = $email2;


    // Password
    $password = strip_tags($_POST['reg_password']);

    // Password 2
    $password2 = strip_tags($_POST['reg_password2']);

    $date = date("Y-m-d"); // current date

    if($email == $email2){
        if(filter_var($email, FILTER_VALIDATE_EMAIL)){
            $email = filter_var($email, FILTER_VALIDATE_EMAIL);

            // check if email exist
            $email_check = mysqli_query($con, "SELECT email FROM users WHERE email='$email'");

            $num_rows = mysqli_num_rows($email_check);
            if($num_rows > 0 ){
                array_push($error_array, 'Email is already in use<br>');
            }
            


        } else {
            array_push($error_array, 'Invalid email Format<br>');
        }


    } else {
        array_push($error_array, "Emails don't match<br>");
    }

    if(strlen($fname) > 25 || strlen($fname) < 2){
        array_push($error_array, 'Your first name must be between 2 and 25 characters<br>');
    }

    if(strlen($lname) > 25 || strlen($lname) < 2){
        array_push($error_array, 'Your last name must be between 2 and 25 characters<br>');
    }

    if($password !== $password2){
        array_push($error_array, 'Your passwords don\'t match<br>');
    } else {
        if(preg_match('/[^A-Za-z0-9]/', $password)){
            array_push($error_array, 'The password can only contain English characters or numbers<br>');
        }
    }

    if(strlen($password) > 30 || strlen($password) < 5){
        array_push($error_array, 'Your password must be between 5 and 30 characters<br>');
    }


    // If there are no errors, push them 
    if (empty($error_array)) {
        $password = md5($password);

        // Generate username from first and last name
        $username = strtolower($fname . "_" . $lname);
        $check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username='$username'");

        // if username exists, add a number to the end of it
        $i = 0;
        while (mysqli_num_rows($check_username_query) != 0) {
            $i++;
            $username = $username . "_" . $i;
            $check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username='$username'");
        }


        // Giving a profile picture
        $random = rand(1,16);

        if($random == 1){
            $profile_pic = 'assets/images/profile_pics/defaults/head_alizarin.png';
        } else if($random == 2){
            $profile_pic = 'assets/images/profile_pics/defaults/head_amethyst.png';
        }else if($random == 3){
            $profile_pic = 'assets/images/profile_pics/defaults/head_belize_hole.png';
        }else if($random == 4){
            $profile_pic = 'assets/images/profile_pics/defaults/head_carrot.png';
        }else if($random == 5){
            $profile_pic = 'assets/images/profile_pics/defaults/head_deep_blue.png';
        }else if($random == 6){
            $profile_pic = 'assets/images/profile_pics/defaults/head_emerald.png';
        }else if($random == 7){
            $profile_pic = 'assets/images/profile_pics/defaults/head_green_sea.png';
        }else if($random == 8){
            $profile_pic = 'assets/images/profile_pics/defaults/head_nephritis.png';
        }else if($random == 9){
            $profile_pic = 'assets/images/profile_pics/defaults/head_pete_river.png';
        }else if($random == 10){
            $profile_pic = 'assets/images/profile_pics/defaults/head_pomegranate.png';
        }else if($random == 11){
            $profile_pic = 'assets/images/profile_pics/defaults/head_pumpkin.png';
        }else if($random == 12){
            $profile_pic = 'assets/images/profile_pics/defaults/head_red.png';
        }else if($random == 13){
            $profile_pic = 'assets/images/profile_pics/defaults/head_sun_flower.png';
        }else if($random == 14){
            $profile_pic = 'assets/images/profile_pics/defaults/head_turqoise.png';
        }else if($random == 15){
            $profile_pic = 'assets/images/profile_pics/defaults/head_wet_asphalt.png';
        }else if($random == 16){
            $profile_pic = 'assets/images/profile_pics/defaults/head_wisteria.png';
        }

        $sql_string = "INSERT INTO users(first_name, last_name, username, email, password, signup_date, profile_pic, num_posts, num_likes, user_closed, friend_array) VALUES('$fname', '$lname', '$username', '$email', '$password', '$date', '$profile_pic', '0', '0', 'no', ',')";

        $query = mysqli_query($con, $sql_string);

        array_push($error_array, "<span style='color: #14C800;'> You're all set, go ahead and login </span><br>");


        // clear sessions vars
        
        $_SESSION['reg_fname'] = "";
        $_SESSION['reg_lname'] = "";
        $_SESSION['reg_email'] = "";
        $_SESSION['reg_email2'] = "";

    }


}
