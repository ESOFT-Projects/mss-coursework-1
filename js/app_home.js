var app = angular.module('myApp', ['uiGmapgoogle-maps','ui.bootstrap','daterangepicker'],function($interpolateProvider) {
    $interpolateProvider.startSymbol('{{');
    $interpolateProvider.endSymbol('}}');
});

app.filter('trusted', ['$sce', function($sce) {
    var div = document.createElement('div');
    return function(text) {
        div.innerHTML = text;
        return $sce.trustAsHtml(div.textContent);
    };
}]);

app.filter('unsafe', function($sce) {
    return function(val) {
        return $sce.trustAsHtml(val);
    };
});

app.filter('orderObjectBy', function() {
  return function(items, field, reverse) {
    var filtered = [];
    angular.forEach(items, function(item) {
      filtered.push(item);
    });
    filtered.sort(function (a, b) {
      return (a[field] > b[field] ? 1 : -1);
    });
    if(reverse) filtered.reverse();
    return filtered;
  };
});

app.filter('trustedx', ['$sce', function($sce) {
	return function(text) {
		return $sce.trustAsHtml(text);
	};
}]);

app.directive('productsPagination', function(){
    return{
      restrict: 'E',
      template: '<ul class="pagination">'+
        '<li ng-disable="the_paginate.currentPage != 1"><a href="javascript:void(0)" ng-click="navigate(1);navigateUp();"><i class="fa fa-angle-double-left"></i> First</a></li>'+
        '<li ng-disable="the_paginate.currentPage != 1"><a href="javascript:void(0)" ng-click="navigate(the_paginate.currentPage-1);navigateUp();"><i class="fa fa-angle-left"></i> Prev</a></li>'+
        '<li ng-repeat="i in the_paginate.range" ng-class="{active : the_paginate.currentPage == i}">'+
            '<a href="javascript:void(0)" ng-click="navigate(i);navigateUp();">{{i}}</a>'+
        '</li>'+
        '<li ng-disable="the_paginate.currentPage != the_paginate.totalPages"><a href="javascript:void(0)" ng-click="navigate(the_paginate.currentPage+1);navigateUp();">Next <i class="fa fa-angle-right"></i></a></li>'+
        '<li ng-disable="the_paginate.currentPage != the_paginate.totalPages"><a href="javascript:void(0)" ng-click="navigate(the_paginate.totalPages);navigateUp();">Last <i class="fa fa-angle-double-right"></i></a></li>'+
      '</ul>'
    };
});





app.service('UP', function(){

    this.scrollTo = function(eID) {

    var startY = currentYPosition();
    var stopY = elmYPosition(eID);
    var distance = stopY > startY ? stopY - startY : startY - stopY;
    if (distance < 100) {
      scrollTo(0, stopY); return;
    }
    var speed = Math.round(distance / 100);
    if (speed >= 20) speed = 20;
      var step = Math.round(distance / 25);
      var leapY = stopY > startY ? startY + step : startY - step;
      var timer = 0;
    if (stopY > startY) {
      for ( var i=startY; i<stopY; i+=step ) {
        setTimeout("window.scrollTo(0, "+leapY+")", timer * speed);
        leapY += step; if (leapY > stopY) leapY = stopY; timer++;
      } return;
    }
    for ( var i=startY; i>stopY; i-=step ) {
      setTimeout("window.scrollTo(0, "+leapY+")", timer * speed);
      leapY -= step; if (leapY < stopY) leapY = stopY; timer++;
    }

    function currentYPosition() {
      if (self.pageYOffset) return self.pageYOffset;
      if (document.documentElement && document.documentElement.scrollTop)
        return document.documentElement.scrollTop;
      if (document.body.scrollTop) return document.body.scrollTop;
        return 0;
    }

    function elmYPosition(eID) {
      var elm = document.getElementById(eID);
      var y = elm.offsetTop;
      var node = elm;
      while (node.offsetParent && node.offsetParent != document.body) {
        node = node.offsetParent;
        y += node.offsetTop;
      } return y;
    }

  };

});

app.service('CRUD',function($http,$q){
    var data=undefined;
    this.execute=function(method,payload,url){
    var deferred=$q.defer();
    $http({
      url: url,
      method: method,
      data: payload,
      headers: { 'Content-Type': undefined},
      transformRequest: angular.identity
    }).success(function(response){
      data=response;
	  deferred.resolve(data);
    }).error(function(response) {
      data=response;
    });
    data=deferred.promise;
    return $q.when(data);
    };
});


app.service('AUTHTOKEN',function($http,$q){
	var data=undefined;
    this.execute=function(username,password){
    var deferred=$q.defer();
    var payload = new FormData();
	payload.append('grant_type','password');
	payload.append('client_id',localStorage.getItem('clientid'));
	payload.append('client_secret',localStorage.getItem('clientsecret'));
	payload.append('username',username);
	payload.append('password',password);

    $http({
      url: 'http://mss.test/oauth/token',
      method: 'POST',
      data: payload,
      headers: { 'Content-Type': undefined},
      transformRequest: angular.identity
    }).success(function(response){
      data=response;
	  deferred.resolve(data);
    }).error(function(response) {
      data=response;
	  alert('Token error. The user credentials were incorrect.');
    });
    data=deferred.promise;
    return $q.when(data);


    };

});

app.service('AUTHCLIENT',function($http,$q){
	var data=undefined;
    this.execute=function(username,password){
    var deferred=$q.defer();
    var datax = {
		'username':username,
		'password':password
	}
    $http({
      url: 'http://mss.test/oauth-client-me',
      method: 'POST',
      data: datax,
      headers: { 'Content-Type': 'application/json'},
    }).success(function(response){
      data=response;
	  deferred.resolve(data);
    }).error(function(response) {
      data=response;
	  alert('Token error. The user credentials were incorrect.');
    });
    data=deferred.promise;
    return $q.when(data);
    };

});


app.service('CRUDAPI',function($http,$q,AUTHTOKEN){

    var data=undefined;
    this.execute=function(method,payload,url){
    var deferred=$q.defer();
    $http({
      url: url,
      method: method,
      data: payload,
      headers: {
	    'Authorization':localStorage.getItem('auth')
	  },
      //transformRequest: angular.identity
    }).success(function(response){
      data=response;
	  deferred.resolve(data);
    }).error(function(response) {
      data=response;
    });
    data=deferred.promise;
    return $q.when(data);
    };



});

app.service('CRUDAPI2',function($http,$q,AUTHTOKEN){

    var data=undefined;
    this.execute=function(method,payload,url){
    var deferred=$q.defer();
    $http({
      url: url,
      method: method,
      data: payload,
      headers: { 'Content-Type': 'application/x-www-form-urlencoded','Accept':'application/x-www-form-urlencoded','Authorization':localStorage.getItem('auth')},
      //transformRequest: angular.identity
    }).success(function(response){
      data=response;
	  deferred.resolve(data);
    }).error(function(response) {
      data=response;
    });
    data=deferred.promise;
    return $q.when(data);
    };



});



app.service('CRUDAPIPUT',function($http,$q,AUTHTOKEN){

    var data=undefined;
    this.execute=function(method,payload,url){
    var deferred=$q.defer();
    $http({
      url: url,
      method: method,
      data: payload,
      headers: {'Authorization':localStorage.getItem('auth')}

    }).success(function(response){
      data=response;
	  deferred.resolve(data);
    }).error(function(response) {
      data=response;
    });
    data=deferred.promise;
    return $q.when(data);
    };



});

app.service('CRUDAPIFORMDATA',function($http,$q,AUTHTOKEN){

    var data=undefined;
    this.execute=function(method,payload,url){
    var deferred=$q.defer();
    $http({
      url: url,
      method: method,
      data: payload,
      headers: { 'Authorization':localStorage.getItem('auth'),'Content-Type': undefined},
      transformRequest: angular.identity
    }).success(function(response){
      data=response;
	  deferred.resolve(data);
    }).error(function(response) {
      data=response;
    });
    data=deferred.promise;
    return $q.when(data);
    };



});


