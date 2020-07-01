<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\StdInfo */
?>
<div class="std-info-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'std_id',
            'session',
            'quotta',
            'fullname',
            'f_name',
            'p_address',
            'c_address',
            'f_occupation',
            'phone',
            'd_district',
            'dob',
            'age',
            'email:email',
            'photo',
            'n_o_copies',
            'institute1',
            'board1',
            'passing_year1',
            'obtain_marks1',
            'total_marks1',
            'grade1',
            'institute2',
            'board2',
            'passing_year2',
            'obtain_marks2',
            'total_marks2',
            'grade2',
        ],
    ]) ?>

</div>
