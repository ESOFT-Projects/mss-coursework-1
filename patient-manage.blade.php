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

.mail-nav {


    width: 40%;

}

</style>


</head>

<body class="sticky-header" ng-controller="PatientManageController" >

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
                        Patient Manage
                    </header>



            <div class="mail-box">

                <section class="mail-box-info">
                    <header class="header">


                             <h4>Patient Details&nbsp;<i ng-if="the_runner.spinner" style="color:#ffffff;" class="fa fa-spinner fa-spin"></i></h4>


                        <div class="btn-toolbar">

                        </div>

                    </header>

                    <section class="mail-list">




                        <form class="form-horizontal" role="form">
                            <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Symptoms</label>
                                 <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <textarea rows="3" class="form-control" style="resize:none;" ng-model="the_runner.symptoms" ></textarea>
										<p class="help-block" ng-if="the_validator.error_symptoms" >This field is required.</p>
                                    </div>
                            </div>
                            <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Diagnosis</label>
                                 <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <textarea rows="3" class="form-control" style="resize:none;" ng-model="the_runner.diagnosis" ></textarea>
										<p class="help-block" ng-if="the_validator.error_diagnosis" >This field is required.</p>
                                    </div>
                            </div>
                            <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                                <label for="exampleInputEmail1">Pharmacy</label>
                                 <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <textarea rows="3" class="form-control" style="resize:none;" ng-model="the_runner.pharmacy" ></textarea>
										<p class="help-block" ng-if="the_validator.error_pharmacy" >This field is required.</p>
                                    </div>
                            </div>






                        </form>


              <div class="well"  >
                <div  >
                  <div class="row"   >

                      <div class="col-md-4">

                          <div >
                            <input type="text" placeholder="Medicine" ng-model="medicine_item.title"  class="form-control"  >

                          </div>


                      </div>
                      <div class="col-md-4">
                        <div class="col-md-4">
                          <label class="control-label" >Qty.</label>
                        </div>
                        <div class="col-md-8">
                          <input type="number" class="form-control" id="qty" name="qty" placeholder="Qty"   ng-model="medicine_item.product_qty" min="0" >
                        </div>
                      </div>

                     <div class="col-md-4" >

                         <button type="button" class="btn btn-primary" ng-click="add_medicine();" ><i class="fa fa-plus"></i></button>

                     </div>

                 </div>
                 <table class="table table-striped">
                   <thead>
			         <td style="text-align:center;" >ID</td>
			         <td style="text-align:center;" >MEDICINE</td>

                     <td style="text-align:center;" >QTY</td>

                     <td style="text-align:center;" >ACTIONS</td>
                   </thead>
                   <tbody>
                     <tr ng-repeat="product in the_runner.medicine_items track by $index">
                       <td style="text-align:center;" >@{{$index+1}}</td>
                       <td style="text-align:center;" >@{{product.title}}</td>

                       <td style="text-align:center;" >@{{product.product_qty}}</td>

                       <td style="text-align:center;" ><button type="button" class="btn btn-danger" ng-click="remove_medicine($index)"  ><i class="fa fa-trash-o"></i></button></td>
                     </tr>
                   </tbody>
                 </table>
<p class="help-block" ng-if="the_validator.error_medicine_items" >No medicines added.</p>
               </div>
			 </div>


              <div class="well"  >
                <div  >
                  <div class="row"   >

                      <div class="col-md-8">

                          <div >
                            <input type="text" placeholder="Medicine" ng-model="medicine_report.title"  class="form-control"  >

                          </div>


                      </div>


                     <div class="col-md-4" >

                         <button type="button" class="btn btn-primary" ng-click="add_report();" ><i class="fa fa-plus"></i></button>

                     </div>

                 </div>
                 <table class="table table-striped">
                   <thead>
			         <td style="text-align:center;" >ID</td>
			         <td style="text-align:center;" >TITLE</td>
                     <td style="text-align:center;" >ACTIONS</td>
                   </thead>
                   <tbody>
                     <tr ng-repeat="product in the_runner.medicine_reports track by $index">
                       <td style="text-align:center;" >@{{$index+1}}</td>
                       <td style="text-align:center;" >@{{product.title}}</td>


                       <td style="text-align:center;" ><button type="button" class="btn btn-danger" ng-click="remove_report($index)"  ><i class="fa fa-trash-o"></i></button></td>
                     </tr>
                   </tbody>
                 </table>
<p class="help-block" ng-if="the_validator.error_medicine_reports" >No reports added.</p>
               </div>
			 </div>



   <form class="form-horizontal" role="form">
<div class="col-sm-12">
  <div class="form-group" style="padding-left:5px;padding-right:5px;" >
                             <a type="button" class="btn btn-primary" ng-click="save();" >Submit Data</a>

                            </div>
</div>
</form>
                    </section>


                </section>
                <aside class="mail-nav mail-nav-bg-color">
                    <header class="header">
					  <div class="pull-right">
                        <a class="btn btn-success btn-sm" style="margin-top:10px;margin-right:5px;" ><i class="fa fa-print"></i> Report One</a>
                        <a class="btn btn-success btn-sm" style="margin-top:10px;margin-right:5px;" ><i class="fa fa-print"></i> Report Two</a>
					  </div>
					  <h4>History&nbsp;<i ng-if="the_runner.spinner" style="color:#ffffff;" class="fa fa-spinner fa-spin"></i></h4>



					</header>

                    <div class="mail-nav-body">


                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">



                                    <ul class="p-info">
                                        <li>
                                            <div class="title">Name</div>
                                            <div class="desk">Nishantha Hewawissa</div>
                                        </li>
                                        <li>
                                            <div class="title">NIC</div>
                                            <div class="desk">199117800208</div>
                                        </li>
                                        <li>
                                            <div class="title">Address</div>
                                            <div class="desk">Kandy SL</div>
                                        </li>
                                        <li>
                                            <div class="title">Contact</div>
                                            <div class="desk">0123456789</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                <h4  >Latest Diagnosis</h4>
                                  <div class="well" style="width:100%;" >
                                    <textarea style="width:100%;height:150px;;overflow: scroll;resize:none;"   readonly  ></textarea>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                <h4  >Prescriptions</h4>
                                  <div class="well" style="width:100%;" >
                                    <textarea style="width:100%;height:150px;;overflow: scroll;resize:none;"   readonly  ></textarea>
                                  </div>
                                </div>
                            </div>
                        </div>


                    </div>

                </aside>



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
