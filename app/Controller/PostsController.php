<?php 

	class PostsController extends AppController {
		public function beforeFilter() {
			parent::beforeFilter();
			$this->Auth->allow('index', 'view', 'search');
		}

		public $paginate = array('limit' => 5,
								'order' => array('Post.initDate' => 'desc') );




		public function index() {
			$this->Paginator->settings = $this->paginate;
			$data = $this->Paginator->paginate('Post');
			$this->set('posts', $data);		
		}

		public function view($id = null) {
			if(!$id) {
				throw new NotFoundException("Datos erróneos.");
			}			
			$post = $this->Post->findById($id);
			$responses = $this->Post->query("SELECT * FROM responses WHERE post_id=".$id."");
			if(!$post) {
				throw new NotFoundException("El post no existe");
			}
			$this->set('post', $post);
			$this->set('responses', $responses);
		}

		public function add() {
			if($this->request->is('post')) {
				$this->Post->create();
				if($this->Post->save($this->request->data)) {
					$this->Flash->success('La pregunta ha sido creada.', array('class' => 'alert alert-success'));
					return $this->redirect($this->referer());
				}
				$this->Flash->error('La pregunta no ha podido crearse correctamente.');				
			}
			
		}

		public function edit($id = null) {
		    if (!$id) {
		        throw new NotFoundException('Invalid post');
		    }

		    $post = $this->Post->findById($id);
		    if (!$post) {
		        throw new NotFoundException('Invalid post');
		    }

		    if ($this->request->is(array('post', 'put'))) {
		        $this->Post->id = $id;
		   		if($this->isValidUser($id, $this->Session->read('Auth.User.id'))) {
			        if ($this->Post->save($this->request->data)) {
			            $this->Flash->success('La pregunta ha sido modificada correctamente');
			            return $this->redirect(array('action' => 'index'));
			        }
			        $this->Flash->error('La pregunta no se ha podido modificar');
			    }
			}

		    if (empty($this->request->data)) {
		        $this->request->data = $post;
		    }
		}

		public function delete($id) {
		    if ($this->request->is('get')) {
		        throw new MethodNotAllowedException();
		    }
		    if($this->isValidUser($id, $this->Session->read('Auth.User.id'))) {
			    if ($this->Post->delete($id)) {
			        $this->Flash->success('La pregunta se ha eliminado correctamente', ($id));
			    } else {
			        $this->Flash->error('La pregunta no se ha podido eliminar', ($id));
			    }
			} else {
				$this->Flash->error('El usuario no esta autorizado para eliminar esta pregunta', ($id));
			}

		    return $this->redirect(array('action' => 'index'));
		}


		public function search() {
			$datos = $this->request->query['search'];

			$this->Paginator->settings = array(
				'limit' => 5,
				'order' => array(
					'Post.initDate' => 'desc'),
					'conditions'=>array( 'OR' => array(
					array('Post.title LIKE'=>'%'.$datos.'%'),
					array('Post.content LIKE'=>'%'.$datos.'%'),)
				));

			$data = $this->Paginator->paginate('Post');

			foreach ($data as $key => $row) {
				$sql = "Select * from posts where id = ".$row["Post"]["id"]."";
			}

			$this->set('search', $data);
		}
           

        


		private function isValidUser($id, $user_id) {
			$ownerPost = $this->Post->findById($id);
			print_r($ownerPost);
			if($ownerPost['Post']['user_id'] == $user_id) {
				return true;
			} else {
				return false;
			}

		}

	}


?>