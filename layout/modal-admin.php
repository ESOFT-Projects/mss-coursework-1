 

 
 
 
 
 
<div id="edit-user" class="modal" role="dialog" data-backdrop="static" data-keyboard="false" style="z-index:1049;width:100%;" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" ng-click="flush()">&times;</button>
      </div>
      <div class="modal-body">		
		<div class="alert alert-info alert-dismissable" ng-show=" the_runner.return_response.length > 0 " ><a class="close"  area-label="close" ng-click=" the_runner.return_response='' " ><i class="fa fa-times"></i></a><i class="fa fa-info-circle"></i>&nbsp;&nbsp;{{the_runner.return_response}}</div>	  	  
        <form class="form-horizontal" name="admin_edit_employee_form" novalidate >			

		  <div class="form-group">
            <label for="title" class="col-sm-3 control-label">Full Name</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" placeholder="Name" style="width:90%;"  id="title" name="title" ng-model="the_runner.name" required >
              <div class="error-msg" ng-hide="admin_edit_employee_form.title.$valid" >* Required</div>			  	  
            </div>
          </div>  
		  
		  <div class="form-group">
            <label for="title" class="col-sm-3 control-label">Email</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" placeholder="Name" style="width:90%;"  id="title" name="title" ng-model="the_runner.name" required >
              <div class="error-msg" ng-hide="admin_edit_employee_form.title.$valid" >* Required</div>			  	  
            </div>
          </div>  

		  <div class="form-group">
            <label for="title" class="col-sm-3 control-label">Address</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" placeholder="Name" style="width:90%;"  id="title" name="title" ng-model="the_runner.name" required >
              <div class="error-msg" ng-hide="admin_edit_employee_form.title.$valid" >* Required</div>			  	  
            </div>
          </div>		  
		  
		  <div class="form-group">
            <label for="title" class="col-sm-3 control-label">Contact Number</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" placeholder="Name" style="width:90%;"  id="title" name="title" ng-model="the_runner.name" required >
              <div class="error-msg" ng-hide="admin_edit_employee_form.title.$valid" >* Required</div>			  	  
            </div>
          </div>	

		  <div class="form-group">
            <label for="title" class="col-sm-3 control-label">Privilages</label>
            <div class="col-sm-9">
<div class="grid-container">
 
  <div class="grid-item" ng-repeat="page in pages"><input type = "checkbox" ng-true-value="{{page.page_id}}" ng-false-value="" value="{{page.page_id}}"  ng-checked="{{page.status !='' }}" ng-click="fill_pages(page)" /> <b>{{page.title}}</b></div>
  
</div> 
            </div>
          </div>		  
            

		

           	  
		  
		  


		  
          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
              <button type="submit" class="btn-ok" ng-click="save();" >Ok</button>
			  <button type="button" class="btn-close" data-dismiss="modal" >Close</button>
            </div>
          </div>			  
        </form>								
	  </div>
      <div class="modal-footer" style="text-align:center;" >
	  </div>
    </div>
  </div>
</div>