<?php

namespace backend\controllers;

use Yii;
use yii\helpers\Html;
use yii\web\Controller;
use \yii\web\Response;
use yii\web\UploadedFile;
use common\models\StdInfo;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\StdInfoSearch;
use yii\web\NotFoundHttpException;

/**
 * StdInfoController implements the CRUD actions for StdInfo model.
 */
class StdInfoController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index', 'create', 'view', 'update', 'delete', 'bulk-delete' , 'bulk-sms'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all StdInfo models.
     * @return mixed
     */
    public function actionIndex()
    {    
        $searchModel = new StdInfoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Displays a single StdInfo model.
     * @param integer $id
     * @return mixed
     */
    // public function actionView($id)
    // {   
    //     $request = Yii::$app->request;
    //     if($request->isAjax){
    //         Yii::$app->response->format = Response::FORMAT_JSON;
    //         return [
    //                 'title'=> "StdInfo #".$id,
    //                 'content'=>$this->renderAjax('view', [
    //                     'model' => $this->findModel($id),
    //                 ]),
    //                 'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
    //                         Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
    //             ];    
    //     }else{
    //         return $this->render('view', [
    //             'model' => $this->findModel($id),
    //         ]);
    //     }
    // }

    public function actionView($id)
    { 
        return $this->render('student-details');
    }
    
    /**
     * Creates a new StdInfo model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new StdInfo();  

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Create new StdInfo",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }else if($model->load($request->post()) && $model->validate()){
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    // $model->photo = UploadedFile::getInstance($model,'photo');
                    // if(!empty($model->photo)){
                    //     $imageName = $model->fullname.'_photo'; 
                    //     $model->photo->saveAs('uploads/'.$imageName.'.'.$model->photo->extension);
                    //     //save the path in the db column
                    //     $model->photo = 'uploads/'.$imageName.'.'.$model->photo->extension;
                    // } else {
                    //    $model->photo = 'uploads/'.'std_default.jpg'; 
                    // }
                    $model->save();
                    $transaction->commit();
                        Yii::$app->session->setFlash('success', "You have successfully add Student...!");
                } catch (Exception $e) {
                    $transaction->rollBack();
                    Yii::$app->session->setFlash('error', "Transaction Failed, Try Again...!");
                }
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "Create new StdInfo",
                    'content'=>'<span class="text-success">Create StdInfo success</span>',
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Create More',['create'],['class'=>'btn btn-primary','role'=>'modal-remote'])
        
                ];         
            }else{           
                return [
                    'title'=> "Create new StdInfo",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];         
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->std_id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }
       
    }

    /**
     * Updates an existing StdInfo model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $request = Yii::$app->request;
        $model = $this->findModel($id);       

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Update StdInfo #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];         
            }else if($model->load($request->post()) && $model->validate()){
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    // $stdInfo = Yii::$app->db->createCommand("SELECT photo FROM std_info where std_id = $id")->queryAll();
                    // $model->photo = UploadedFile::getInstance($model,'photo');
                    // if(!empty($model->photo)){
                    //     $imageName = $model->fullname.'_photo'; 
                    //     $model->photo->saveAs('uploads/'.$imageName.'.'.$model->photo->extension);
                    //     //save the path in the db column
                    //     $model->photo = 'uploads/'.$imageName.'.'.$model->photo->extension;
                    // } else {
                    //    $model->photo = $stdInfo[0]['photo']; 
                    // }
                    $model->save();
                    $transaction->commit();
                        Yii::$app->session->setFlash('success', "You Have Successfully Update Student Record...!");
                } catch (Exception $e) {
                    $transaction->rollBack();
                    Yii::$app->session->setFlash('error', "Transaction Failed, Try Again...!");
                }
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "StdInfo #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
            }else{
                 return [
                    'title'=> "Update StdInfo #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];        
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->std_id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Delete an existing StdInfo model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $request = Yii::$app->request;
        $this->findModel($id)->delete();

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }


    }

     /**
     * Delete multiple existing StdInfo model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBulkDelete()
    {        
        $request = Yii::$app->request;
        $pks = explode(',', $request->post( 'pks' )); // Array or selected records primary keys
        foreach ( $pks as $pk ) {
            $model = $this->findModel($pk);
            $model->delete();
        }

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }
       
    }

    /**
     * Finds the StdInfo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StdInfo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StdInfo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionBulkSms()
    {      
        $request = Yii::$app->request;
        $pks = explode(',', $request->post( 'pks' )); // Array or selected records primary keys
        $array = array();
        // var_dump($array);
        // die();
        foreach ( $pks as $pk ) {
            $phoneNo = Yii::$app->db->createCommand("SELECT phone FROM std_info WHERE std_id = '$pk'")->queryAll();
            $number = $phoneNo[0]['phone'];
            $numb = str_replace('-', '', $number);
            $num = str_replace('+', '', $numb);
                    
            $array[] = $num;
        }

        $to = implode(',', $array);

        if (isset($_POST['message'])) {
            $message = $_POST['message'];
        
            $type = "xml";
            $id = "rchiatiryk";
            $pass = "institute29";
            $lang = "English";
            $mask = "IATI RYK";
            $message = urlencode($message);
            // Prepare data for POST request
            $data = "id=".$id."&pass=".$pass."&msg=".$message."&to=".$to."&lang=".$lang."&mask=".$mask."&type=".$type;

            // Send the POST request with cURL
            $ch = curl_init('http://www.outreach.pk/api/sendsms.php/sendsms/url');
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $result = curl_exec($ch); //This is the result from SMS4CONNECT
            curl_close($ch);     

            Yii::$app->session->setFlash('success', $result);
        }
        return $this->redirect(['/std-info']);
    }

}
