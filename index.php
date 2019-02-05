<?php 

    include("includes/header.php");
    include("includes/classes/User.php");
    include("includes/classes/Post.php");
    // session_destroy();

    if(isset($_POST['post'])){
        $post = new Post($con, $userLoggedIn);
        $post->submitPost($_POST['post_text'], 'none');
    }

?>


    <div class="user_details column">

        <a href="<?= $userLoggedIn ?>">
            <img src="<?php echo $user['profile_pic']; ?>" >
        </a>


        <div class="user_details_left_right">
            <a href="<?= $userLoggedIn ?>">
            <?php
            echo $user['first_name'] . " " . $user['last_name'];
            ?>
            </a>
            <br>
            <?php
            echo "Posts:" .  $user['num_posts'] . "<br>";
            echo "Likes:" . $user['num_likes'];
            ?>
        </div>


    </div>

    <div class="main_column column">
		<form class="post_form" action="index.php" method="POST">
			<textarea name="post_text" id="post_text" placeholder="Got something to say?"></textarea>
			<input type="submit" name="post" id="post_button" value="Post">
			<hr>

		</form>

		<!-- <?php 

     //   $post = new Post($con, $userLoggedIn);
      //  $post->loadPostsFriends();

        ?> -->
        
        <div class="posts_area"></div>
        <img id="loading" src="assets/images/icons/loading.gif" alt="" srcset="">


	</div>

    <script>
 	var userLoggedIn = '<?php echo $userLoggedIn; ?>';

$(document).ready(function() {

    $('#loading').show();

    //Original ajax request for loading first posts 
    $.ajax({
        url: "includes/ajax_load_posts.php",
        type: "POST",
        data: "page=1&userLoggedIn=" + userLoggedIn,
        cache:false,

        success: function(data) {
            $('#loading').hide();
            $('.posts_area').html(data);
        }
    });

    $(window).scroll(function() {
        let height = $('.posts_area').height(); //Div containing posts
        let scroll_top = $(this).scrollTop();
        let page = $('.posts_area').find('.nextPage').val();
        let noMorePosts = $('.posts_area').find('.noMorePosts').val();

       
      

        if ((document.body.scrollHeight == window.scrollY + window.innerHeight) && noMorePosts == 'false') {
            $('#loading').show();

            // alert("test");

            let ajaxReq = $.ajax({
                url: "includes/ajax_load_posts.php",
                type: "POST",
                data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
                cache:false,

                success: function(response) {
                    $('.posts_area').find('.nextPage').remove(); //Removes current .nextpage 
                    $('.posts_area').find('.noMorePosts').remove(); //Removes current .nextpage 

                    $('#loading').hide();
                    $('.posts_area').append(response);
                }
            });

        } //End if 

        return false;

        })


    })

    </script>



    </div>
</body>
</html>