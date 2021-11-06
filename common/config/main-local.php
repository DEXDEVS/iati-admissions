<?php
return [
    'components' => [
        // 'db' => [
        //     'class' => 'yii\db\Connection',
        //     'dsn' => 'mysql:host=localhost;dbname=iatirykedutiry_iati-admissions-db',
        //     'username' => 'iatirykedutiry_iati-admissions-admin-db',
        //     'password' => 'dAITYiKyhA,R',
        //     'charset' => 'utf8',
        // ],
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=iati_db',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
    ],
];
