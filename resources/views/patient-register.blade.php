<!DOCTYPE html>
<html lang="en" ng-app="myApp">
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

<body class="sticky-header" ng-controller="PatientRegisterController" >

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
                        Register Patient
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
                                <label  class="col-lg-3 col-sm-3 control-label">Date of Birth</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-calendar"></i>
                                        <input ng-model="the_runner.dob"   class="form-control"  placeholder="Date of Birth" is-open="calendar_two_opened" datepicker-popup="yyyy-MM-dd" ng-click="openCalendarTwo($event)"   >
										<p class="help-block" ng-if="the_validator.error_dob" >This field is required.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">NIC</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-location-arrow"></i>
                                        <input ng-model="the_runner.nic" id="nic" type="text" class="form-control" name="nic" placeholder="Patient's or guardian's NIC">
										<p class="help-block" ng-if="the_validator.error_nic" >This field is required.</p>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Contact Number</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-info"></i>
                                        <input ng-model="the_runner.contact" id="contact" type="text" class="form-control" name="contact" placeholder="Contact number">
										<p class="help-block" ng-if="the_validator.error_contact" >This field is required.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Gender</label>
                                <div class="col-lg-9">
                            <div class="radio">
                                <label>
                                    <input ng-model="the_runner.gender" type="radio" name="optionsRadios"   ng-value="'M'" >
                                    Male
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input ng-model="the_runner.gender" type="radio" name="optionsRadios"   ng-value="'F'">
                                    Female
                                </label>
                            </div>
							<p class="help-block" ng-if="the_validator.error_gender" >This field is required.</p>
                                </div>
                            </div>


                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Address</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                       <textarea ng-model="the_runner.address" rows="6" id="address" name="address" class="form-control" style="resize:none;"></textarea>
                                       <p class="help-block" ng-if="the_validator.error_address" >This field is required.</p>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <a type="button" class="btn btn-primary" ng-click="save();" >Register Patient</a>
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
