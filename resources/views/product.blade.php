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

<body class="sticky-header" ng-controller="ProductController" >



<div id="edit-product" class="modal" role="dialog" data-backdrop="static" data-keyboard="false" style="z-index:1049;width:100%;" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
	    <div class="modal-title">@{{the_runner.title}}
        <button type="button" class="close" data-dismiss="modal" ng-click="flush()">&times;</button>
		</div>

      </div>
      <div class="modal-body">

                       <form class="form-horizontal"  >

                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Title</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <input id="name" type="text" class="form-control"    ng-model="the_runner.title"   >

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Category</label>
                                <div class="col-lg-9">
                                <select class="form-control" ng-model="the_runner.category_id" >
									<option value="">Select Category</option>
									<option ng-repeat="category in categories" value="@{{category.category_id}}">@{{category.title}}</option>
									</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Brand</label>
                                <div class="col-lg-9">
                                    <select class="form-control" ng-model="the_runner.brand_id" >
									<option value="">Select Brand</option>
									<option ng-repeat="brand in brands" value="@{{brand.brand_id}}">@{{brand.title}}</option>
									</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Model</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <input type="text" class="form-control" ng-model="the_runner.model" >

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Units</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <input type="number" class="form-control" min="0" ng-model="the_runner.units" >

                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-lg-3 col-sm-3 control-label">Price</label>
                                <div class="col-lg-9">
                                    <div class="iconic-input">
                                        <i class="fa fa-user"></i>
                                        <input type="text" class="form-control" ng-model="the_runner.price" >

                                    </div>
                                </div>
                            </div>








                            <div class="form-group">
                                <div class="col-lg-offset-3 col-lg-9">
                                    <button type="button" class="btn btn-sm btn-primary" ng-click="update_product();" >Update</button>
									<button type="button" class="btn btn-sm btn-danger"  data-dismiss="modal" ng-click="flush()" >Close</button>
									<i ng-if="the_runner.spinner" style="color:#374152;" class="fa fa-spinner fa-spin fa-2x"></i>
                                </div>
                            </div>

		<div class="alert alert-info alert-dismissable" style="text-align:center;" ng-show=" the_runner.return_response.length > 0 " ><a class="close"  area-label="close" ng-click=" the_runner.return_response='' " ><i class="fa fa-times"></i></a><i class="fa fa-info-circle"></i>&nbsp;&nbsp;@{{the_runner.return_response}}</div>

                        </form>

	  </div>
      <div class="modal-footer" style="text-align:center;" >
	  </div>
    </div>
  </div>
</div>



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
					Products
							<div class="pull-right" style="margin-top:-5px; ">
                              <form class="form-inline" role="form" style="display:inline;margin-right:0px;">

                               <!-- <div class="form-group">
                            <select class="form-control input-sm m-bot15" style="text-align:right;display:inline;" ng-model="the_runner.where_field" >
                                <option   value="name" selected="selected"  >Name</option>
								<option   value="email"  >Email</option>
								<option   value="company_id" >Company</option>
                                <option   value="department_id"   >Department</option>
                                <option   value="designation"   >Designation</option>
                                <option   value="employee_number"   >Employee Number</option>
                                <option   value="nic"   >NIC</option>
                            </select>
                                </div>    -->
                                <div class="form-group">
                                  <input type="text" placeholder="Keywords" class="form-control input-sm m-bot15" style="width:200px;display:inline;text-align:right;" ng-model="the_runner.keyword"  />
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
                <td style="text-align:center;" >PRODUCT ID</td>
                <td style="text-align:center;" >CATEGORY</td>
                <td style="text-align:center;" >BRAND</td>
                <td style="text-align:center;" >TITLE</td>
                <td style="text-align:center;" >QUANTITY</td>
                <td style="text-align:center;" >PRICE</td>
                <td style="text-align:center;" >ACTION</td>
              </thead>
              <tbody>
                <tr ng-repeat="product in products">
                <td style="text-align:center;" >@{{product.product_id}}</td>
                <td style="text-align:center;" >@{{product.category_title}}</td>
                <td style="text-align:center;" >@{{product.brand_title}}</td>
                <td style="text-align:center;" >@{{product.title}}</td>
                <td style="text-align:center;" >@{{product.units}}</td>
                <td style="text-align:center;" >@{{product.price}}</td>


                <td style="text-align:center;" >
				<button type="button" class="btn btn-sm btn-primary" ng-click="set_product(product);" data-toggle="modal" data-target="#edit-product" ><i class="fa fa-edit"></i></button>

				<button type="button" class="btn btn-sm btn-danger" ng-click="delete_product(product);"  ><i class="fa fa-trash-o"></i></button>
				</td>
                </tr>
              </tbody>
            </table>

            <div class="col-md-12" style="text-align:center;">
              <products-pagination></products-pagination>
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