app.service('NOTICE',function(){
    this.execute=function(header,content){
        $.gritter.add({
            title: header,
            text: content,
            image: 'images/notification.png',
            sticky: false,
            time: ''
        });
    };
});



app.controller('InController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPI2,AUTHTOKEN,AUTHCLIENT,UP,NOTICE) {

$scope.the_runner = { username:'',
                      password:'',
                      spinner:false
                     };

$scope.expect_token=function(e){

	e.preventDefault();


	if(localStorage.getItem('auth') == null){
       $scope.fetch_client();

    }else{

    var payload = new FormData();
    var property;
    for(property in $scope.the_runner){
	  payload.append(property,JSON.stringify($scope.the_runner[property]));
    }
    CRUDAPI2.execute('GET',payload,"http://mss.test/api/users").then(function(response){
	   if($scope.the_runner.username == response.email){
		 document.getElementById('login-form').submit();
	   }else{
		 $scope.the_runner.spinner = true;
		 localStorage.removeItem('auth');
         $scope.fetch_client();
	   }
    });


	}

}

$scope.fetch_client=function(){

    AUTHCLIENT.execute($scope.the_runner.username,$scope.the_runner.password).then(function(response){
         console.log("Response is "+ response.client[0].client_id);
          localStorage.setItem('clientid', response.client[0].client_id);
          localStorage.setItem('clientsecret', response.client[0].client_secret);
	    $scope.fetch_token();
    });
}


$scope.fetch_token=function(){
    AUTHTOKEN.execute($scope.the_runner.username,$scope.the_runner.password).then(function(response){
		if(response.access_token !=""){
          var token = 'Bearer '+response.access_token;
	      localStorage.setItem('auth', token);
          document.getElementById('login-form').submit();
		}else{
			alert('Token error !');
		}
    });
}



});




app.controller('DashboardController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { name:'',
                      email:'',
					  address:'',
					  user_id:'',
                      return_response:'',
					  notices_count:0,
					  spinner:false,
					  spinner_notices:true,
			          rangedays:[],
                      mails_count:0,
					  start_date:'',
					  end_date:'',
                      spinner_mails:true
                     };

					 $scope.mails_lite = [];
                     $scope.notices = [];
                     $scope.counts = {};
                     $scope.rankings = [];
                     $scope.analytic_violations = [];
                     $scope.analytic_hazards = [];
                     $scope.analytic_accidents = [];
                     $scope.analytic_non_eqs = [];
                     $scope.analytic_near_misses = [];
                     $scope.analytic_injuries = [];






});









app.controller('UserController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { name:'',
                      email:'',
					  address:'',
					  user_id:'',
					  where_field:'',
					  keyword:'',
                      return_response:'',
					  notices_count:0,
					  spinner:false,
					  spinner_notices:true,
					  mails_count:0,
                      spinner_mails:true,

					  nic:'',
					  company:'',
					  department:'',
					  designation:'',
					  contact:'',
					  employee_number:'',
					  shift:'',
					  avatar:''



                     };

					 $scope.users = [];
                     $scope.pages =[];
                     $scope.pages_selected= [];
                     $scope.notices = [];
					 $scope.mails_lite = [];

$scope.the_validator = {
					   error_reference_number:true,
					   error_published_date:true,
					   error_closing_date:true,
					   error_description:true
                     };


$scope.the_paginate = { totalPages:0 ,
                        currentPage:1 ,
						range:[],
                        pageNumber:1
					  };

$scope.navigate=function(pageNumber){
    if(pageNumber===undefined){
      $scope.the_paginate.pageNumber = '1';
    }else{
      $scope.the_paginate.pageNumber=pageNumber;
	}
    $scope.read_users();
}

$scope.navigateUp = function (){
      UP.scrollTo('backtotop');
}


$scope.$watch('the_runner.keyword',function(){
	$scope.read_users();
});


$scope.$watch('the_runner.where_field',function(){
	$scope.read_users();
});



$scope.read_users=function(){

    $scope.users=[];

    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/cast-users?page="+$scope.the_paginate.pageNumber).then(function(response){
      $scope.users     = response.data;

      $scope.the_paginate.totalPages   = response.last_page;
      $scope.the_paginate.currentPage  = response.current_page;
      var pages = [];
      for(var i=1;i<=response.last_page;i++) {
        pages.push(i);
      }
      $scope.the_paginate.range = pages;
    });





}


$scope.flush=function(){
    $scope.pages=[];
	$scope.the_runner.user_id = '';
	$scope.the_runner.name = '';
	$scope.the_runner.email = '';
	$scope.the_runner.address = '';
	$scope.the_runner.return_response = '';



	$scope.the_runner.nic = '';
	$scope.the_runner.company = '';
	$scope.the_runner.department = '';
	$scope.the_runner.designation = '';
	$scope.the_runner.contact = '';
	$scope.the_runner.employee_number = '';
	$scope.the_runner.shift = '';
	$scope.the_runner.avatar = '';


}


$scope.read_user=function(user){

    $scope.read_pages(user);
	$scope.the_runner.user_id = user.id;
	$scope.the_runner.name = user.name;
	$scope.the_runner.email = user.email;
	$scope.the_runner.address = user.address;

}


$scope.read_user_info=function(user){


    $scope.the_runner.user_id = user.id;
	$scope.the_runner.name = user.name;
	$scope.the_runner.email = user.email;
	$scope.the_runner.address = user.address;
	$scope.the_runner.nic = user.nic;
	$scope.the_runner.company = user.company;
	$scope.the_runner.department = user.department;
	$scope.the_runner.designation = user.designation;
	$scope.the_runner.contact = user.contact;
	$scope.the_runner.employee_number = user.employee_number;
	$scope.the_runner.shift = user.shift;
	$scope.the_runner.avatar = user.avatar;





}



$scope.read_pages=function(user){

    $scope.pages=[];
    var payload = new FormData();
    var property;

	$scope.the_runner.user_id = user.id;


    for(property in $scope.the_runner){
	  payload.append(property,JSON.stringify($scope.the_runner[property]));
    }
    CRUD.execute('POST',payload,"http://mss.test/read-pages").then(function(response){
        $scope.pages = response;
		console.log($scope.pages);
		$scope.pages_selected = [];
		for(var j = 0;j< $scope.pages.length; j++){
			if($scope.pages[j]['status'] == 'checked'){
		      $scope.pages_selected.push($scope.pages[j]['page_id']);
			}
		}
		console.log($scope.pages_selected);
    });





}


$scope.save=function(){

   var payload = new FormData();

	$scope.the_runner.spinner = true;
    var property;
    for(property in $scope.the_runner){
	  payload.append(property,$scope.the_runner[property]);
    }

	for(var i=0;i<$scope.pages_selected.length;i++){
	  payload.append('pages_selected[]',$scope.pages_selected[i]);
    }



    CRUD.execute('POST',payload,"http://mss.test/api/users").then(function(response){
	   $scope.the_runner.spinner = false;
       NOTICE.execute('Success',response);
    });


}

$scope.fill_pages=function(page){

if ($scope.pages_selected.indexOf(page.page_id) < 0) {
  $scope.pages_selected.push(page.page_id);

  if(page.parent != null){


    if(!document.getElementById("page-"+page.parent).checked){
    document.getElementById("page-"+page.parent).checked = true;
	$scope.pages_selected.push(page.parent);
	}




  }




}else{
   $scope.pages_selected.splice($scope.pages_selected.indexOf(page.page_id), 1);

  if(page.parent != null){

	  if(document.getElementById("page-"+page.parent).checked){
        //document.getElementById("page-"+page.parent).checked = false;
		//$scope.pages_selected.splice($scope.pages_selected.indexOf(page.parent), 1);
      }

  }


}



var idx = page.page_id;

for(var i=0;i<$scope.pages.length;i++){

	if($scope.pages[i].parent != null){
	if($scope.pages[i].parent == idx){

		if(document.getElementById("page-"+idx).checked){
	      document.getElementById("page-"+$scope.pages[i].page_id).checked = true;


           $scope.pages_selected.push($scope.pages[i].page_id);





		}else{
	      document.getElementById("page-"+$scope.pages[i].page_id).checked = false;






          $scope.pages_selected.splice($scope.pages_selected.indexOf($scope.pages[i].page_id), 1);
		}





	}
	}




	//console.log(document.getElementById($scope.pages[i].page_id+"-"+parent_id));
	//alert($scope.pages[i].page_id+"-"+parent_id);



}


console.log($scope.pages_selected);



}



