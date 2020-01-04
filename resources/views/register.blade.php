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

<body class="sticky-header" ng-controller="RegisterController" >

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
                        Register User
                    </header>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" action="register" method="post" enctype="multipart/form-data" >
                            <?php
                              if(count($errors)>0){
				                echo '<div class="alert alert-danger" style="width:100%;text-align:center;margin-left:auto;margin-right:auto;" >';
	                              foreach($errors->all() as $error){
		                            echo $error.'<br>';
	                              }
				                echo '</div>';
                              }
                            ?>
@if(session('success'))
	<div class="alert alert-success" style="text-align:center;margin-left:auto;margin-right:auto;" >
    {{session('success')}}
	</div>
@endif
                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Name</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <input id="name" type="text" class="form-control" name="name" placeholder="Name">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Email</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-envelope"></i>
                                        <input id="email" type="email" class="form-control" name="email" placeholder="Email">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Address</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-location-arrow"></i>
                                        <input id="address" type="text" class="form-control" name="address" placeholder="Address">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">NIC Number</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-info"></i>
                                        <input id="nic" type="text" class="form-control" name="nic" placeholder="NIC Number">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Profile Picture</label>
                                <div class="col-lg-9">


                                        <input type="file" id="avatar" name="avatar" class="form-control" >

                                </div>
                            </div>


                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Company</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-building-o"></i>
                            <select class="form-control" style="text-align:right;" ng-model="the_runner.company_id" id="company" name="company"  >
                                <option value="">-- Select an option --</option>
                                <option ng-repeat="company in companies" value="@{{ company.company_id }}" ng-selected=" the_runner.company_id == company.company_id  "   >@{{company.name}}</option>
                            </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Department</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-building-o"></i>
                            <select class="form-control" style="text-align:right;" ng-model="the_runner.department_id" id="department" name="department" >
                                <option value="">-- Select an option --</option>
                                <option ng-repeat="department in departments" value="@{{ department.department_id }}" ng-selected=" the_runner.department_id == department.department_id  "   >@{{department.title}}</option>
                            </select>
                                    </div>
                                </div>
                            </div>

                           <!-- <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Designation</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-briefcase"></i>
                            <select class="form-control" style="text-align:right;" ng-model="the_runner.designation_id" id="designation" name="designation" >
                                <option value="">-- Select an option --</option>
                                <option ng-repeat="designation in designations" value="designation.title" ng-selected="the_runner.designation_id == designation.designation_id"   >@{{designation.title}}</option>
                            </select>
                                    </div>
                                </div>
                            </div> -->


                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Designation</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-users"></i>
                            <select class="form-control" style="text-align:right;" ng-model="the_runner.designation_id" id="designation" name="designation" >

                                <option ng-repeat="designationx in designations" value="@{{designationx.title}}" >@{{designationx.title}}</option>

                            </select>
                                    </div>
                                </div>
                            </div>




                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Contact Number</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-phone"></i>
                                        <input id="contact" type="text" class="form-control" name="contact" placeholder="Contact Number">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Employee Number</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-info"></i>
                                        <input id="employee_number" type="text" class="form-control" name="employee_number" placeholder="Employee Number">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Shift / Group</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-users"></i>
                            <select class="form-control" style="text-align:right;" ng-model="the_runner.shift" id="shift" name="shift" >
                                <option value="">-- Select an option --</option>
                                <option   value="Genaral (Non Flex)"  >Genaral</option>

                            </select>
                                    </div>
                                </div>
                            </div>

                           <!-- <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Profile Picture</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-picture-o"></i>
                                        <input id="address" type="text" class="form-control" name="address" placeholder="Address">

                                    </div>
                                </div>
                            </div> -->

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Password</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-key"></i>
                                        <input type="password" name="password" autocomplete="off" id="password" class="form-control" placeholder="Password">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Confirm Password</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-key"></i>
                                        <input type="password" name="password_confirmation" autocomplete="off" id="password-confirm" class="form-control" placeholder="Confirm Password">
										<!--<p class="help-block">This field is required.</p>-->
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <button type="submit" class="btn btn-primary">Register</button>
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
