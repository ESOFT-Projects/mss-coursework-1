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
  <link rel="stylesheet" type="text/css" href="http://123.231.52.110/asceso/js/gritter/css/jquery.gritter.css" />   
  
  <!--range picker-->
  <link rel="stylesheet" href="http://123.231.52.110/asceso/css/rangepicker/daterangepicker.css">  
  
  <link href="http://123.231.52.110/asceso/css/style.css" rel="stylesheet">
  <link href="http://123.231.52.110/asceso/css/style-responsive.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="http://123.231.52.110/asceso/js/html5shiv.js"></script>
  <script src="http://123.231.52.110/asceso/js/respond.min.js"></script>
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
 
                <div class="col-sm-12">
                <section class="panel">
                <header class="panel-heading">
                    Doctor Payment Report
                    <span class="tools pull-right">
                        <a href="javascript:;" class="fa fa-chevron-down"></a>
                        <a href="javascript:;" class="fa fa-times"></a>
                     </span>
                </header>
                <div class="panel-body">
                <div class="adv-table editable-table ">
                <div class="clearfix">
                    <div class="btn-group">
                        <button id="editable-sample_new" class="btn btn-primary">
                            Refresh <i class="fa fa-refresh"></i>
                        </button>
                    </div>
                    <div class="btn-group pull-right">
                        <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">Export <i class="fa fa-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="#">Print</a></li>
                            <li><a href="#">Save as PDF</a></li>
                            <li><a href="#">Export to Excel</a></li>
                        </ul>
                    </div>
                </div>
                <div class="space15"></div>
                <table class="table table-striped table-hover table-bordered" id="editable-sample">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>Doctor Name</th>
                    <th>Amount to be Paid</th>
                </tr>
                </thead>
                <tbody>
                <tr class="">
                    <td>1</td>
                    <td>Jayantha Perera</td>
                    <td>LKR 235000.00</td>
                </tr>
                <tr class="">
                    <td>2</td>
                    <td>Duminda Samarasinghe</td>
                    <td>LKR 81700.00</td>
                </tr>
                <tr class="">
                    <td>3</td>
                    <td>Manjula Karalliyadde</td>
                    <td>LKR 498000.00</td>
                </tr>
                <tr class="">
                    <td>4</td>
                    <td>Catriona Jayasundera</td>
                    <td>LKR 400000.00</td>
                </tr>
                <tr class="">
                    <td>5</td>
                    <td>Kumar Wickramasinghe</td>
                    <td>LKR 473000.00</td>
                </tr>
                <tr class="">
                    <td>6</td>
                    <td>Mohan Wijerathne</td>
                    <td>LKR 317400.00</td>
                </tr>
                <tr class="">
                    <td>7</td>
                    <td>Don Wijerathne</td>
                    <td>LKR 19980.00</td>
                </tr>
                <tr class="">
                    <td>8</td>
                    <td>Thusitha George</td>
                    <td>LKR 46740.00</td>
                </tr>
                <tr class="">
                    <td>9</td>
                    <td>Chirath Ranathunga</td>
                    <td>LKR 3565.00</td>
                </tr>
                <tr class="">
                    <td>10</td>
                    <td>Upali Ranasinghe</td>
                    <td>LKR 9700.00</td>
                </tr>
                <tr class="">
                    <td>11</td>
                    <td>Eshan Hettiarachchi</td>
                    <td>LKR 214900.00</td>
                </tr>				
				
				
				
				
                </tbody>
                </table>
                </div>
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
    <script type="text/javascript" src="http://123.231.52.110/asceso/js/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.js"></script>
    <script src="http://rawgit.com/angular-ui/angular-google-maps/2.0.X/dist/angular-google-maps.js?key=AIzaSyBBGwrHXcGj52OZQiggdrefxVDnj-Jm2Qc"></script>
	<script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyBBGwrHXcGj52OZQiggdrefxVDnj-Jm2Qc'></script>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="http://123.231.52.110/asceso/js/jquery-1.10.2.min.js"></script>
<script src="http://123.231.52.110/asceso/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="http://123.231.52.110/asceso/js/jquery-migrate-1.2.1.min.js"></script>
<script src="http://123.231.52.110/asceso/js/bootstrap.min.js"></script>
<script src="http://123.231.52.110/asceso/js/modernizr.min.js"></script>
<script src="http://123.231.52.110/asceso/js/jquery.nicescroll.js"></script>

<!--gritter script-->
<script type="text/javascript" src="http://123.231.52.110/asceso/js/gritter/js/jquery.gritter.js"></script>

<!--calendar--> 
<script src="http://123.231.52.110/asceso/js/ui-bootstrap-tpls.min.js"></script> 

<!--moment--> 
<script src="http://123.231.52.110/asceso/js/moment.js"></script> 

<!--range picker-->
<script src="http://123.231.52.110/asceso/css/rangepicker/angular-messages.js"></script>
<script src="http://123.231.52.110/asceso/css/rangepicker/daterangepicker.js"></script>	
<script src="http://123.231.52.110/asceso/css/rangepicker/angular-daterangepicker.js"></script>

<!--data table-->
<script type="text/javascript" src="js/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/data-tables/DT_bootstrap.js"></script>

<!--script for editable table-->
<script src="js/editable-table.js"></script>

 
<script>
    jQuery(document).ready(function() {
        EditableTable.init();
    });
</script>

<!--common scripts for all pages-->
<script src="http://123.231.52.110/asceso/js/scripts.js"></script>

<script type="text/javascript" src="http://123.231.52.110/asceso/js/app_home.js"></script>

</body>
</html>
