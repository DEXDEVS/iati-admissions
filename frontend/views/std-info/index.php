<?php
use yii\helpers\Url;
use yii\helpers\Html;
use yii\bootstrap\Modal;
use kartik\grid\GridView;
use johnitvn\ajaxcrud\CrudAsset; 
use johnitvn\ajaxcrud\BulkButtonWidget;
use kartik\export\ExportMenu;

/* @var $this yii\web\View */
/* @var $searchModel common\models\StdInfoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Student Admissions Record';
$this->params['breadcrumbs'][] = $this->title;

CrudAsset::register($this);

?>
<div class="std-info-index">
    <div id="ajaxCrudDatatable">
        <?=GridView::widget([
            'id'=>'crud-datatable',
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'pjax'=>true,
            'columns' => require(__DIR__.'/_columns.php'),
            'toolbar'=> [
                ['content'=>
                    Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'],
                    ['role'=>'modal-remote','title'=> 'Create Student Admission','class'=>'btn btn-success']).
                    Html::a('<i class="glyphicon glyphicon-repeat"></i>', [''],
                    ['data-pjax'=>1, 'class'=>'btn btn-warning', 'title'=>'Reset Grid']).
                    '{toggleData}'
                    //'{export}'
                ],
                $gridColumns = [
                    'std_id',
                    'fullname',
                    'f_name',
                    'f_occupation',
                    'phone',
                    'session',
                    'quotta',
                    'p_address',
                    'c_address',
                    'd_district',
                    'dob',
                    'age',
                    'email',
                    'n_o_copies',
                    'institute1',
                    'board1',
                    'passing_year1',
                    'obtain_marks1',
                    'grade1',
                ],
                //Reader a export dropdown menu
                ExportMenu::widget([
                    'dataProvider' => $dataProvider,
                    'columns' => $gridColumns
                ]),
            ],          
            'striped' => true,
            'condensed' => true,
            'responsive' => true,          
            'panel' => [
                'type' => 'primary', 
                'heading' => '<i class="glyphicon glyphicon-list"></i> Student Admissions Listing',
                'before'=>'<em>* Resize table columns just like a spreadsheet by dragging the column edges.</em>',
                // 'after'=>BulkButtonWidget::widget([
                //     'buttons'=>Html::a('<i class="glyphicon glyphicon-trash"></i>&nbsp; Delete All',
                //         ["bulk-delete"] ,
                //         [
                //             "class"=>"btn btn-danger btn-xs",
                //             'role'=>'modal-remote-bulk',
                //             'data-confirm'=>false, 'data-method'=>false,// for overide yii data api
                //             'data-request-method'=>'post',
                //             'data-confirm-title'=>'Are you sure?',
                //             'data-confirm-message'=>'Are you sure want to delete this item'
                //         ]),
                // ]).                        
                '<div class="clearfix"></div>',
            ]
        ])?>
    </div>
</div>
<?php Modal::begin([
    "id"=>"ajaxCrudModal",
    "size"=>"modal-lg",
    "footer"=>"",// always need it for jquery plugin
])?>
<?php Modal::end(); ?>
