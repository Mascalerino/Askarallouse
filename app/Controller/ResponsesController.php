<?php 

	class ResponsesController extends AppController {

		public function beforeFilter() {
			parent::beforeFilter();
			$this->Auth->allow('');
		}

		public $paginate = array('limit' => 2,
								'order' => array('Response.initDate' => 'desc') );

		public function index() {}

		public function add() {
			if($this->request->is('post')) {
				$this->Response->create();
				if($this->Response->save($this->request->data)) {
					$this->Flash->success('La respuesta ha sido creada', array('class' => 'alert alert-success'));
					return $this->redirect($this->referer());
				}
				$this->Flash->error('La respuesta no ha podido crearse correctamente');				
			}


		}
		
	}


?>