$scope.delete=function(user){
    CRUDAPI.execute('DELETE',$scope.the_runner,"http://mss.test/api/users/"+user.id).then(function(response){
       $scope.read_users();
       NOTICE.execute('Success',response.returnResponse);
    });
}



/*********************Notices***********************/
$scope.notice_status = function(notice){
    CRUDAPI.execute('PUT',$scope.the_runner,"http://mss.test/api/notices/"+notice.notice_id).then(function(response){
      $scope.notification_in(true);
    });
}
$scope.notification_in = function(statusx){
    $scope.the_runner.spinner_notices = true;
    CRUDAPI.execute('GET',$scope.the_runner,"http://mss.test/api/notices").then(function(response){
	if(statusx){
	    $scope.the_runner.notices_count = response.notices.length;
        $scope.notices     = response.notices;
        $scope.the_runner.spinner_notices = false;
	}else{
	  if($scope.the_runner.notices_count < response.notices.length){
	    $scope.the_runner.notices_count = response.notices.length;
        $scope.notices     = response.notices;
        $scope.the_runner.spinner_notices = false;
        NOTICE.execute('Notification',response.notices[response.notices.length-1].message);
	  }
	}
    });
	$scope.the_runner.spinner_notices = false;
}
$interval(function(){
$scope.notification_in(false);
},5000);
/*********************Notices***********************/
/*********************Mails***********************/
$scope.mail_status = function(mail){
    CRUDAPI.execute('PUT',$scope.the_runner,"http://mss.test/api/mails/"+mail.mail_id).then(function(response){
      $scope.mail_in(true);
    });
}
$scope.mail_in = function(statusx){
    $scope.the_runner.spinner_mails = true;
    CRUDAPI.execute('GET',$scope.the_runner,"http://mss.test/api/mails").then(function(response){
	if(statusx){
	    $scope.the_runner.mails_count = response.mails.length;
        $scope.mails_lite     = response.mails;
        $scope.the_runner.spinner_mails = false;
	}else{
	  if($scope.the_runner.mails_count < response.mails.length){
	    $scope.the_runner.mails_count = response.mails.length;
        $scope.mails_lite     = response.mails;
        $scope.the_runner.spinner_mails = false;
        NOTICE.execute('Notification',"New Email from "+response.mails[response.mails.length-1].name+"<br>"+response.mails[response.mails.length-1].subject);
	  }
	}
    });
	$scope.the_runner.spinner_mails = false;
}
$interval(function(){
$scope.mail_in(false);
},5000);
/*********************Mails***********************/



$scope.read_users();
});











app.controller('ProfileController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,$interval,NOTICE) {

$scope.the_runner = { name:'',
                      email:'',
					  address:'',
					  password:'',
					  password_new:'',
					  password_confirmation:'',
					  user_id:'1',
                      return_response:'',
					  notices_count:0,
					  spinner:false,
					  spinner_notices:true,
					  mails_count:0,
                      spinner_mails:true

                     };



$scope.the_validator = {
                       regex_contact:/^(\+?(\d{1}|\d{2}|\d{3})[- ]?)?\d{3}[- ]?\d{3}[- ]?\d{4}$/,
                       regex_email:/^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i,
					   error_name:true,
					   error_email:true,
					   error_address:true,
					   error_password:true,
                       error_password_new:true,
                       error_password_confirmation:true
                     };

$scope.notices = [];
$scope.mails_lite = [];
$scope.read_profile=function(){

    var payload = new FormData();
    var property;
    for(property in $scope.the_runner){
	  payload.append(property,JSON.stringify($scope.the_runner[property]));
    }

    CRUDAPI.execute('GET',payload,"http://mss.test/api/users").then(function(response){
	   $scope.set_reads(response);
    });

}

$scope.set_reads=function(response){
	$scope.the_runner.user_id = response.id;
	$scope.the_runner.name = response.name;
	$scope.the_runner.email = response.email;
	$scope.the_runner.address = response.address;
}


$scope.flush=function(){
    $scope.pages=[];
	$scope.the_runner.user_id = '';
	$scope.the_runner.name = '';
	$scope.the_runner.email = '';
	$scope.the_runner.address = '';
	$scope.the_runner.return_response = '';

}




$scope.save=function(){

if($scope.valid()){





	$scope.the_runner.spinner = true;



    CRUDAPI.execute('PUT',$scope.the_runner,"http://mss.test/api/users/"+$scope.the_runner.user_id).then(function(response){

	   NOTICE.execute('Notification',response.returnResponse);
	   $scope.the_runner.spinner = false;
    });
}

}

$scope.valid=function(){
var valid = false;

if( !$scope.the_validator.error_name && !$scope.the_validator.error_email && !$scope.the_validator.error_address && !$scope.the_validator.error_password && !$scope.the_validator.error_password_new && !$scope.the_validator.error_password_confirmation){
	valid = true;
}




return valid;
}



$scope.$watch('the_runner.name',function(){
				if($scope.the_runner.name != '' && $scope.the_runner.name.length > 1 ){
					$scope.the_validator.error_name = false;
				}else{
					$scope.the_validator.error_name = true;
				}
});

$scope.$watch('the_runner.email',function(){
				if($scope.the_validator.regex_email.test($scope.the_runner.email)){
					$scope.the_validator.error_email = false;
				}else{
					$scope.the_validator.error_email = true;
				}
});

$scope.$watch('the_runner.address',function(){
				if($scope.the_runner.address != '' && $scope.the_runner.address.length > 5 ){
					$scope.the_validator.error_address = false;
				}else{
					$scope.the_validator.error_address = true;
				}
});

$scope.$watch('the_runner.password',function(){
				if($scope.the_runner.password != '' && $scope.the_runner.password.length > 5 ){
					$scope.the_validator.error_password = false;
				}else{
					$scope.the_validator.error_password = true;
				}
});

$scope.$watch('the_runner.password_new',function(){
	            if($scope.the_runner.password_new != '' && $scope.the_runner.password_new.length > 5 && $scope.the_runner.password_confirmation == $scope.the_runner.password_new){
					$scope.the_validator.error_password_confirmation = false;
					$scope.the_validator.error_password_new = false;
				}
				else if($scope.the_runner.password_new != '' && $scope.the_runner.password_new.length > 5 ){
					$scope.the_validator.error_password_new = false;
				}
                else{
					$scope.the_validator.error_password_new = true;
				}
});

$scope.$watch('the_runner.password_confirmation',function(){
				if($scope.the_runner.password_confirmation != '' && $scope.the_runner.password_confirmation.length > 5 && $scope.the_runner.password_confirmation == $scope.the_runner.password_new ){
					$scope.the_validator.error_password_confirmation = false;
				}else{
					$scope.the_validator.error_password_confirmation = true;
				}
});






$scope.read_profile();
});





