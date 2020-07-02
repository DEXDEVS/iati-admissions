<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StdInfo;

/**
 * StdInfoSearch represents the model behind the search form about `common\models\StdInfo`.
 */
class StdInfoSearch extends StdInfo
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['std_id', 'n_o_copies', 'obtain_marks1', 'total_marks1', 'obtain_marks2', 'total_marks2'], 'integer'],
            [['session', 'quotta', 'fullname', 'f_name', 'p_address', 'c_address', 'f_occupation', 'phone', 'd_district', 'dob', 'age', 'email', 'photo', 'institute1', 'board1', 'passing_year1', 'admission_date', 'grade1', 'institute2', 'board2', 'passing_year2', 'grade2'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = StdInfo::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'std_id' => $this->std_id,
            'session' => $this->session,
            'dob' => $this->dob,
            'n_o_copies' => $this->n_o_copies,
            'passing_year1' => $this->passing_year1,
            'obtain_marks1' => $this->obtain_marks1,
            'total_marks1' => $this->total_marks1,
            'admission_date' => $this->admission_date,
            'passing_year2' => $this->passing_year2,
            'obtain_marks2' => $this->obtain_marks2,
            'total_marks2' => $this->total_marks2,
        ]);

        $query->andFilterWhere(['like', 'quotta', $this->quotta])
            ->andFilterWhere(['like', 'fullname', $this->fullname])
            ->andFilterWhere(['like', 'f_name', $this->f_name])
            ->andFilterWhere(['like', 'p_address', $this->p_address])
            ->andFilterWhere(['like', 'c_address', $this->c_address])
            ->andFilterWhere(['like', 'f_occupation', $this->f_occupation])
            ->andFilterWhere(['like', 'phone', $this->phone])
            ->andFilterWhere(['like', 'd_district', $this->d_district])
            ->andFilterWhere(['like', 'age', $this->age])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'photo', $this->photo])
            ->andFilterWhere(['like', 'institute1', $this->institute1])
            ->andFilterWhere(['like', 'board1', $this->board1])
            ->andFilterWhere(['like', 'grade1', $this->grade1])
            ->andFilterWhere(['like', 'institute2', $this->institute2])
            ->andFilterWhere(['like', 'board2', $this->board2])
            ->andFilterWhere(['like', 'grade2', $this->grade2]);

        return $dataProvider;
    }
}
