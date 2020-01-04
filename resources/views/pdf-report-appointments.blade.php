<table  style='width:100%;' >
 

<tr style='background:#FFFFFF;'>
<td width='10%' style='padding: 8px;text-align: left;border-bottom: 0px solid #ddd;'><img width="70" src="http://123.231.52.110/asceso/images/login-logo.png" /></td>
<td width='90%' style='padding: 8px;text-align: center;border-bottom: 0px solid #ddd;'>
<h3>Appointment Count Report</h3>
 
</td>
</tr>
</table>  
 
 
 
<table style="width:100%;">
	<tbody>
@foreach($reports as $report)	
		<tr>
			<td style="border:1px solid #ddd;" >{{$report->area}}</td>
			<td style="border:1px solid #ddd;" colspan="3">{{$report->active_count}}</td>			
			<td style="border:1px solid #ddd;" colspan="3">{{$report->cancelled_count}}</td>
		</tr>
	 	
		
		
@endforeach
	</tbody>
</table> 
 
 
 

 

	 
	
 