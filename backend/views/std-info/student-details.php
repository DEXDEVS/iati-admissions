<?php  
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        $stdInfo = Yii::$app->db->createCommand("SELECT * FROM std_info WHERE std_id = '$id'")->queryAll();
    }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Student Details</title>
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="Bootstrap/js/bootstrap.min.js">
</head>
<body style="font-family: georgia">

<div class="container" style="margin-top: -40px;">
    <div class="row">
        <div class="col-md-12 text-center">
            
        </div>
    </div><br>
    <div class="row">
        <div class="col-md-12" style="border: 2px solid; border-radius: 15px 5px 15px 5px;">
            <p style="text-align: center;">
                <img src="images/iati.png" style="width: 150px; margin-top: 10px;">
            </p>
            <h1 class="text-center" style="font-size: 23px;"><b>IN-SERVICE AGRICULUTRE TRAINING INSTITUTE</b></h1>
            <h3 class="text-center" style="margin-top: -10px">Rahim Yar Khan</h3>
            <h4 class="text-center" style="margin-top: -10px">Three Year Field Assistant Diploma in Agriculture Science</h4>
            <h2 class="text-center" style="margin-top: -5px"><b>Student Details</b></h2>
        </div>
    </div><br>

    <div class="row">
        <div class="col-md-6" style="float: left;">
            <table class="table">
                <tr>
                    <th rowspan="7">
                        <img src="<?php echo $stdInfo[0]['photo'] ?>" class='img-circle' style="width: 120px; height: 120px; border: 4px solid gray;">
                    </th>
                </tr>
                <tr>
                    <th>Student Name</th>
                    <td><?php echo $stdInfo[0]['fullname']; ?></td>
                </tr>
                <tr>
                    <th>Father Name</th>
                    <td><?php echo $stdInfo[0]['f_name']; ?></td>
                </tr>
                <tr>
                    <th>Father Contact #</th>
                    <td><?php echo $stdInfo[0]['phone']; ?></td>
                </tr>
                <tr>
                    <th>Father Occupation</th>
                    <td><?php echo $stdInfo[0]['f_occupation']; ?></td>
                </tr>
                <tr>
                    <th>Domicile District</th>
                    <td><?php echo $stdInfo[0]['d_district']; ?></td>
                </tr>
                <tr>
                    <th>Permanent Address</th>
                    <td><?php echo $stdInfo[0]['p_address']; ?></td>
                </tr>
            </table>
        </div>
        <div class="col-md-6" style="float: right;">
            <table class="table">
                <tr>
                    <th>Email</th>
                    <td><?php echo $stdInfo[0]['email']; ?></td>
                </tr>
                <tr>
                    <th>Quotta</th>
                    <td><?php echo $stdInfo[0]['quotta']; ?></td>
                </tr>
                <tr>
                    <th>Session</th>
                    <td><?php echo $stdInfo[0]['session']; ?></td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td><?php echo $stdInfo[0]['dob']; ?></td>
                </tr>
                <tr>
                    <th>Age</th>
                    <td>
                        <?php 
                            $bday = new DateTime($stdInfo[0]['dob']); // Your date of birth
                            $today = new Datetime(date('m.d.y'));
                            $diff = $today->diff($bday);
                            echo $diff->y." Years ".$diff->m." Months ".$diff->d." Days ";
                        ?>
                    </td>
                </tr>
                <tr>
                    <th>Current Address</th>
                    <td><?php echo $stdInfo[0]['c_address']; ?></td>
                </tr>
            </table>
        </div>  
    </div>
    <!-- Marriculation Record -->
    <div class="row">
        <div class="col-md-12">
            <h3><b>Matriculation Record</b></h3>
            <table class="table table-striped table-hover table-responsive table-bordered">
                <tr>
                    <th class="text-center">Institute</th>
                    <th class="text-center">Board</th>
                    <th class="text-center">Passing Year</th>
                    <th class="text-center">Obtained Marks</th>
                    <th class="text-center">Total Marks</th>
                    <th class="text-center">Grade</th>
                </tr>
                <tr class="text-center">
                    <td><?php echo $stdInfo[0]['institute1']; ?></td>
                    <td><?php echo $stdInfo[0]['board1']; ?></td>
                    <td><?php echo $stdInfo[0]['passing_year1']; ?></td>
                    <td><?php echo $stdInfo[0]['obtain_marks1']; ?></td>
                    <td><?php echo $stdInfo[0]['total_marks1']; ?></td>
                    <td><?php echo $stdInfo[0]['grade1']; ?></td>
                </tr>
            </table>
        </div>
    </div>
    <!-- Additional Educational Record -->
    <?php 
        if (!empty($stdInfo[0]['institute2'])) { ?>
            <div class="row">
                <div class="col-md-12">
                    <h3><b>Additional Educational Record</b></h3>
                    <table class="table table-striped table-hover table-responsive table-bordered">
                        <tr>
                            <th class="text-center">Institute</th>
                            <th class="text-center">Board</th>
                            <th class="text-center">Passing Year</th>
                            <th class="text-center">Obtained Marks</th>
                            <th class="text-center">Total Marks</th>
                            <th class="text-center">Grade</th>
                        </tr>
                        <tr class="text-center">
                            <td><?php echo $stdInfo[0]['institute2']; ?></td>
                            <td><?php echo $stdInfo[0]['board2']; ?></td>
                            <td><?php echo $stdInfo[0]['passing_year2']; ?></td>
                            <td><?php echo $stdInfo[0]['obtain_marks2']; ?></td>
                            <td><?php echo $stdInfo[0]['total_marks2']; ?></td>
                            <td><?php echo $stdInfo[0]['grade2']; ?></td>
                        </tr>
                    </table>
                </div>
            </div>
    <?php } ?>
</body>
</html>