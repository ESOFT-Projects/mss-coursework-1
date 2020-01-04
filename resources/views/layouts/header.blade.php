            <ul class="nav nav-pills nav-stacked custom-nav"  >
			    @foreach($privileges as $privilege)
				  @if($privilege['parent']=='Y')
                    <li class="menu-list"><a href="#"><i class="{{$privilege['icon']}}"></i> <span>{{$privilege['title']}}</span></a>
                      <ul class="sub-menu-list">
					    <li><a href="http://mss.test{{$privilege['url']}}"><i class="{{$privilege['icon']}}"></i>{{$privilege['title']}}</a></li>
					      @php
				            if(count($privileges_subs)>0){
				            for($i=0;$i<count($privileges_subs['page_id']);$i++){
                          @endphp

						    @if($privilege['page_id'] == $privileges_subs['parent'][$i])
							  <li><a href="http://mss.test{{$privileges_subs['url'][$i]}}" ><i class="{{$privileges_subs['icon'][$i]}}"></i>{{$privileges_subs['title'][$i]}}</a></li>
							@endif

					      @php
				            }
                            }
                          @endphp
                      </ul>
                    </li>
				  @else

				   @if($privileges_subs)
				    @if(! in_array($privilege['page_id'],$privileges_subs['page_id']))
                      <li><a href="http://mss.test{{$privilege['url']}}"><i class="{{$privilege['icon']}}"></i> <span>{{$privilege['title']}}</span></a></li>
					@endif
				   @else
					  <li><a href="http://mss.test{{$privilege['url']}}"><i class="{{$privilege['icon']}}"></i> <span>{{$privilege['title']}}</span></a></li>
				   @endif

				  @endif
                @endforeach
            </ul>








