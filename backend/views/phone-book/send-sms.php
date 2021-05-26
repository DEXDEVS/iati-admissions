<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\PhoneBook */

?>
<div class="send-sms">
    <?= $this->render('_sms', [
        'model' => $model,
    ]) ?>
</div>