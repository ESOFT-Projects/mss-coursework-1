<table style='width:100%;'>
    <tr style='background:#FFFFFF;'>
        <td width='10%' style='padding: 8px;text-align: left;border-bottom: 0px solid #ddd;'><img width="70" src="http://123.231.52.110/asceso/images/login-logo.png"/>
        </td>
        <td width='90%' style='padding: 8px;text-align: center;border-bottom: 0px solid #ddd;'>
            <h3>Doctors payment Report</h3>
        </td>
    </tr>
</table>

<table style="width:100%;">
    <thead>
        <tr>
            <th>No</th>
            <th>Doctor name</th>
            <th>Amount to be paid</th>
        </tr>
    </thead>
    <tbody>
    @foreach($reportData as $index => $doctor)
        <tr>
            <td style="border:1px solid #ddd;">{{$index + 1}}</td>
            <td style="border:1px solid #ddd;">{{$doctor->employee->first_name . ' ' . $doctor->employee->last_name}}</td>
            <td style="border:1px solid #ddd;">LKR {{$doctor->amount}}</td>
        </tr>
    @endforeach
    </tbody>
</table>








