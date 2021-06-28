<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "phone_book".
 *
 * @property int $id
 * @property int $sms_groups_id
 * @property string $contact_person
 * @property string $phone_no
 * @property string $address
 * @property string $created_at
 * @property string|null $updated_at
 * @property int $created_by
 * @property int $updated_by
 */
class PhoneBook extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'phone_book';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sms_groups_id', 'contact_person', 'phone_no', 'address'], 'required'],
            [['sms_groups_id', 'created_by', 'updated_by'], 'integer'],
            [['created_at', 'updated_at', 'sms_groups_id'], 'safe'],
            [['contact_person'], 'string', 'max' => 32],
            [['phone_no'], 'string', 'max' => 15],
            [['address'], 'string', 'max' => 200],
            [['sms_groups_id'], 'exist', 'skipOnError' => true, 'targetClass' => SmsGroups::className(), 'targetAttribute' => ['sms_groups_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'sms_groups_id' => 'Sms Groups ID',
            'contact_person' => 'Contact Person',
            'phone_no' => 'Phone No',
            'address' => 'Address',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    public function getSmsGroups()
    {
        return $this->hasOne(SmsGroups::className(), ['id' => 'sms_groups_id']);
    }
}
