<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_info".
 *
 * @property int $std_id
 * @property string $session
 * @property string $quotta
 * @property string $fullname
 * @property string $f_name
 * @property string $p_address
 * @property string $c_address
 * @property string $f_occupation
 * @property string $phone
 * @property string $d_district
 * @property string $dob
 * @property string $age
 * @property string $email
 * @property string $photo
 * @property int $n_o_copies
 * @property string $institute1
 * @property string $board1
 * @property string $passing_year1
 * @property int $obtain_marks1
 * @property int $total_marks1
 * @property string $grade1
 * @property string|null $institute2
 * @property string|null $board2
 * @property string|null $passing_year2
 * @property int|null $obtain_marks2
 * @property int|null $total_marks2
 * @property string|null $grade2
 */
class StdInfo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_info';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['session', 'quotta', 'fullname', 'f_name', 'p_address', 'c_address', 'f_occupation', 'phone', 'd_district', 'dob', 'age', 'email', 'n_o_copies', 'institute1', 'board1', 'passing_year1', 'obtain_marks1', 'total_marks1', 'grade1', 'photo'], 'required'],
            [['session', 'dob', 'passing_year1', 'passing_year2'], 'safe'],
            [['quotta'], 'string'],
            [['n_o_copies', 'obtain_marks1', 'total_marks1', 'obtain_marks2', 'total_marks2'], 'integer'],
            [['fullname', 'f_name', 'age', 'email'], 'string', 'max' => 60],
            [['p_address', 'c_address'], 'string', 'max' => 255],
            [['f_occupation', 'd_district', 'board1', 'board2'], 'string', 'max' => 30],
            [['phone'], 'string', 'max' => 16],
            ['email','email'],
            [['photo'], 'string', 'max' => 200],
            [['photo'], 'image', 'extensions' => 'jpg'],
            [['institute1', 'institute2'], 'string', 'max' => 100],
            [['grade1', 'grade2'], 'string', 'max' => 10],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'std_id' => 'Std ID',
            'session' => 'Session',
            'quotta' => 'Quotta',
            'fullname' => 'Student Name',
            'f_name' => 'Father Name',
            'p_address' => 'Permanent Address',
            'c_address' => 'Current Address',
            'f_occupation' => 'Father Occupation',
            'phone' => 'Phone',
            'd_district' => 'Domicile District',
            'dob' => 'Dob',
            'age' => 'Age',
            'email' => 'Email',
            'photo' => 'Photo',
            'n_o_copies' => 'No. of Copies Attached',
            'institute1' => 'Institute',
            'board1' => 'Board',
            'passing_year1' => 'Passing Year',
            'obtain_marks1' => 'Obtain Marks',
            'total_marks1' => 'Total Marks',
            'grade1' => 'Grade',
            'institute2' => 'Institute',
            'board2' => 'Board',
            'passing_year2' => 'Passing Year',
            'obtain_marks2' => 'Obtain Marks',
            'total_marks2' => 'Total Marks',
            'grade2' => 'Grade2',
        ];
    }
    
    public function getPhotoInfo(){
        $path = Url::to('@web/uploads/');
        $url = Url::to('@web/uploads/');
        $filename = $this->fullname.'_photo'.'.jpg';
        $alt = $this->fullname."'s image not exist!";

        $imageInfo = ['alt'=>$alt];

        if(file_exists($path.$filename)){
            $imageInfo['url'] = $url.'default.jpg';
        }  else {
            $imageInfo['url'] = $url.$filename; 
        }
        return $imageInfo;
    }

}
