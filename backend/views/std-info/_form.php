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
        <div class="col-md-4">
            <?= $form->field($model, 'session')->textInput(['maxlength' => true, 'value' => '2020']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'quotta')->dropDownList([ 'Open Merit' => 'Open Merit', 'Quotta' => 'Quotta', ], ['prompt' => 'Select Quotta']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'admission_date')->textInput(['value'=> date("Y-m-d"), 'readonly' => true]) ?>
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
            <?= $form->field($model, 'age')->textInput(['maxlength' => true, 'id' => 'age']) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'n_o_copies')->textInput() ?>
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
	        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
	    </div>
	<?php } ?>

    <?php ActiveForm::end(); ?>
    
</div>


<script>
$('#date').on('change',function(){
    var date = $('#date').val();
    
    var now = new Date();
  var today = new Date(now.getYear(),now.getMonth(),now.getDate());

  var yearNow = now.getYear();
  var monthNow = now.getMonth();
  var dateNow = now.getDate();

  var dob = new Date(date);

  var yearDob = dob.getYear();
  var monthDob = dob.getMonth();
  var dateDob = dob.getDate();
  var age = {};
  var ageString = "";
  var yearString = "";
  var monthString = "";
  var dayString = "";


  yearAge = yearNow - yearDob;

  if (monthNow >= monthDob)
    var monthAge = monthNow - monthDob;
  else {
    yearAge--;
    var monthAge = 12 + monthNow -monthDob;
  }

  if (dateNow >= dateDob)
    var dateAge = dateNow - dateDob;
  else {
    monthAge--;
    var dateAge = 31 + dateNow - dateDob;

    if (monthAge < 0) {
      monthAge = 11;
      yearAge--;
    }
  }

  age = {
      years: yearAge,
      months: monthAge,
      days: dateAge
      };

  if ( age.years > 1 ) yearString = " years";
  else yearString = " year";
  if ( age.months> 1 ) monthString = " months";
  else monthString = " month";
  if ( age.days > 1 ) dayString = " days";
  else dayString = " day";


  if ( (age.years > 0) && (age.months > 0) && (age.days > 0) )
    ageString = age.years + yearString + ", " + age.months + monthString + ", and " + age.days + dayString + " old.";
  else if ( (age.years == 0) && (age.months == 0) && (age.days > 0) )
    ageString = "Only " + age.days + dayString + " old!";
  else if ( (age.years > 0) && (age.months == 0) && (age.days == 0) )
    ageString = age.years + yearString + " old. Happy Birthday!!";
  else if ( (age.years > 0) && (age.months > 0) && (age.days == 0) )
    ageString = age.years + yearString + " and " + age.months + monthString + " old.";
  else if ( (age.years == 0) && (age.months > 0) && (age.days > 0) )
    ageString = age.months + monthString + " and " + age.days + dayString + " old.";
  else if ( (age.years > 0) && (age.months == 0) && (age.days > 0) )
    ageString = age.years + yearString + " and " + age.days + dayString + " old.";
  else if ( (age.years == 0) && (age.months > 0) && (age.days == 0) )
    ageString = age.months + monthString + " old.";
  else ageString = "Oops! Could not calculate age!";
    
$('#age').val(ageString);
    //alert(ageString);

    });
</script>
