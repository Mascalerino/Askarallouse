<?php

class UsuariosController extends AppController {

    function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->allow('login', 'nuevo', 'logout');
    }

    public function index() {
		$this->User->recursive = 0;
		$this->set('users', $this->Paginator->paginate());
	}

	public function login() {
	    if ($this->request->is('post')) {
	        if ($this->Auth->login()) {
	            return $this->redirect($this->Auth->redirectUrl());
	        }
	        $this->Flash->error(__('Invalid username or password, try again'));
	    }
	}

	public function logout() {
	    return $this->redirect($this->Auth->logout());
	}

	public function nuevo() {
		if($this->request->is('post')) {
			$this->Usuario->create();

			if($this->Usuario->save($this->request->data)) {
				$this->Flash->set('El usuario ha sido creado correctamente.', 'default', array('class' => 'alert alert-success'));
				return $this->redirect(array('action' => 'login'));
			}	
			$this->Flash->set('El usuario no se ha podido crear.', 'default', array('class' => 'alert alert-danger'));			
		}
	}
}
?>