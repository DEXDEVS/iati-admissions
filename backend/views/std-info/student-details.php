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

<div class="container" style="margin-top: -50px;">
    <div class="row">
        <div class="col-md-12 text-center">
            
        </div>
    </div><br>
    <div class="row">
        <div class="col-md-12" style="border: 2px solid; border-radius: 15px 5px 15px 5px;">
            <p style="text-align: center;">
                <img src="images/iati.png" style="width: 110px; margin-top: 5px;">
            </p>
            <h1 class="text-center" style="font-size: 23px;"><b>IN-SERVICE AGRICULUTRE TRAINING INSTITUTE</b></h1>
            <h3 class="text-center" style="margin-top: -10px">Rahim Yar Khan</h3>
            <h4 class="text-center" style="margin-top: -10px">Three Year Field Assistant Diploma in Agriculture Science</h4>
            <h3 class="text-center" style="margin-top: -5px"><b>Student Details</b></h3>
            <p class="text-center" style="margin-top: -5px">Admission Date: <b><?php echo date("d-M-Y", strtotime($stdInfo[0]['admission_date'])); ?></b></p>
        </div>
    </div><br>

    <div class="row">
        <div class="col-md-12" style="float: left;">
            <table class="table">
                <tr>
                    <th>Student Name</th>
                    <th>Father Name</th>
                    <th>Father Contact #</th>
                    <th>Father Occupation</th>
                    <th>Domicile District</th>      
                </tr>
                <tr>
                    <td><?php echo $stdInfo[0]['fullname']; ?></td>
                    <td><?php echo $stdInfo[0]['f_name']; ?></td>
                    <td><?php echo $stdInfo[0]['phone']; ?></td>
                    <td><?php echo $stdInfo[0]['f_occupation']; ?></td>
                    <td><?php echo $stdInfo[0]['d_district']; ?></td>
                </tr>
                 <tr>
                    <th>Quotta</th>
                    <th>Session</th>
                    <th>Date of Birth</th>
                    <th>Age</th>              
                    <th>Email</th>
                </tr>
                <tr>
                    <td><?php echo $stdInfo[0]['quotta']; ?></td>
                    <td><?php echo $stdInfo[0]['session']; ?></td>
                    <td><?php echo $stdInfo[0]['dob']; ?></td>
                    <td>
                        <?php 
                            $bday  = new DateTime($stdInfo[0]['dob']); // Your date of birth
                            $today = new Datetime(date('m.d.y'));
                            $diff  = $today->diff($bday);
                            echo $diff->y." Years ".$diff->m." Months ".$diff->d." Days ";
                        ?>
                    </td>
                    <td><?php echo $stdInfo[0]['email']; ?></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <tr>
                    <th>Permanent Address</th>
                    <th>Current Address</th>
                </tr>
                <tr>
                    <td><?php echo $stdInfo[0]['p_address']; ?></td>
                    <td><?php echo $stdInfo[0]['c_address']; ?></td>
                </tr>
            </table>
        </div>
    </div>
    <!-- Marriculation Record -->
    <div class="row">
        <div class="col-md-12">
            <h4><b>Matriculation Record</b></h4>
            <table class="table table-striped table-condensed table-hover table-responsive table-bordered">
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
            <div class="row" style="margin-top: -10px;">
                <div class="col-md-12">
                    <h4><b>Additional Educational Record</b></h4>
                    <table class="table table-striped table-condensed table-hover table-responsive table-bordered">
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