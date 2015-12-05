<?php

App::uses('BlowfishPasswordHasher', 'Controller/Component/Auth');
App::uses('AppModel', 'Model');

class Usuario extends AppModel {
	public $validate = array(

			'alias' => array(
				'notBlank' => array(
					'rule' => 'notBlank'
				),
				'isUnique' => array(
					'rule' => 'isUnique',
					'message' => 'El alias debe ser único.'					
				),
			    'size' => array(
			        'rule' => array('lengthBetween', 1, 20),
			        'message' => 'El alias debe tener al menos 1 caracter y como máximo 20.'
			    )								
			),	
			'nombre' => array(
				'rule' => 'notBlank'			
			),
			'apellidos' => array(
				'rule' => 'notBlank'			
			),
			'password' => array(
				'rule' => 'notBlank'			
			),
			'email' => array(
				'notBlank' => array(
					'rule' => 'notBlank'
				),
				'isUnique' => array(
					'rule' => 'isUnique',
					'message' => 'El correo electrónico ya se encuentra registrado.'					
				)		
			)									
	);

	public function beforeSave($options = array()) {
		if(isset($this->data[$this->alias]['password']))
		{
			$passwordHasher = new BlowfishPasswordHasher();
			$this->data[$this->alias]['password'] = $passwordHasher->hash($this->data[$this->alias]['password']);
		}
		return true;
	}
	
}

?>



