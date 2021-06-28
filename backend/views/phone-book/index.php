<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\grid\GridView;
use johnitvn\ajaxcrud\CrudAsset; 
use johnitvn\ajaxcrud\BulkButtonWidget;

/* @var $this yii\web\View */
/* @var $searchModel common\models\PhoneBookSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Phone Books';
$this->params['breadcrumbs'][] = $this->title;

CrudAsset::register($this);

?>
<style type="text/css">
    .panel-heading{
        background-color: #001F3F;
        color: white;
    }
</style>
<div class="phone-book-index">
    <div id="ajaxCrudDatatable">
        <button type="button" class="btn btn-primary btn-sm btn-flat fa fa-comments pull-right" data-toggle="modal" data-target="#modal-default"> Send <b>SMS</b> to <b>Multiple</b> Numbers</b></button><br><br>
        <?=GridView::widget([
            'id'=>'crud-datatable',
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'pjax'=>true,
            'columns' => require(__DIR__.'/_columns.php'),
            'toolbar'=> [
                ['content'=>
                    Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'],
                    ['role'=>'modal-remote','title'=> 'Create new Phone Books','class'=>'btn btn-success']).
                    Html::a('<i class="glyphicon glyphicon-repeat"></i>', [''],
                    ['data-pjax'=>1, 'class'=>'btn btn-warning', 'title'=>'Reset Grid']).
                    '{toggleData}'.
                    '{export}'
                ],
            ],          
            'striped' => true,
            'condensed' => true,
            'responsive' => true,          
            'panel' => [
                'type' => '', 
                'heading' => '<i class="glyphicon glyphicon-list"></i> Phone Books listing',
                'before'=>'<em>* Resize table columns just like a spreadsheet by dragging the column edges.</em>',
                'after'=>BulkButtonWidget::widget([
                        // 'buttons'=>Html::a('<i class="glyphicon glyphicon-trash"></i>&nbsp; Delete All',
                        //     ["bulk-delete"] ,
                        //     [
                        //         "class"=>"btn btn-danger btn-xs",
                        //         'role'=>'modal-remote-bulk',
                        //         'data-confirm'=>false, 'data-method'=>false,// for overide yii data api
                        //         'data-request-method'=>'post',
                        //         'data-confirm-title'=>'Are you sure?',
                        //         'data-confirm-message'=>'Are you sure want to delete this item'
                        //     ]),
                    'buttons'=>Html::a('<i class="fa fa-comments-o"></i>&nbsp; Bulk SMS',
                        ["bulk-sms"] ,
                        [
                            "class"=>"btn btn-success btn-xs btn-flat",
                            'role'=>'modal-remote-bulk',
                            'data-confirm'=>false, 'data-method'=>false,// for overide yii data api
                            'data-request-method'=> 'post',
                            'data-confirm-title'=> 'SMS',
                            'data-confirm-message'=>'<textarea name="message" class="form-control" rows="10" placeholder="Type message here"></textarea>'
                        ]),
                    ]).
                    
                    '<div class="clearfix"></div>',
            ]
        ])?>
    </div>
<!-- SMS MODAL Start -->
    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title">SEND SMS</h3>
                </div>
                <form method="POST" action="">
                    <div class="modal-body"> 
                        <p>Phone Numbers</p>
                        <textarea name="to" rows="7" class="form-control" required="" id="to" placeholder="Phone Numbers Format 923001234567,923007654321..."></textarea>
                        <p>Message Body</p>
                        <textarea name="message" rows="10" class="form-control" id="message" required=""></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger btn-flat pull-left" data-dismiss="modal">Close</button>
                        <button type="submit" name="sms" class="btn btn-success btn-sm btn-flat fa fa-comments-o"> Send <b>SMS</b></button>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- SMS Modal CLose -->
</div>
<?php Modal::begin([
    "id"=>"ajaxCrudModal",
    "footer"=>"",// always need it for jquery plugin
])?>
<?php Modal::end(); ?>
<?php 
    if (isset($_POST['sms'])) {
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
        $ch = curl_init('http://www.outreach.pk/api/sendsms.php/sendsms/url');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $result = curl_exec($ch); //This is the result from SMS4CONNECT
        curl_close($ch);  
        Yii::$app->session->setFlash('success', $result);
    } // ending of if(isset($_POST));
?> 
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
// Remove Flash Alert....
$( document ).ready(function(){
    $('#alert').fadeIn(function(){
       $('#alert').delay(5000).fadeOut(); 
    });
});
</script>