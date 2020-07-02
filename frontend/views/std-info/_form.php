<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\datetimepicker\DateTimePicker;

/* @var $this yii\web\View */
/* @var $model common\models\StdInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="std-info-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'session')->textInput(['maxlength' => true, 'value' => '2020']) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'quotta')->dropDownList([ 'Open Merit' => 'Open Merit', 'Quotta' => 'Quotta', ], ['prompt' => 'Select Quotta']) ?>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'fullname')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'f_name')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'f_occupation')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'phone')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'd_district')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">    
            <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4">  
            <label>DOB</label>  
            <?= DateTimePicker::widget([
                        'model' => $model,
                        'attribute' => 'dob',
                        'language' => 'en',
                        'size' => 'ms',
                        'clientOptions' => [
                            'autoclose' => true,
                            'format' => 'yyyy-mm-dd',
                            'startDate' => date('1970-01-01'),
                            'endDate' => date(''),
                            'todayBtn' => true
                        ],
                        'options' => ['id' => 'date']
                    ]);?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'n_o_copies')->textInput() ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'admission_date')->textInput(['value'=> date("Y-m-d"), 'readonly' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'p_address')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'c_address')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3><b style="font-family: georgia;">Matriculation Record</b></h3>
            <table class="table table-striped table-hover">
                <tr>
                    <td>
                        <?= $form->field($model, 'institute1')->textInput(['maxlength' => true])?>
                    </td>
                    <td>
                        <?= $form->field($model, 'board1')->textInput(['maxlength' => true]) ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'passing_year1')->textInput(['maxlength' => true]) ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'obtain_marks1')->textInput() ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'total_marks1')->textInput() ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'grade1')->textInput(['maxlength' => true]) ?>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h3><b style="font-family: georgia;">Additional Educational Record (If Any)</b></h3>
            <table class="table table-striped table-hover">
                <tr>
                    <td>
                        <?= $form->field($model, 'institute2')->textInput(['maxlength' => true])?>
                    </td>
                    <td>
                        <?= $form->field($model, 'board2')->textInput(['maxlength' => true]) ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'passing_year2')->textInput(['maxlength' => true]) ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'obtain_marks2')->textInput() ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'total_marks2')->textInput() ?>
                    </td>
                    <td>
                        <?= $form->field($model, 'grade2')->textInput(['maxlength' => true]) ?>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </div>
    </div>
  
	<?php if (!Yii::$app->request->isAjax){ ?>
	  	<div class="form-group">
	        <?= Html::submitButton($model->isNewRecord ? 'Submit' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
          <?= Html::a('Cancel', ['/'],
                    ['role'=>'','title'=> 'cancel','class'=>'btn btn-danger']); ?>
	    </div>
	<?php } ?>
    <?php ActiveForm::end(); ?>
</div>