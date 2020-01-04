        <div class="menu-right">
            <ul class="notification-menu">
                

               				
                <li>
                    <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <img src="http://123.231.52.110/ehse/images/users/{{ Auth::user()->id }}/{{ Auth::user()->avatar }}" alt="" />
						<!--<i class="fa fa-user"></i>-->
                        <!--{{ Auth::user()->name }}-->
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-usermenu pull-right">                        
                        <li><a href="profile"><i class="fa fa-cog"></i>  Profile</a></li>
                        <li><a href='{{ route('logout') }}' onclick="event.preventDefault();document.getElementById('logout-form').submit();"><i class="fa fa-sign-out"></i> Log Out</a></li>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                          {{ csrf_field() }}
                        </form>						
                    </ul>
                </li>

            </ul>
        </div>