app.controller('InvoiceController', function($scope,$http,$filter,$compile,CRUD,UP) {

$scope.the_common = { sort:'',
                      calendar_status : false,
                      calendar_opened : true
                    };

$scope.the_runner = { timestamp : new Date,
                      recipient : '' ,
                      order_id : '',
                      label_id: 4	,
                      is_new : false ,
                      return_response : '',
                      sort_field:'order_id',
                      sort_method:'DESC',
					  cart_items : [] ,
					  product_vat : 0 ,
					  product_discount : 0 ,
					  sub_total : 0 ,
					  vat_percentage : 5 ,
					  discount_percentage : 0 ,
					  net_total : 0 ,
					  net_total_discount : 0 ,
                      paid : 0 ,
                      due : 0 ,
                      payment_id : 0
                    };

$scope.item_core = {  product_id : '' ,
                      product_title: '',
                      price: 0,
                      units: 0,
					  product_qty: '',
                      total : 0 ,
                      keyword : ''
                   };

$scope.the_paginate = { totalPages:0 ,
                        currentPage:1 ,
						range:[]
					  };

$scope.liteQ=[];
$scope.products = [];
$scope.sorts = [];
$scope.payments = [];
$scope.orders = [];

var that = this;

this.picker3 = {
    date: new Date()
};

this.openCalendar = function (e, picker) {
    that[picker].open = true;
};

$scope.$on('$destroy', function () {
    unwatchMinMaxValues();
});

$scope.openCalendar=function( event ) {
    event.preventDefault();
    event.stopPropagation ();
    $scope.the_common.calendar_opened = true;
}

$scope.navigate=function(pageNumber){
    if(pageNumber===undefined){
      $scope.the_paginate.pageNumber = '1';
    }else{
      $scope.the_paginate.pageNumber=pageNumber;
    }
    $scope.read_orders();
}

$scope.read_orders=function(){
    $scope.orders=[];
    var payload = new FormData();
    var property;
    for(property in $scope.the_runner){
	  payload.append(property,JSON.stringify($scope.the_runner[property]));
    }
    CRUD.execute('POST',payload,"http://127.0.0.1:8000/read_contents?page="+$scope.the_paginate.pageNumber).then(function(response){
      $scope.orders     = response.data;
      $scope.the_paginate.totalPages   = response.last_page;
      $scope.the_paginate.currentPage  = response.current_page;
      var pages = [];
      for(var i=1;i<=response.last_page;i++) {
        pages.push(i);
      }
      $scope.the_paginate.range = pages;
    });
}

$scope.delete=function( item ){
    var payload = new FormData();
    var property;
    for(property in item){
	  payload.append(property,JSON.stringify(item[property]));
    }
    CRUD.execute('POST',payload,"http://127.0.0.1:8000/delete").then(function(response){
      $scope.read_orders();
      $scope.the_runner.return_response = response;
    });
}


$scope.read=function( item ){
    var payload = new FormData();
    var property;
    for(property in item){
	  payload.append(property,JSON.stringify(item[property]));
    }
    CRUD.execute('POST',payload,"http://127.0.0.1:8000/read").then(function(response){
      $scope.set_reads(response);
    });
}

$scope.set_reads=function( response ){
    $scope.flush_cart();

    for(var i=0;i<response.length;i++){
      var cart_item = { 'product_id' : response[i].product_id,
                        'product_title' : response[i].product_title,
                        'price' : response[i].price,
                        'product_qty' : response[i].quantity,
                        'total' : response[i].total,
                        'keyword' : ''
                      };
	  $scope.the_runner.cart_items.push(cart_item);
    }

    $scope.the_runner.timestamp = new Date();
    $scope.the_runner.order_id = response[0].order_id;
    $scope.the_runner.recipient = response[0].recipient;
    $scope.the_runner.created_at = response[0].timestamp;
    $scope.the_runner.product_vat = response[0].vat;
    $scope.the_runner.product_discount = response[0].discount;
    $scope.the_runner.sub_total = response[0].sub_total;
    $scope.the_runner.vat_percentage = response[0].vat_percentage;
    $scope.the_runner.discount_percentage = response[0].discount_percentage;
    $scope.the_runner.net_total_discount = response[0].net_total;
    $scope.the_runner.paid = response[0].paid_amount;
    $scope.the_runner.due = response[0].due_amount;
    $scope.the_runner.payment_id = response[0].payment_id;
}

$scope.flush_cart = function(){
	$scope.the_runner.cart_items = [];
    $scope.the_runner.order_id = '';
    $scope.the_runner.recipient = '';
    $scope.the_runner.created_at = '';
    $scope.the_runner.product_vat = 0;
    $scope.the_runner.product_discount = 0;
    $scope.the_runner.sub_total = 0;
    $scope.the_runner.net_total_discount = 0;
    $scope.the_runner.paid = 0;
    $scope.the_runner.due = 0;
    $scope.the_runner.payment_id = 0;
    $scope.the_runner.discount_percentage = 0;
}

$scope.save=function(){

    if($scope.the_runner.is_new){
      if($scope.the_runner.cart_items.length > 0){
        if($scope.admin_add_order_form.$valid) {
          $scope.the_runner.timestamp = $filter('date')( $scope.the_runner.timestamp ,'yyyy-MM-dd HH:mm:ss');
          var payload = new FormData();
          var property;
          for(property in $scope.the_runner){
	        payload.append(property,JSON.stringify($scope.the_runner[property]));
          }
          CRUD.execute('POST',payload,"http://127.0.0.1:8000/save").then(function(response){
            $scope.the_runner.return_response = response;
	        $scope.flush_cart();
	        $scope.the_runner.is_new = false;
            $scope.read_orders();
          });
        }
      }
    }else{
    if($scope.admin_edit_order_form.$valid) {
      if($scope.the_runner.cart_items.length > 0){
        $scope.the_runner.timestamp = $filter('date')( $scope.the_runner.timestamp ,'yyyy-MM-dd HH:mm:ss');
        var payload = new FormData();
        var property;
        for(property in $scope.the_runner){
	      payload.append(property,JSON.stringify($scope.the_runner[property]));
        }
        CRUD.execute('POST',payload,"http://127.0.0.1:8000/save").then(function(response){
          $scope.the_runner.return_response = response;
//	      $scope.the_runner.order_id = '';
          $scope.read_orders();
        });
      }
     }
   }

}

$scope.setSorts=function(){
    if($scope.the_common.sort.length > 0){
	  var value=$scope.the_common.sort;
	  var field=value.substring(0, value.indexOf('|'));
	  var method=value.substring(value.indexOf('|')+1,value.length);
      $scope.the_runner.sort_field= field;
      $scope.the_runner.sort_method= method;
	  $scope.read_orders();
	}
}

$scope.$watch('the_runner.order_id',function(){
    $scope.read_orders();
});


$scope.read_products=function(){
    var payload = new FormData();
    CRUD.execute('POST',payload,"http://127.0.0.1:8000/read_products").then(function(response){
      $scope.products = response;
    });
}

$scope.read_sorts=function(){
    var payload = new FormData();
    CRUD.execute('POST',payload,"http://127.0.0.1:8000/read_sorts").then(function(response){
      $scope.sorts = response;
    });
}

$scope.read_payments=function(){
    var payload = new FormData();
    CRUD.execute('POST',payload,"http://127.0.0.1:8000/read_payments").then(function(response){
      $scope.payments = response;
    });
}

$scope.$watch('item_core.keyword',function(){
    var elmnt_qty = document.getElementById("qty");
	if(elmnt_qty != null){
    elmnt_qty.removeAttribute("max");
    $scope.compile(elmnt_qty);
	}
	$scope.liteQ=[];
    var payload = new FormData();
	payload.append('keyword',JSON.stringify($scope.item_core.keyword));
    CRUD.execute('POST',payload,"http://mss.test/search-product").then(function(response){
      $scope.liteQ = response;
    });
});

$scope.set_liteq = function(product){
    $scope.item_core.product_id=	product.product_id;
    $scope.item_core.product_title=	product.title;
    $scope.item_core.price = product.price;
    $scope.item_core.units = product.units;

    if( product.units > $scope.qty_availability(product)  ){
    $scope.item_core.product_qty = 1;
    $scope.item_core.total = product.price * $scope.item_core.product_qty;
	}

    var elmnt_qty = document.getElementById("qty");
	if(elmnt_qty != null){
    elmnt_qty.setAttribute("max", product.units - $scope.qty_availability(product));
    $scope.compile(elmnt_qty);
	}

}

$scope.compile = function(element){
  var el = angular.element(element);
  $scope = el.scope();
    $injector = el.injector();
    $injector.invoke(function($compile){
       $compile(el)($scope)
    })
}

$scope.qty_availability = function(product){
	var reserved = 0;
	for(var i=0;i < $scope.the_runner.cart_items.length;i++){
		if( $scope.the_runner.cart_items[i].product_id == product.product_id ){
		reserved += $scope.the_runner.cart_items[i].product_qty;
	    }
	}
    return reserved;
}


$scope.set_product_qty = function(){
    $scope.item_core.total = $scope.item_core.price * $scope.item_core.product_qty ;
}

$scope.add_cart = function(){
    var cart_item = { 'product_id' : $scope.item_core.product_id,
                      'product_title' : $scope.item_core.product_title,
                      'price' : $scope.item_core.price,
                      'product_qty' : $scope.item_core.product_qty,
                      'total' : $scope.item_core.total,
                      'keyword' : $scope.item_core.keyword
                    };

	var index=null;
	for(var i=0;i<$scope.the_runner.cart_items.length;i++){

		if( $scope.item_core.product_id == $scope.the_runner.cart_items[i].product_id ){
			index = i;
		}
	}

	if( cart_item.product_qty > 0 ){
      if( index == null ){
         $scope.the_runner.cart_items.push(cart_item);
	  }else{
	   $scope.the_runner.cart_items[index].total += cart_item.total;
	   $scope.the_runner.cart_items[index].product_qty += cart_item.product_qty;
       $scope.calculate();
	  }
    }

    $scope.item_core.product_id ='';
    $scope.item_core.product_title ='';
    $scope.item_core.price = 0;
    $scope.item_core.product_qty = 0;
    $scope.item_core.total = 0;
    $scope.item_core.keyword ='';
}

$scope.remove_cart = function(index){
    $scope.the_runner.cart_items.splice(index,1);
}

$scope.$watch('the_runner.cart_items.length',function(){
$scope.calculate();
});

$scope.calculate = function(){
    var cart_length = $scope.the_runner.cart_items.length;
    var count =0;
    if(cart_length>0){
      for(var i=cart_length-1;i>=0;i--){
        count += $scope.the_runner.cart_items[i].total;
      }
    }

    $scope.the_runner.sub_total = count;
    $scope.the_runner.net_total = (( $scope.the_runner.sub_total * $scope.the_runner.vat_percentage / 100 ) + $scope.the_runner.sub_total ).toFixed(2) ;
    $scope.the_runner.product_vat = ( $scope.the_runner.sub_total * $scope.the_runner.vat_percentage / 100 ).toFixed(2) ;
    $scope.the_runner.net_total_discount = $scope.the_runner.net_total - ( $scope.the_runner.net_total * $scope.the_runner.discount_percentage / 100 ) ;
    $scope.the_runner.due = ( $scope.the_runner.net_total_discount - $scope.the_runner.paid ).toFixed(2) ;
    $scope.the_runner.product_discount = ( $scope.the_runner.net_total * $scope.the_runner.discount_percentage / 100 ).toFixed(2) ;
}


$scope.$watch('the_runner.discount_percentage',function(){
    $scope.the_runner.net_total_discount = ( $scope.the_runner.net_total - ( $scope.the_runner.net_total * $scope.the_runner.discount_percentage / 100 )).toFixed(2) ;
    $scope.the_runner.due = ( $scope.the_runner.net_total_discount - $scope.the_runner.paid ).toFixed(2) ;
 	$scope.the_runner.product_discount = ( $scope.the_runner.net_total * $scope.the_runner.discount_percentage / 100 ).toFixed(2) ;
});

$scope.$watch('the_runner.paid',function(){
    $scope.the_runner.due = ( $scope.the_runner.net_total_discount - $scope.the_runner.paid ).toFixed(2);
});




$scope.read_sorts();
$scope.read_payments();
$scope.read_orders();

});


