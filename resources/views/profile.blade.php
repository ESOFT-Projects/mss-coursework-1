<!DOCTYPE html>
<html lang="en" ng-app="myApp" >
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">
  @include('layouts.title-document')

  <!--gritter css-->
  <link rel="stylesheet" type="text/css" href="http://mss.test/js/gritter/css/jquery.gritter.css" />

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

<body class="sticky-header" ng-controller="ProfileController" >

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">
        <!--logo and iconic logo start-->
		@include('layouts.header-logo')
        <!--logo and iconic logo end-->
        <div class="left-side-inner">
            <!-- visible to small devices only -->
			@include('layouts.header-small')
            <!--sidebar nav start-->
            @include('layouts.header')
            <!--sidebar nav end-->
        </div>
    </div>
    <!-- left side end-->

    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">
          <!--toggle button start-->
          <a class="toggle-btn"><i class="fa fa-bars"></i></a>
          <!--toggle button end-->
          <!--search start-->
          <!--<form class="searchform" action="index.html" method="post">
            <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
          </form>-->
          <!--search end-->
          <!--notification menu start -->
		  @include('layouts.menu-right')
          <!--notification menu end -->
        </div>
        <!-- header section end-->

        <!-- page heading start-->
		@include('layouts.title')
        <!-- page heading end-->

        <!--body wrapper start-->
        <section class="wrapper">
        <!-- page start-->

        <div class="row">

            <div class="col-lg-12">
                <section class="panel">
                    <header class="panel-heading">
                        User Details
                    </header>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form"  >

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Name</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <input ng-model="the_runner.name" id="name" type="text" class="form-control" name="name" placeholder="Name">
										<p class="help-block" ng-if="the_validator.error_name" >This field is required.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Email</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-envelope"></i>
                                        <input ng-model="the_runner.email" id="email" type="text" class="form-control" name="email" placeholder="Email">
										<p class="help-block" ng-if="the_validator.error_email" >This field is required.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Address</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-location-arrow"></i>
                                        <input ng-model="the_runner.address" id="address" type="text" class="form-control" name="address" placeholder="Address">
										<p class="help-block" ng-if="the_validator.error_address" >This field is required.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Password Current</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-key"></i>
                                        <input ng-model="the_runner.password" type="password" name="password" autocomplete="off" id="password" class="form-control" placeholder="Password">
										<p class="help-block" ng-if="the_validator.error_password" >This field is required.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Password New</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-key"></i>
                                        <input ng-model="the_runner.password_new" type="password" name="password_new" autocomplete="off" id="password_new" class="form-control" placeholder="Password New">
										<p class="help-block" ng-if="the_validator.error_password_new" >This field is required.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Confirm Password</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-key"></i>
                                        <input  ng-model="the_runner.password_confirmation" type="password" name="password_confirmation" autocomplete="off" id="password_confirmation" class="form-control" placeholder="Confirm Password">
										<p class="help-block" ng-if="the_validator.error_password_confirmation" >Passwords confirmation invalid.</p>
                                    </div>
                                </div>
                            </div>
<div class="alert alert-info alert-dismissable" style="text-align:center;" ng-show=" the_runner.return_response.length > 0 " ><a class="close"  area-label="close" ng-click=" the_runner.return_response='' " ><i class="fa fa-times"></i></a><i class="fa fa-info-circle"></i>&nbsp;&nbsp;@{{the_runner.return_response}}</div>
                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <a ng-click="save()" class="btn btn-primary">Update</a>
									<i ng-if="the_runner.spinner" style="color:#374152;" class="fa fa-spinner fa-spin fa-2x"></i>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>

        <!-- page end-->
        </section>
        <!--body wrapper end-->

        <!--footer section start-->
		@include('layouts.footer')
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<script type="text/javascript" src="http://mss.test/js/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.js"></script>
    <script src="http://rawgit.com/angular-ui/angular-google-maps/2.0.X/dist/angular-google-maps.js?key=AIzaSyBBGwrHXcGj52OZQiggdrefxVDnj-Jm2Qc"></script>
	<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyBBGwrHXcGj52OZQiggdrefxVDnj-Jm2Qc'></script>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="http://mss.test/js/jquery-1.10.2.min.js"></script>
<script src="http://mss.test/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="http://mss.test/js/jquery-migrate-1.2.1.min.js"></script>
<script src="http://mss.test/js/bootstrap.min.js"></script>
<script src="http://mss.test/js/modernizr.min.js"></script>
<script src="http://mss.test/js/jquery.nicescroll.js"></script>

<!--gritter script-->
<script type="text/javascript" src="http://mss.test/js/gritter/js/jquery.gritter.js"></script>

<!--calendar-->
<script src="http://mss.test/js/ui-bootstrap-tpls.min.js"></script>

<!--moment-->
<script src="http://mss.test/js/moment.js"></script>

<!--range picker-->
<script src="http://mss.test/css/rangepicker/angular-messages.js"></script>
<script src="http://mss.test/css/rangepicker/daterangepicker.js"></script>
<script src="http://mss.test/css/rangepicker/angular-daterangepicker.js"></script>

<!--common scripts for all pages-->
<script src="http://mss.test/js/scripts.js"></script>

<script type="text/javascript" src="http://mss.test/js/app_home.js"></script>

</body>
</html>
