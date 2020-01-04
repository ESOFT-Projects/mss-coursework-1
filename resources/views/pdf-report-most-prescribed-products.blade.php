<table style='width:100%;'>
    <tr style='background:#FFFFFF;'>
        <td width='10%' style='padding: 8px;text-align: left;border-bottom: 0px solid #ddd;'><img width="70" src="http://123.231.52.110/asceso/images/login-logo.png"/>
        </td>
        <td width='90%' style='padding: 8px;text-align: center;border-bottom: 0px solid #ddd;'>
            <h3>Prescribed products Report</h3>
            <p>Prescribed products count in this week</p>
            <p>Starting from {{now()->startOfWeek()->format('Y-m-d')}} to {{now()->endOfWeek()->format('Y-m-d')}}</p>
        </td>
    </tr>
</table>

<table style="width:100%;">
    <thead>
        <tr>
            <th>No</th>
            <th>Product</th>
            <th>Prescriptions count</th>
        </tr>
    </thead>
    <tbody>
    @foreach($reportData as $index => $product)
        <tr>
            <td style="border:1px solid #ddd;">{{$index + 1}}</td>
            <td style="border:1px solid #ddd;">{{$product->title}}</td>
            <td style="border:1px solid #ddd;">{{$product->prescriptions_count}}</td>
        </tr>
    @endforeach
    </tbody>
</table>