app.controller('PatientRegisterController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { name:'',
                      nic:'',
					  guardian_nic:'',
					  age:'',
					  dob:'',
					  contact:'',
                      gender:'',
                      keyword:'',
					  address:'',
                      where_field:'name',
					  specialization_id:'',
					  appointment_date:'',
					  appointment_time_slot:'',
					  doctor_id:'',
                      patient_id:'',
					  spinner:false

                     };



$scope.the_validator = {
					   error_name:true,
					   error_contact:true,
					   error_nic:true,
					   error_dob:true,
                       error_gender:true,
                       error_address:true
                     };

$scope.patients = [];
$scope.doctors = [];
$scope.areas = [];
$scope.time_slots = [];

  /////////////////////////////////////////
  $scope.calendar_one_opened = false;
  $scope.openCalendarOne=function(e) {
	e.preventDefault();
    e.stopPropagation ();
    $scope.calendar_one_opened = true;
  }
  $scope.calendar_two_opened = false;
  $scope.openCalendarTwo=function(e) {
	e.preventDefault();
    e.stopPropagation ();
    $scope.calendar_two_opened = true;
  }
  $scope.ismeridian = true;
  $scope.toggleMode = function() {
    $scope.ismeridian = ! $scope.ismeridian;
  };
  //////////////////////////////////////

$scope.search_categories = [{category_id:'name',title:'Name'},{category_id:'nic',title:'NIC'}];

  var elm = document.getElementById('patients-dropdown');
  if (elm != null){
    elm.style.visibility = 'hidden';
  }

$scope.$watch('the_runner.name',function(){
				if($scope.the_runner.name != '' && $scope.the_runner.name.length > 1 ){
					$scope.the_validator.error_name = false;
				}else{
					$scope.the_validator.error_name = true;
				}
});

$scope.$watch('the_runner.nic',function(){
				if($scope.the_runner.nic != '' && $scope.the_runner.nic.length > 1 ){
					$scope.the_validator.error_nic = false;
				}else{
					$scope.the_validator.error_nic = true;
				}
});

$scope.$watch('the_runner.dob',function(){
				if($scope.the_runner.dob != ''   ){
					$scope.the_validator.error_dob = false;
				}else{
					$scope.the_validator.error_dob = true;
				}
});

$scope.$watch('the_runner.contact',function(){
				if($scope.the_runner.contact != '' && $scope.the_runner.contact.length == 10 ){
					$scope.the_validator.error_contact = false;
				}else{
					$scope.the_validator.error_contact = true;
				}
});


$scope.$watch('the_runner.gender',function(){


	console.log($scope.the_runner.gender);

				if($scope.the_runner.gender != ''  ){
					$scope.the_validator.error_gender = false;
				}else{
					$scope.the_validator.error_gender = true;
				}
});

$scope.$watch('the_runner.address',function(){
				if($scope.the_runner.address != '' && $scope.the_runner.address.length > 2 ){
					$scope.the_validator.error_address = false;
				}else{
					$scope.the_validator.error_address = true;
				}
});


$scope.$watch('the_runner.doctor_id',function(){
	if($scope.the_runner.patient_id !="" &&  $scope.the_runner.doctor_id !="" && $scope.the_runner.appointment_date !="" && $scope.the_runner.appointment_time_slot !=""){
	 //$scope.check_availability();
	}else{
		NOTICE.execute('Notification',"Please select date and time");
	}
});

$scope.$watch('the_runner.appointment_date',function(){
  if($scope.the_runner.appointment_date != ""){
  $scope.the_runner.appointment_date = moment($scope.the_runner.appointment_date).format('YYYY-MM-DD');
    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/time-slots").then(function(response){
      $scope.time_slots = response.data;

    });
  }

});

$scope.read_time_slots=function(){


    CRUDAPI.execute('GET',$scope.the_runner,"http://mss.test/time-slots").then(function(response){
      $scope.time_slots = response.slots;

    });
}






