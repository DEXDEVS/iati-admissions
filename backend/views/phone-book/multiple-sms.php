<div class="container-fluid">
    <form method="post">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">          
                </div>    
            </div>    
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-primary">
                    <div class="panel-heading"><h2>Message Panel</h2></div>
                        <div class="panel-body">
                            <textarea type="text" name="to" class="form-control" rows="7" placeholder="Enter Number in Format i.e: 9230001234567,923021234567 ..."></textarea>
                        </div>
                        <div class="panel-body">
                            <textarea type="text" name="message" class="form-control" rows="7" placeholder="Type Your Alert Message Here ..."></textarea>
                        </div>
                    <div class="panel-footer panel-primary">
                        <input type='submit' name="submit" class="btn btn-block btn-success"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<?php
//  $conn = mysqli_connect("localhost","root","","college_db");
        
    if (isset($_POST['message'])) {
        $to = $_POST['to'];
        $message = $_POST['message'];

        $type = "xml";
        $id = "rchiatiryk";
        $pass = "institute29";
        $lang = "English";
        $mask = "IATI RYK";
        $message = urlencode($message);
        // Prepare data for POST request
        $data = "id=".$id."&pass=".$pass."&msg=".$message."&to=".$to."&lang=".$lang."&mask=".$mask."&type=".$type;

        // Send the POST request with cURL
        $ch = curl_init('http://www.sms4connect.com/api/sendsms.php/sendsms/url');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch); //This is the result from SMS4CONNECT
        curl_close($ch);     

        Yii::$app->session->setFlash('success', $result);
    }
    return $this->redirect(['/phone-book']);
    // echo 
    //     "<div class='alert alert-success text-center'>
    //         <p>Message sent successfully...!</p>
    //     </div>";
    // }   
?>
