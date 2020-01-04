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
  
  
  <style>
.modal-dialog {

    width: 90%;
 

} 
.mail-nav {

  
    width: 40%;

} 
  </style>
  
</head>

<body class="sticky-header" ng-controller="ReportTestController" >
 
 
  
 
 
 
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
					Appointments
							<div class="pull-right" style="margin-top:-5px; ">
                              <form class="form-inline" role="form" style="display:inline;margin-right:0px;">
                             							  
                 							  
                                <div class="form-group">							 
                                  <input type="text" placeholder="Keywords" class="form-control input-sm m-bot15" style="width:200px;display:inline;text-align:right;" ng-model="the_runner.keyword"  />
                                </div>  

                                 <div class="form-group">							 
                                 <a type="button" class="btn btn-primary btn-sm m-bot15" ng-click="export_pdf();" ><i class='fa fa-print'></i>&nbsp;EXPORT PDF</a>
                                </div>       

								
                              </form>							
                            </div>	
                    </header>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" action="{{ route('register') }}" method="post" >
                            <?php
                              if(count($errors)>0){
				                echo '<div class="alert alert-danger" style="width:100%;text-align:center;margin-left:auto;margin-right:auto;" >';	
	                              foreach($errors->all() as $error){	              	  								
		                            echo $error.'<br>';	              
	                              }
				                echo '</div>';
                              } 
                            ?> 						
             <table class="table table-striped">
              <thead>	  
                <td style="text-align:center;" >NO</td>
                <td style="text-align:center;" >SPECIALIZATION AREA</td> 				
                <td style="text-align:center;" >APPOINTMENT COUNT</td>	  
                <td style="text-align:center;" >CANCELLED COUNT</td>	  				
                												
              </thead>	  
              <tbody>	  			  
                <tr ng-repeat="appointment in appointments">
                <td style="text-align:center;" >@{{$index+1}}</td>		
                <td style="text-align:center;" >@{{appointment.area}}</td>								
                <td style="text-align:center;" >@{{appointment.active_count}}</td>								
                <td style="text-align:center;" >@{{appointment.cancelled_count}}</td>						
                	  
                </tr>	  
              </tbody>	  			  				
            </table>     

            			
			
                        </form>
                    </div>
                </section>
            </div>
			
			
			
<div id="containerx" style="width:100%; height:400px;"></div>			
			
			
			
			
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


<!-- HighCharts-->
<script src="http://123.231.52.110/cmhi/js/highcharts.js"></script>

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

<!--common scripts for all pages-->
<script src="http://123.231.52.110/asceso/js/scripts.js"></script>

<script type="text/javascript" src="http://123.231.52.110/asceso/js/app_home.js"></script>

</body>
</html>