$scope.$watch('the_runner.dob',function(){

	if($scope.the_runner.dob != ""){
      $scope.the_runner.age = $scope.calculate_age(new Date($scope.the_runner.dob.getFullYear(), $scope.the_runner.dob.getMonth(), $scope.the_runner.dob.getDate()));

	}
});





$scope.$watch('the_runner.specialization_id',function(){

console.log("patient "+$scope.the_runner.patient_id);

	if($scope.the_runner.patient_id !="" && $scope.the_runner.appointment_date !="" ){
	$scope.read_doctors();
	}else{
		NOTICE.execute('Notification',"Please select date and time");
	}
});

$scope.read_doctors=function(){
    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/read-doctors").then(function(response){
      $scope.doctors = response.doctors;
    });
}

$scope.$watch('the_runner.keyword',function(){
	if($scope.the_runner.keyword !=""){
	document.getElementById('patients-dropdown').style.visibility = 'visible';
	$scope.read_patients();
	}
});

$scope.read_patients=function(){
    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/patient-search").then(function(response){
      $scope.patients = response;



    });
}



$scope.set_patient=function(patient){
	  document.getElementById('patients-dropdown').style.visibility = 'hidden';
$scope.the_runner.patient_id = patient.patient_id;
$scope.the_runner.name = patient.name;

if(patient.nic != null){
  $scope.the_runner.nic = patient.nic;
}else{
  $scope.the_runner.nic = patient.guardian_nic;
}





$scope.the_runner.gender = patient.gender;
//$scope.the_runner.dob = patient.dob;
$scope.the_runner.contact = patient.contact;
$scope.the_runner.address = patient.address;
$scope.the_runner.dob = moment(patient.dob).format('YYYY-MM-DD');

$scope.the_runner.age = $scope.calculate_age(new Date(new Date($scope.the_runner.dob).getFullYear(), new Date($scope.the_runner.dob).getMonth(), new Date($scope.the_runner.dob).getDate())) ;

}


$scope.specialization_area=function(){
    CRUDAPI.execute('GET',$scope.the_runner,"http://mss.test/specialization-area").then(function(response){
      $scope.areas = response.areas;
    });
}





$scope.save=function(){

    if( !$scope.the_validator.error_name && !$scope.the_validator.error_contact && !$scope.the_validator.error_nic   && !$scope.the_validator.error_dob &&   !$scope.the_validator.error_gender && !$scope.the_validator.error_address  ){

    $scope.the_runner.spinner = true;
    $scope.the_runner.dob = moment($scope.the_runner.dob).format('YYYY-MM-DD');


	   CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/api/patients").then(function(response){
       NOTICE.execute('Success',response.returnResponse);
       $scope.flush();

      });
	}else{
	  NOTICE.execute('Validation Error',"Please fill all required fields");
	}


}

$scope.update=function(){

    if( !$scope.the_validator.error_name && !$scope.the_validator.error_contact && !$scope.the_validator.error_nic   && !$scope.the_validator.error_dob &&   !$scope.the_validator.error_gender && !$scope.the_validator.error_address  ){

    $scope.the_runner.spinner = true;
    $scope.the_runner.dob = moment($scope.the_runner.dob).format('YYYY-MM-DD');


	   CRUDAPI.execute('PUT',$scope.the_runner,"http://mss.test/api/patients/"+$scope.the_runner.patient_id).then(function(response){
       NOTICE.execute('Success',response.message);
       $scope.flush();

      });
	}else{
	  NOTICE.execute('Validation Error',"Please fill all required fields");
	}


}


$scope.save_appointment=function(){

    if( !$scope.the_validator.error_name && !$scope.the_validator.error_contact && !$scope.the_validator.error_nic   && !$scope.the_validator.error_dob &&   !$scope.the_validator.error_gender && !$scope.the_validator.error_address  ){

    $scope.the_runner.spinner = true;
    $scope.the_runner.dob = moment($scope.the_runner.dob).format('YYYY-MM-DD');


	   CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/api/appointments").then(function(response){
       NOTICE.execute('Success',response.message);
       $scope.flush();

      });
	}else{
	  NOTICE.execute('Validation Error',"Please fill all required fields");
	}


}


$scope.calculate_age = function(dob) {
    var diff_ms = Date.now() - dob.getTime();
    var age_dt = new Date(diff_ms);

    return Math.abs(age_dt.getUTCFullYear() - 1970);
}






$scope.flush=function(){
$scope.the_runner.spinner = false;
$scope.the_runner.keyword = '';
$scope.the_runner.name = '';
$scope.the_runner.nic = '';
$scope.the_runner.dob = '';
$scope.the_runner.contact = '';
$scope.the_runner.gender = '';

$scope.the_runner.address = '';


}


$scope.specialization_area();
//$scope.read_time_slots();


});








app.controller('ProductController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { title:'',
                      product_id:'',
					  category_id:'',
					  brand_id:'',
					  model:'',
                      units:0,
                      price:'',
                      keyword:'',
					  spinner:false

                     };



$scope.the_validator = {
					   error_title:true,
					   error_category:true,
					   error_brand:true,
					   error_model:true,
                       error_stock:true,
                       error_price:true
                     };

$scope.brands = [];
$scope.categories = [];
$scope.products = [];


$scope.the_paginate = { totalPages:0 ,
                        currentPage:1 ,
						range:[],
                        pageNumber:1
					  };

$scope.navigate=function(pageNumber){
    if(pageNumber===undefined){
      $scope.the_paginate.pageNumber = '1';
    }else{
      $scope.the_paginate.pageNumber=pageNumber;
	}
    $scope.read_products();
}

$scope.navigateUp = function (){
      UP.scrollTo('backtotop');
}


$scope.$watch('the_runner.keyword',function(){
	$scope.read_products();
});




$scope.$watch('the_runner.title',function(){



				if($scope.the_runner.title != '' && $scope.the_runner.title.length > 1 ){
					$scope.the_validator.error_title = false;
				}else{
					$scope.the_validator.error_title = true;
				}
});
$scope.$watch('the_runner.category_id',function(){
				if($scope.the_runner.category_id != ''  ){
					$scope.the_validator.error_category = false;
				}else{
					$scope.the_validator.error_category = true;
				}
});
$scope.$watch('the_runner.brand_id',function(){
				if($scope.the_runner.brand_id != ''  ){
					$scope.the_validator.error_brand = false;
				}else{
					$scope.the_validator.error_brand = true;
				}
});
$scope.$watch('the_runner.model',function(){
				if($scope.the_runner.model != ''  ){
					$scope.the_validator.error_model = false;
				}else{
					$scope.the_validator.error_model = true;
				}
});
$scope.$watch('the_runner.units',function(){
				if($scope.the_runner.units > 0   ){
					$scope.the_validator.error_stock = false;
				}else{
					$scope.the_validator.error_stock = true;
				}
});
$scope.$watch('the_runner.price',function(){
				if($scope.the_runner.price != ''  ){
					$scope.the_validator.error_price = false;
				}else{
					$scope.the_validator.error_price = true;
				}
});




$scope.save=function(){

    if(  !$scope.the_validator.error_title &&
         !$scope.the_validator.error_category &&
         !$scope.the_validator.error_brand &&
         !$scope.the_validator.error_model &&
         !$scope.the_validator.error_stock &&
         !$scope.the_validator.error_price

	){

    $scope.the_runner.spinner = true;



	   CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/api/productsx").then(function(response){
       NOTICE.execute('Success',response.message);
       //$scope.flush();

      });
	}else{
	  NOTICE.execute('Validation Error',"Please fill all required fields");
	}


}







