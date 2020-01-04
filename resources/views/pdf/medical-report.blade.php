<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>

    <style>
        body{
            padding: 0;
            margin: 0;
        }

        p, h1, h2, h4, h5{
            margin: 0;
            margin-bottom: 8px;
        }

        main{
            padding: 10px;
        }

        .hospital-address{
            text-align: center;
        }

        .hospital-address p{
            margin-bottom: 0;
        }

        hr{
            border: none;
            border-top: 1px solid #959292;
        }

        hr.bordered{
            border-top-style: dashed;
        }

        table{
            width: 100%;
        }

        table.inner-table{
            width: auto;
        }
    </style>

</head>
<body>

<main>
    <header>
        <table>
            <tbody>
            <tr>
                <small>Private and confidential</small>
            </tr>
            <tr>
                <td class="hospital-address">
                    <h2>Asceso Hospitals</h2>
                    <p><small>543/B,</small></p>
                    <p><small>Colombo road</small></p>
                    <p><small>Kandy</small></p>
                    <p><small>Tel: 081-1122322, 081-1122323</small></p>
                    <p><small>Fax: 081-1122333</small></p>
                    <p><small>Email: support@asceso.com</small></p>
                </td>
            </tr>
            </tbody>
        </table>
    </header>

    <hr>

    <h4>Report name</h4>
    <br>

    <div>
        <h5>Patient details</h5>

        <table>
            <tbody>
            <tr>
                <td>
                    <table class="inner-table">
                        <tr>
                            <td>Name: </td>
                            <td>John doe</td>
                        </tr>
                        <tr>
                            <td>NIC: </td>
                            <td>987123321V</td>
                        </tr>
                        <tr>
                            <td>Gender: </td>
                            <td>Male</td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table class="inner-table">
                        <tr>
                            <td>Date of birth: </td>
                            <td>2019-12-12</td>
                        </tr>
                        <tr>
                            <td>Age: </td>
                            <td>20</td>
                        </tr>
                        <tr>
                            <td>Contact: </td>
                            <td>0711212123</td>
                        </tr>
                    </table>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <hr class="bordered">
    <br><br><br>

    <div class="results">
        <h4>Results</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt harum magni praesentium in aliquam fugiat vel, corporis. Nulla sint totam, quia placeat accusamus, consectetur, doloribus assumenda vero, minima eligendi eos. At earum voluptatum deleniti sunt sequi non, cumque eius corrupti inventore nisi asperiores optio delectus ipsa accusamus recusandae provident velit.</p>
    </div>

    <br><br>

    <div class="remarks">
        <h4>Remarks</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt harum magni praesentium in aliquam fugiat vel, corporis. Nulla sint totam, quia placeat accusamus, consectetur, doloribus assumenda vero, minima eligendi eos. At earum voluptatum deleniti sunt sequi non, cumque eius corrupti inventore nisi asperiores optio delectus ipsa accusamus recusandae provident velit.</p>
    </div>

    <br><br><br>


    <div>
        <table>
            <tbody>
            <tr>
                <td>
                    <p>Tested at: 2019-12-12 08:00</p>
                </td>
                <td>
                    <p>Tested at: Johne doe</p>
                </td>
                <td>
                    <p>...........................................</p>
                    <p>Signature</p>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <hr class="bordered">

    <footer>

        <table>
            <tbody>
            <tr>
                <td>
                    <small>Generated at: 2019-12-12 08:30</small>
                </td>
            </tr>
            </tbody>
        </table>

    </footer>

</main>
</body>
</html>
