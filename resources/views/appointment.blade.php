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

<style>
/**************SEARCH BOX*************/

.search {
  position: relative;
  margin: 0 auto;
  width: ;
}

.search input:focus + .search-ac {
  display: block;
}

.search-ac {
  display: block;
  position: absolute;
  top: 48px;


  z-index: 10;
  background: #ffffff;
  box-shadow:0 3px 3px rgba(0,0,0,.16),0 3px 3px rgba(0,0,0,.23);
  text-align:left;
  overflow-y:scroll;
  max-height:300px;
  width:200px;

}
.search-ac:hover {
  display: block;
}
.search-ac li {
  display: block;
  margin-left:-40px;
  border-bottom:1px solid #ffffff;
  cursor:pointer;
}
.search-ac li:first-child {
  margin-top: ;
}

.search-ac a {
  display: block;
  position: relative;
  padding:3px;
  color: #000000;
  font-weight: 500;
  text-decoration: none;
  border-radius: 0px;
}
.search-ac a span {
  font-weight: 200;
  color:#999999;
}

.search-ac a:before {
  opacity: 0.8;
  position: absolute;
  top: 50%;
  right: 10px;
  margin-top: -9px;
  width: 18px;
  height: 18px;
  font-family: 'FontAwesome',"Roboto Condensed";
  content:'\f138';
  color:#999999;
}

.search-ac a:hover {
  color: #000000;
  background: #f5f5f5;
}

</style>


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
                        Make Appointment
						<div class="pull-right">




                            <form class="form-inline" role="form" style="display:inline;margin-right:0px;">

                                <div class="form-group">
                            <select class="form-control input-sm m-bot15" style="text-align:right;display:inline;" ng-model="the_runner.where_field" >
							    <option value="" selected="selected" >Select an option</option>
                                <option ng-repeat="category in search_categories" value="@{{category.category_id}}"   >@{{category.title}}</option>
                            </select>
                                </div>
                                <div class="form-group">
                                  <input type="text" placeholder="Keywords" class="form-control input-sm m-bot15" style="width:200px;display:inline;text-align:right;" ng-model="the_runner.keyword"  />

							<ul class="search-ac" ng-show=" patients.length > 0 " id="patients-dropdown"  >
                              <li ng-repeat="patient in patients" ng-click="set_patient(patient)" ><a>@{{patient.name}}<br><span>@{{patient.nic}}</span></a></li>
                            </ul>


                                </div>

                                 <div class="form-group">
                                 <a type="button" class="btn btn-primary btn-sm m-bot15" ng-click="update();" ><i class='fa fa-edit'></i>&nbsp;UPDATE</a>
                                </div>
                                 <div class="form-group">
                                 <a type="button" class="btn btn-primary btn-sm m-bot15" href="patient-register"  ><i class='fa fa-user'></i>&nbsp;NEW</a>
                                </div>

                              </form>






						</div>







                    </header>

                    <div class="panel-body">









                        <form class="form-horizontal" role="form"  >

	 <div class="row">
	                    <div class="col-sm-4">
                            <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Name</label>
                                 <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <input ng-model="the_runner.name" id="name" type="text" class="form-control" name="name" placeholder="Name">
										<p class="help-block" ng-if="the_validator.error_name" >This field is required.</p>
                                    </div>
                            </div>




						</div>
	  <div class="col-sm-4">
 <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">NIC</label>
                                    <div class="iconic-input">
                                        <i class="fa fa-location-arrow"></i>
                                        <input ng-model="the_runner.nic" id="address" type="text" class="form-control" name="address" placeholder="Address">
										<p class="help-block" ng-if="the_validator.error_nic" >This field is required.</p>
                                    </div>
                            </div>
	  </div>
<div class="col-sm-4">
  <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Gender</label>
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




 </div>
 <div class="row">

	                    <div class="col-sm-4">
                            <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Date of Birth</label>
                                  <div class="iconic-input">
                                        <i class="fa fa-calendar"></i>
                                         <input ng-model="the_runner.dob"   class="form-control"  placeholder="Date of Birth" is-open="calendar_two_opened" datepicker-popup="yyyy-MM-dd" ng-click="openCalendarTwo($event)"   >
										<p class="help-block" ng-if="the_validator.error_dob" >This field is required.</p>
                                    </div>
                            </div>




						</div>
	  <div class="col-sm-4">
 <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Contact Number</label>
                                      <div class="iconic-input">
                                        <i class="fa fa-info"></i>
                                        <input ng-model="the_runner.contact" id="nic" type="text" class="form-control" name="nic" placeholder="NIC Number">
										<p class="help-block" ng-if="the_validator.error_contact" >This field is required.</p>
                                    </div>
                            </div>
	  </div>
<div class="col-sm-4">
  <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Address</label>
                                     <div class="iconic-input">

                           <textarea ng-model="the_runner.address" rows="3" class="form-control" style="resize:none;"></textarea>
						   <p class="help-block" ng-if="the_validator.error_address" >This field is required.</p>
                                    </div>
                            </div>
</div>

</div>

<hr/>








<div class="row">





	                    <div class="col-sm-3">
                            <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Date</label>
                                        <input ng-model="the_runner.appointment_date"   class="form-control"  placeholder="Start Date" is-open="calendar_one_opened" datepicker-popup="yyyy-MM-dd" ng-click="openCalendarOne($event)"   >
                            </div>
						</div>
	                    <div class="col-sm-3">
                            <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Time</label>
                                 <select class="form-control" ng-model="the_runner.appointment_time_slot" ng-disabled="time_slots.length==0" >
								 <option value="">Select Time</option>
								 <option ng-repeat="slot in time_slots" value="@{{slot.id}}">@{{slot.start_at}} @{{slot.end_at}}</option>
								 </select>
                            </div>
						</div>
	                    <!--<div class="col-sm-3">
                          <div class="form-group" style="padding-left:5px;padding-right:5px;margin-top:-8px;" >
                            <timepicker ng-model="the_runner.appointment_time" show-meridian="ismeridian"></timepicker>
                          </div>
	                    </div>-->
                        <div class="col-sm-3">
                          <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                            <label for="exampleInputEmail1">Specialization Area</label>
                            <select ng-model="the_runner.specialization_id" class="form-control" >
							<option value="">Select an option</option>
							  <option ng-repeat="area in areas" value="@{{area.specialization_id}}" >@{{area.area}}</option>
							</select>
                          </div>
                        </div>
                        <div class="col-sm-3">
                          <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                            <label for="exampleInputEmail1">Doctor</label>
                            <select ng-model="the_runner.doctor_id" class="form-control" >
							<option value="">Select an option</option>
							  <option ng-repeat="doctor in doctors" value="@{{doctor.doctor_id}}" >@{{doctor.first_name}} @{{doctor.last_name}}</option>
							</select>
                          </div>
                        </div>





<div class="col-sm-12">
  <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                             <a type="button" class="btn btn-primary" ng-click="save_appointment();" >Create Appointment</a>

                            </div>
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
