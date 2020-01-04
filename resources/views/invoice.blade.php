<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">
  @include('layouts.title-document')
  <!--icheck-->
  <link href="http://mss.test/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="http://mss.test/js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="http://mss.test/js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="http://mss.test/js/iCheck/skins/square/blue.css" rel="stylesheet">

  <!--dashboard calendar-->
  <link href="http://mss.test/css/clndr.css" rel="stylesheet">

  <!--gritter css-->
  <link rel="stylesheet" type="text/css" href="http://mss.test/js/gritter/css/jquery.gritter.css" />

  <!--range picker-->
  <link rel="stylesheet" href="http://mss.test/css/rangepicker/daterangepicker.css">

  <!--common-->
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
  display: none;
  position: absolute;
  top: 28px;
  left: 0;
  right: 0;
  z-index: 10;
  background: #ffffff;
  box-shadow:0 3px 3px rgba(0,0,0,.16),0 3px 3px rgba(0,0,0,.23);
  text-align:left;
  overflow-y:scroll;
  max-height:300px;
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

<body class="sticky-header" ng-controller="InvoiceController" >

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
		<!--@include('layouts.title')-->
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">



            <form role="form" class="form-horizontal" name="admin_add_order_form" novalidate >
              <div class="form-group">
                <label class="col-sm-2 control-label">Order Date</label>
                <div class="col-sm-10">
                  <div class='input-group date' style="width:50%;" >
                    <input required class="form-control" id="timestamp" name="timestamp" ng-model="the_runner.timestamp" is-open="the_common.calendar_opened" datetime-picker="yyyy-MM-dd HH:mm:ss" required  />
                    <div class="error-msg" ng-hide="admin_add_order_form.timestamp.$valid" >* Required</div>
                    <span class="input-group-addon" ng-click="openCalendar($event, 'picker3')" style="background:#ffffff;cursor:pointer;"><a><i class="fa fa-calendar"></i></a>
                    </span>
                    </span>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">Recipient Name</label>
                <div class="col-sm-10">
                  <div class='input-group date' style="width:50%;" >
                    <input type="text" class="form-control" id="recipient" name="recipient" placeholder="Recipient" ng-model="the_runner.recipient" required  >
                    <div class="error-msg" ng-hide="admin_add_order_form.recipient.$valid" >* Required</div>
                    <!--<span class="input-group-addon" style="background:#ffffff;"><i class="fa fa-user-circle"></i>
                    </span>-->
                  </div>
                </div>
              </div>
              <div class="well">
                <div class="container-fluid">
                  <div class="row" style="text-align:center;padding-bottom:10px;" >
                    <div class="row">
                      <div class="col-md-6">
                        <div class="col-md-6">
                          <div class="search" >
                            <input type="text" placeholder="What are you looking for ?" ng-model="item_core.keyword"  class="form-control"  >
                            <ul class="search-ac" ng-show=" liteQ.length > 0 " >
                              <li ng-repeat="product in liteQ" ng-click="set_liteq(product)" ><a>@{{product.title}}<br><span>@{{product.category_title}}</span></a></li>
                            </ul>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <kbd ng-show="item_core.product_title.length > 0"><label class="control-label" >@{{item_core.product_title}}</label><kbd>
                        </div>
                      </div>
                      <div class="col-md-2">
                        <div class="col-md-4">
                          <label class="control-label" >Qty.</label>
                        </div>
                        <div class="col-md-8">
                          <input type="number" class="form-control" id="qty" name="qty" placeholder="Qty"  ng-change="set_product_qty()" ng-model="item_core.product_qty" >
                        </div>
                      </div>
                     <div class="col-md-3">
                       <div class="col-md-4">
                         <label class="control-label" >Total</label>
                       </div>
                       <div class="col-md-8">
                         <input type="number" step="0.01" min="0.00" class="form-control" ng-model="item_core.total"  style="background:#f5f5f5;" >
                       </div>
                     </div>
                     <div class="col-md-1" >
                       <div class="col-md-12">
                         <button type="button" class="btn btn-primary" ng-click="add_cart();" ><i class="fa fa-plus"></i></button>
                       </div>
                     </div>
                   </div>
                 </div>
                 <table class="table table-striped">
                   <thead>
			         <td style="text-align:center;" >PRODYCT TITLE</td>
                     <td style="text-align:center;" >PRICE</td>
                     <td style="text-align:center;" >QTY</td>
                     <td style="text-align:center;" >TOTAL</td>
                     <td style="text-align:center;" >ACTIONS</td>
                   </thead>
                   <tbody>
                     <tr ng-repeat="product in the_runner.cart_items track by $index">
                       <td style="text-align:center;" >@{{product.product_title}}</td>
                       <td style="text-align:center;" >@{{product.price}}</td>
                       <td style="text-align:center;" >@{{product.product_qty}}</td>
                       <td style="text-align:center;" >@{{product.total}}</td>
                       <td style="text-align:center;" ><button type="button" class="btn btn-danger" ng-click="remove_cart($index)"  ><i class="fa fa-trash-o"></i></button></td>
                     </tr>
                   </tbody>
                 </table>
               </div>
			 </div>
             <div class="form-group">
               <label class="col-sm-2 control-label">Sub Total</label>
               <div class="col-sm-10">
                 <div class='input-group date' style="width:50%;" >
                   <input type="text"  class="form-control" placeholder="Sub Total" style="background:#ffffff;" ng-model="the_runner.sub_total"  >
                  <!-- <span class="input-group-addon" style="background:#ffffff;"><i class="fa fa-rupee"></i>
                   </span>-->
                 </div>
               </div>
             </div>
             <div class="form-group">
               <label class="col-sm-2 control-label">VAT (%)</label>
               <div class="col-sm-10">
                 <div class='input-group date' style="width:50%;" >
                   <input type="text"  class="form-control" placeholder="VAT" style="background:#ffffff;" ng-model="the_runner.vat_percentage"  >
                  <!-- <span class="input-group-addon" style="background:#ffffff;"><i class="fa fa-rupee"></i>
                   </span>-->
                 </div>
               </div>
             </div>
             <div class="form-group">
               <label class="col-sm-2 control-label">Discount (%)</label>
               <div class="col-sm-10">
                 <div class='input-group date' style="width:50%;" >
                   <input type="number" step="0.01" min="0.00" class="form-control" placeholder="Discount" ng-model="the_runner.discount_percentage"  >
                  <!-- <span class="input-group-addon" style="background:#ffffff;"><i class="fa fa-rupee"></i>
                   </span>-->
                 </div>
               </div>
             </div>
             <div class="form-group">
               <label class="col-sm-2 control-label">Net Total</label>
               <div class="col-sm-10">
                 <div class='input-group date' style="width:50%;" >
                   <input type="text" class="form-control" placeholder="Net Total" style="background:#ffffff;"  ng-model="the_runner.net_total_discount"   >
                  <!-- <span class="input-group-addon" style="background:#ffffff;"><i class="fa fa-rupee"></i>
                   </span>-->
                 </div>
               </div>
             </div>
             <div class="form-group">
               <label class="col-sm-2 control-label">Paid</label>
               <div class="col-sm-10">
                 <div class='input-group date' style="width:50%;" >
                   <input type="number" class="form-control" id="paid" name="paid" step="0.01" min="0.00" placeholder="Paid" ng-model="the_runner.paid"   >
                  <!-- <span class="input-group-addon" style="background:#ffffff;"><i class="fa fa-rupee"></i>
                   </span>-->
                 </div>
               </div>
             </div>
             <div class="form-group">
               <label class="col-sm-2 control-label">Due</label>
               <div class="col-sm-10">
                 <div class='input-group date' style="width:50%;" >
                   <input type="text"  class="form-control" placeholder="Due" style="background:#ffffff;" ng-model="the_runner.due"  >
                  <!-- <span class="input-group-addon" style="background:#ffffff;"><i class="fa fa-rupee"></i>
                   </span>-->
                 </div>
               </div>
             </div>

           </form>




        </div>
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


<!-- HighCharts-->
<script src="http://mss.test/js/highcharts.js"></script>


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