$scope.read_products=function(){

    $scope.products=[];

    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/cast-products?page="+$scope.the_paginate.pageNumber).then(function(response){
      $scope.products     = response.data;

      $scope.the_paginate.totalPages   = response.last_page;
      $scope.the_paginate.currentPage  = response.current_page;
      var pages = [];
      for(var i=1;i<=response.last_page;i++) {
        pages.push(i);
      }
      $scope.the_paginate.range = pages;
    });





}






 $scope.read_categories=function(){
    CRUDAPI.execute('GET',$scope.the_runner,"http://mss.test/api/categories").then(function(response){
      $scope.categories = response.categories;
    });
}

 $scope.read_brands=function(){
    CRUDAPI.execute('GET',$scope.the_runner,"http://mss.test/api/brands").then(function(response){
      $scope.brands = response.brands;
    });
}


 $scope.delete_product=function(product){
    CRUDAPI.execute('DELETE',$scope.the_runner,"http://mss.test/api/productsx/"+product.product_id).then(function(response){
       NOTICE.execute('Success',response.message);
	   $scope.read_products();
    });
 }

 $scope.set_product=function(product){


	 $scope.the_runner.title = product.title;
     $scope.the_runner.product_id = product.product_id;
     $scope.the_runner.category_id = product.category_id;
     $scope.the_runner.brand_id = product.brand_id;
     $scope.the_runner.model = product.model;
     $scope.the_runner.units = product.units;
     $scope.the_runner.price = product.price;




 }


 $scope.update_product=function(){





    CRUDAPI.execute('PUT',$scope.the_runner,"http://mss.test/api/productsx/"+$scope.the_runner.product_id).then(function(response){
		$('#edit-product').modal('hide');
       NOTICE.execute('Success',response.message);
	   $scope.read_products();
    });


 }



$scope.read_brands();
$scope.read_categories();
$scope.read_products();

});



app.controller('ProductCategoryController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { title:'',

					  category_id:'',

                      keyword:'',
					  spinner:false

                     };



$scope.the_validator = {
					   error_title:true

                     };


$scope.categories = [];



$scope.the_paginate = { totalPages:0 ,
                        currentPage:1 ,
						range:[],
                        pageNumber:1
					  };

$scope.navigate=function(pageNumber){
    if(pageNumber===undefined){
      $scope.the_paginate.pageNumber = '1';
    }else{
      $scope.the_paginate.pageNumber=pageNumber;
	}
    $scope.read_categories();
}

$scope.navigateUp = function (){
      UP.scrollTo('backtotop');
}


$scope.$watch('the_runner.keyword',function(){
	$scope.read_categories();
});




$scope.$watch('the_runner.title',function(){



				if($scope.the_runner.title != '' && $scope.the_runner.title.length > 1 ){
					$scope.the_validator.error_title = false;
				}else{
					$scope.the_validator.error_title = true;
				}
});





$scope.save=function(){

    if(  !$scope.the_validator.error_title


	){

    $scope.the_runner.spinner = true;



	   CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/api/categories").then(function(response){
       NOTICE.execute('Success',response.message);
       //$scope.flush();

      });
	}else{
	  NOTICE.execute('Validation Error',"Please fill all required fields");
	}


}







$scope.read_categories=function(){

    $scope.categories=[];

    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/cast-categories?page="+$scope.the_paginate.pageNumber).then(function(response){
      $scope.categories     = response.data;

      $scope.the_paginate.totalPages   = response.last_page;
      $scope.the_paginate.currentPage  = response.current_page;
      var pages = [];
      for(var i=1;i<=response.last_page;i++) {
        pages.push(i);
      }
      $scope.the_paginate.range = pages;
    });





}








 $scope.delete_category=function(category){
    CRUDAPI.execute('DELETE',$scope.the_runner,"http://mss.test/api/categories/"+category.category_id).then(function(response){
       NOTICE.execute('Success',response.message);
	   $scope.read_categories();
    });
 }

 $scope.set_category=function(category){


	 $scope.the_runner.title = category.title;

     $scope.the_runner.category_id = category.category_id;



 }


 $scope.update_category=function(){





    CRUDAPI.execute('PUT',$scope.the_runner,"http://mss.test/api/categories/"+$scope.the_runner.category_id).then(function(response){
		$('#edit-category').modal('hide');
       NOTICE.execute('Success',response.message);
	   $scope.read_categories();
    });


 }




$scope.read_categories();

});




app.controller('ProductBrandController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { title:'',

					  brand_id:'',

                      keyword:'',
					  spinner:false

                     };



$scope.the_validator = {
					   error_title:true

                     };


$scope.brands = [];



$scope.the_paginate = { totalPages:0 ,
                        currentPage:1 ,
						range:[],
                        pageNumber:1
					  };

$scope.navigate=function(pageNumber){
    if(pageNumber===undefined){
      $scope.the_paginate.pageNumber = '1';
    }else{
      $scope.the_paginate.pageNumber=pageNumber;
	}
    $scope.read_brands();
}

$scope.navigateUp = function (){
      UP.scrollTo('backtotop');
}


$scope.$watch('the_runner.keyword',function(){
	$scope.read_brands();
});




$scope.$watch('the_runner.title',function(){



				if($scope.the_runner.title != '' && $scope.the_runner.title.length > 1 ){
					$scope.the_validator.error_title = false;
				}else{
					$scope.the_validator.error_title = true;
				}
});





$scope.save=function(){

    if(  !$scope.the_validator.error_title


	){

    $scope.the_runner.spinner = true;



	   CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/api/brands").then(function(response){
       NOTICE.execute('Success',response.message);
       //$scope.flush();

      });
	}else{
	  NOTICE.execute('Validation Error',"Please fill all required fields");
	}


}







$scope.read_brands=function(){

    $scope.brands=[];

    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/cast-brands?page="+$scope.the_paginate.pageNumber).then(function(response){
      $scope.brands     = response.data;

      $scope.the_paginate.totalPages   = response.last_page;
      $scope.the_paginate.currentPage  = response.current_page;
      var pages = [];
      for(var i=1;i<=response.last_page;i++) {
        pages.push(i);
      }
      $scope.the_paginate.range = pages;
    });





}








 $scope.delete_brand=function(brand){
    CRUDAPI.execute('DELETE',$scope.the_runner,"http://mss.test/api/brands/"+brand.brand_id).then(function(response){
       NOTICE.execute('Success',response.message);
	   $scope.read_brands();
    });
 }

 $scope.set_brand=function(brand){


	 $scope.the_runner.title = brand.title;

     $scope.the_runner.brand_id = brand.brand_id;



 }


 $scope.update_brand=function(){





    CRUDAPI.execute('PUT',$scope.the_runner,"http://mss.test/api/brands/"+$scope.the_runner.brand_id).then(function(response){
		$('#edit-brand').modal('hide');
       NOTICE.execute('Success',response.message);
	   $scope.read_brands();
    });


 }




$scope.read_brands();

});




app.controller('PatientManageController', function($scope,CRUDAPI,$http,$filter,$compile,CRUD,UP) {


$scope.the_runner = {
					  where_field:'name',
					  keyword:''
                    };


$scope.patients = [];

$scope.search_categories = [{category_id:'nic',title:'NIC'},{category_id:'nic_guardian',title:'GUARDIAN NIC'},{category_id:'name',title:'Name'}];

$scope.the_paginate = { totalPages:0 ,
                        currentPage:1 ,
						range:[],
                        pageNumber:1
					  };

$scope.navigate=function(pageNumber){
    if(pageNumber===undefined){
      $scope.the_paginate.pageNumber = '1';
    }else{
      $scope.the_paginate.pageNumber=pageNumber;
	}
    $scope.read_patients();
}

$scope.navigateUp = function (){
      UP.scrollTo('backtotop');
}


$scope.$watch('the_runner.keyword',function(){
	$scope.read_patients();
});





$scope.read_patients=function(){

    $scope.patients=[];

    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/cast-patients?page="+$scope.the_paginate.pageNumber).then(function(response){
      $scope.patients     = response.data;

      $scope.the_paginate.totalPages   = response.last_page;
      $scope.the_paginate.currentPage  = response.current_page;
      var pages = [];
      for(var i=1;i<=response.last_page;i++) {
        pages.push(i);
      }
      $scope.the_paginate.range = pages;
    });





}






$scope.read_patients();



});




