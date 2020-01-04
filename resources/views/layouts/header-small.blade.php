            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="http://mss.test/images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">{{ Auth::user()->name }}</a></h4>
                        <!--<span>"Hello There..."</span>-->
                    </div>
                </div>

                <h5 class="left-nav-title">Account Information</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">

                    <li><a href="register"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
                    <li><a href='{{ route('logout') }}' onclick="event.preventDefault();document.getElementById('logout-form-2').submit();"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                        <form id="logout-form-2" action="{{ route('logout') }}" method="POST" style="display: none;">
                          {{ csrf_field() }}
                        </form>
                </ul>
            </div>
