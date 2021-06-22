<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\SmsGroups */
?>
<div class="sms-groups-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'group_name',
        ],
    ]) ?>

</div>
