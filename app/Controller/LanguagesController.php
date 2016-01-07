<?php
App::uses('AppController', 'Controller');
class LanguagesController extends AppController {
	public $helpers = array('Html', 'Form');
	public $components = array('Flash', 'Paginator', 'Session');

	public function beforeFilter(){
		parent::beforeFilter();
		$this->Auth->allow('changeLanguages');
		$this->set('current_user', $this->Auth->user());
	}
	public function changeLanguages($lang){
		if(!empty($lang)){
			if($lang == 'esp'){
				$this->Session->write('Config.language', 'esp');
			}else if($lang == 'eng'){
				$this->Session->write('Config.language', 'eng');
			}
			$this->redirect($this->referer());
		}

	}
	function index(){}


}
?>