app.controller('AppointmentController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { title:'',
                      patient_name:'',
                      patient_nic:'',
                      patient_address:'',
                      patient_contact:'',
                      patient_id:'',
                      doctor_id:'',
                      keyword:'',
					  spinner:false,
					  medicine_items : [],
					  medicine_reports : [],
                      symptoms:'',
                      diagnosis:'',
                      remarks:'',
                      prescription:'',
                      appointment_id:''

                     };



$scope.the_validator = {
					   error_title:true,
					   error_category:true,
					   error_brand:true,
					   error_model:true,
                       error_stock:true,
                       error_price:true
                     };

$scope.appointments = [];



$scope.the_paginate = { totalPages:0 ,
                        currentPage:1 ,
						range:[],
                        pageNumber:1
					  };

$scope.navigate=function(pageNumber){
    if(pageNumber===undefined){
      $scope.the_paginate.pageNumber = '1';
    }else{
      $scope.the_paginate.pageNumber=pageNumber;
	}
    $scope.read_appointments();
}

$scope.navigateUp = function (){
      UP.scrollTo('backtotop');
}


$scope.$watch('the_runner.keyword',function(){
	$scope.read_appointments();
});




$scope.set_appointment=function(appointment){
  $scope.the_runner.appointment_id = appointment.id;
  $scope.the_runner.patient_name = appointment.patient.name;
  $scope.the_runner.patient_nic = appointment.patient.nic;
  $scope.the_runner.patient_address = appointment.patient.address;
  $scope.the_runner.patient_contact = appointment.patient.contact;
  $scope.the_runner.patient_id = appointment.patient_id;
  $scope.the_runner.doctor_id = appointment.doctor_id;
};


$scope.medicine_item = {
                      title: '',

					  product_qty: ''

                   };

$scope.the_validator = {
					   error_medicine_items:false,
					   error_medicine_reports:false,
					   error_symptoms:false,
					   error_diagnosis:false,
					   error_remarks:false

                     };


$scope.$watch('the_runner.symptoms',function(){
				if($scope.the_runner.symptoms != '' && $scope.the_runner.symptoms.length > 1 ){
					$scope.the_validator.error_symptoms = false;
				}else{
					$scope.the_validator.error_symptoms = true;
				}
});

$scope.$watch('the_runner.diagnosis',function(){
				if($scope.the_runner.diagnosis != '' && $scope.the_runner.diagnosis.length > 1 ){
					$scope.the_validator.error_diagnosis = false;
				}else{
					$scope.the_validator.error_diagnosis = true;
				}
});

$scope.$watch('the_runner.remarks',function(){
				if($scope.the_runner.remarks != '' && $scope.the_runner.remarks.length > 1 ){
					$scope.the_validator.error_remarks = false;
				}else{
					$scope.the_validator.error_remarks = true;
				}
});

$scope.$watch('the_runner.medicine_items', function(newValue, oldValue) {
	if($scope.the_runner.medicine_items.length > 0){
		$scope.the_validator.error_medicine_items = false;
	}else{
		$scope.the_validator.error_medicine_items = true;
	}
},true);

$scope.$watch('the_runner.medicine_reports', function(newValue, oldValue) {
	if($scope.the_runner.medicine_reports.length > 0){
		$scope.the_validator.error_medicine_reports = false;
	}else{
		$scope.the_validator.error_medicine_reports = true;
	}
},true);

$scope.medicine_report = {
                      title: ''

                   };


$scope.add_medicine = function(){
    var cart_item = {
                      'sku' : $scope.medicine_item.title,
                      'qty' : $scope.medicine_item.product_qty

                    };

	var index=null;
	for(var i=0;i<$scope.the_runner.medicine_items.length;i++){

		if( $scope.medicine_item.title == $scope.the_runner.medicine_items[i].title ){
			index = i;
		}
	}


      if( index == null ){
         $scope.the_runner.medicine_items.push(cart_item);
	  }



    $scope.medicine_item.title ='';

    $scope.medicine_item.product_qty = 0;

}


$scope.add_report = function(){
    var cart_item = {
                      'title' : $scope.medicine_report.title
                    };

	var index=null;
	for(var i=0;i<$scope.the_runner.medicine_reports.length;i++){

		if( $scope.medicine_report.title == $scope.the_runner.medicine_reports[i].title ){
			index = i;
		}
	}


      if( index == null ){
         $scope.the_runner.medicine_reports.push(cart_item);
	  }



    $scope.medicine_report.title ='';



}

$scope.remove_medicine = function(index){
    $scope.the_runner.medicine_items.splice(index,1);
}

$scope.remove_report = function(index){
    $scope.the_runner.medicine_reports.splice(index,1);
}




$scope.read_appointments=function(){

    $scope.appointments=[];

    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/cast-appointments?page="+$scope.the_paginate.pageNumber).then(function(response){
      $scope.appointments     = response.data;

      $scope.the_paginate.totalPages   = response.last_page;
      $scope.the_paginate.currentPage  = response.current_page;
      var pages = [];
      for(var i=1;i<=response.last_page;i++) {
        pages.push(i);
      }
      $scope.the_paginate.range = pages;
    });





}


$scope.save = function(){

    CRUDAPI.execute('POST',$scope.the_runner,"http://mss.test/patient-history-update").then(function(response){
      NOTICE.execute('Success',response.message);
    });

}





$scope.read_appointments();

});






app.controller('ReportTestController', function($scope,$http,$filter,CRUD,CRUDAPI,CRUDAPIPUT,UP,NOTICE,$interval) {

$scope.the_runner = { title:'',
                      patient_name:'',
                      patient_nic:'',
                      patient_address:'',
                      patient_contact:'',
                      patient_id:'',
                      doctor_id:'',
                      keyword:'',
					  spinner:false,
					  medicine_items : [],
					  medicine_reports : [],
                      symptoms:'',
                      diagnosis:'',
                      remarks:'',
                      prescription:'',
                      appointment_id:''

                     };





$scope.appointments = [];


$scope.$watch('the_runner.keyword',function(){
	$scope.read_appointments();
});


$scope.export_pdf=function(){





    $http({
        url: 'http://123.231.52.110/asceso/export-report-appointment-specialization-area',
        method: 'GET',
        data: $scope.the_runner,
        responseType: 'arraybuffer'
    }).success(function (data) {
        var linkElement = document.createElement('a');
        try {
            var blob = new Blob([data], { type: 'application/pdf' });
            var url = window.URL.createObjectURL(blob);
            linkElement.setAttribute('href', url);
            linkElement.setAttribute("download", "report.pdf");
            var clickEvent = new MouseEvent("click", {
                "view": window,
                "bubbles": true,
                "cancelable": false
            });
            linkElement.dispatchEvent(clickEvent);
        } catch (ex) {
            console.log(ex);
        }
    }).error(function (data) {
        console.log(data);
    });

}



$scope.read_appointments=function(){

    $scope.appointments=[];

    CRUDAPI.execute('GET',$scope.the_runner,"http://123.231.52.110/asceso/report-appointment-specialization-area").then(function(response){
      $scope.appointments     = response.data;







	  var data = [];
	  var data_active = [];
	  var data_cancelled = [];
	  for(var i=0;i<$scope.appointments.length;i++){

        data[i] = $scope.appointments[i].area;


        data_active[i] = $scope.appointments[i].active_count;
        data_cancelled[i] = $scope.appointments[i].cancelled_count;







	  }


	 var data2 =
	[{
                name: 'Active Count',
                data: data_active
            }, {
                name: 'Cancelled Count',
                data: data_cancelled
            }]

	  $scope.draw(data,data2);



    });





}





$scope.draw = function(data,data2){

  Highcharts.chart('containerx', {
      chart: {
            type: 'column'
        },
      title: {
        text: "Appointments List"
      },
            yAxis: {
                min: 0,
                title: {
                    text: 'Total'
                }
            },
           xAxis: {
                categories: data
            },

tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: data2



    });

}




$scope.read_appointments();

});




