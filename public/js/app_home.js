var app = new Vue({
        el: '#app-in',
        data: {
        },
        mounted:function() {
        },		
        methods: {
        }
});


var app = new Vue({
        el: '#app-violation',
        data: {
			violations:[],
			the_runner:{ user_id:'0',
                         message:'',
                         destination_id:'',
                         destination_title:''						 
			            }
        },
        mounted:function() {
			this.read_violations();
			 
        },		
        methods: {
			
			read_violations: function(){
            
			/*var config = { 
              headers:{'Content-Type':'application/json','Accept':'application/json'}			
			}		   			  				
            axios.get('http://127.0.0.1/app-hse/read_violations').then((response) => {				
              this.violations=response.data;
			   
		    }); */
			
			alert("hello");
			
			
		    }
			
        }
});


 
