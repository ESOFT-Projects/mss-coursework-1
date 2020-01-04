<!DOCTYPE html>
<html lang="en" ng-app="myApp" >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>Login</title>

  <!--range picker-->
  <link rel="stylesheet" href="http://mss.test/css/rangepicker/daterangepicker.css">

    <link href="http://mss.test/css/style.css" rel="stylesheet">
    <link href="http://mss.test/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://mss.test/js/html5shiv.js"></script>
    <script src="http://mss.test/js/respond.min.js"></script>
    <![endif]-->




</head>

<body class="login-body" ng-controller="InController" >

<div class="container">

    <form class="form-signin" action="login" method="post" id="login-form" ng-submit="expect_token($event)" >
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">&nbsp;</h1>
            <img src="http://mss.test/images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">

            <?php
              if(count($errors)>0){
				  echo '<div class="alert alert-danger" style="width:100%;text-align:center;margin-left:auto;margin-right:auto;" >';
	            foreach($errors->all() as $error){

		          echo $error.'<br>';

	            }
				echo '</div>';
              }
            ?>



            <input type="text" id="email" name="email" class="form-control" placeholder="Email" autofocus ng-model="the_runner.username" >
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" ng-model="the_runner.password" >



            <div class="registration" ng-if="the_runner.spinner" >
                Updating Environment&nbsp;&nbsp;<i  style="color:#374152;" class="fa fa-spinner fa-spin fa-2x"></i>
            </div>


            <button class="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </button>

            <div class="registration">
                2019 &copy; ASCESO
            </div>


        </div>



    </form>

</div>

<script type="text/javascript" src="http://mss.test/js/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.js"></script>
    <script src="http://rawgit.com/angular-ui/angular-google-maps/2.0.X/dist/angular-google-maps.js?key=AIzaSyBBGwrHXcGj52OZQiggdrefxVDnj-Jm2Qc"></script>
	<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyBBGwrHXcGj52OZQiggdrefxVDnj-Jm2Qc'></script>
<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="http://mss.test/js/jquery-1.10.2.min.js"></script>
<script src="http://mss.test/js/bootstrap.min.js"></script>
<script src="http://mss.test/js/modernizr.min.js"></script>

<!--moment-->
<script src="http://mss.test/js/moment.js"></script>

<!--calendar-->
<script src="http://mss.test/js/ui-bootstrap-tpls.min.js"></script>

<!--range picker-->
<script src="http://mss.test/css/rangepicker/angular-messages.js"></script>
<script src="http://mss.test/css/rangepicker/daterangepicker.js"></script>
<script src="http://mss.test/css/rangepicker/angular-daterangepicker.js"></script>

<script type="text/javascript" src="http://mss.test/js/app_home.js"></script>
<script>
$('#login-formx').submit(function() {

    return true;
});
</script>
</body>
</html>
