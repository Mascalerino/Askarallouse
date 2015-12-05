<?php 

	class Response extends AppModel {
        public $belongsTo=array(
            'UserResponses' => array(
                'className' => 'User',
                'foreignKey' => 'user_id'
                ),
            'PostResponses' => array(
                'className' => 'Post',
                'foreignKey' => 'post_id'
                )
        );
	}


?>