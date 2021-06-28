<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\SmsGroups;

/* @var $this yii\web\View */
/* @var $model common\models\PhoneBook */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="phone-book-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="row">
        <div class="col-md-12">  
            <?= $form->field($model, 'sms_groups_id')->dropDownList(
                ArrayHelper::map(SmsGroups::find()->all(),'id','group_name'),
                ['prompt'=>'Select Sms Groups']
            )?> 
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'contact_person')->textInput(['maxlength' => true]) ?>            
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'phone_no')->widget(yii\widgets\MaskedInput::class, [ 'mask' => '+99-999-9999999']) ?> 
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>            
        </div>
    </div>

    <?php if (!Yii::$app->request->isAjax){ ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>

