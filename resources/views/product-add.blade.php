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

<body class="sticky-header" ng-controller="ProductController" >

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
                        Add New Product
                    </header>

                    <div class="panel-body">



                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Title</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" ng-model="the_runner.title" >
                                    <p class="help-block" ng-if="the_validator.error_title">This field required</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Category</label>
                                <div class="col-lg-10">
                                    <select class="form-control" ng-model="the_runner.category_id" >
									<option value="">Select Category</option>
									<option ng-repeat="category in categories" value="@{{category.category_id}}">@{{category.title}}</option>
									</select>
                                    <p class="help-block" ng-if="the_validator.error_category" >This field required</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Brand</label>
                                <div class="col-lg-10">
                                    <select class="form-control" ng-model="the_runner.brand_id" >
									<option value="">Select Brand</option>
									<option ng-repeat="brand in brands" value="@{{brand.brand_id}}">@{{brand.title}}</option>
									</select>
                                    <p class="help-block" ng-if="the_validator.error_brand" >This field required</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Model</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" ng-model="the_runner.model" >
                                    <p class="help-block" ng-if="the_validator.error_model" >This field required</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Stock (#UNITS)</label>
                                <div class="col-lg-10">
                                    <input type="number" class="form-control" min="0" ng-model="the_runner.units" >
                                    <p class="help-block" ng-if="the_validator.error_stock" >This field required</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Price</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" ng-model="the_runner.price" >
                                    <p class="help-block" ng-if="the_validator.error_price" >This field required</p>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <button type="submit" class="btn btn-primary" ng-click="save();" >Add Product</button>
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
