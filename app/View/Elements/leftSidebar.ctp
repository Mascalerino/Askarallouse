  

      <div class="col-md-2 col-lg-2 sidebar sidebar-mod well text-white">
        <div class="container-fluid no-padding-side">
          <div class="pull-left image">
            <!--<img class="img-circle size-img" src="img/new_logo.jpg" alt="avatar">-->
            <?php echo $this->Html->image('new_logo.jpg', array('alt' => 'avatar', 'class' => 'img-circle size-img')); ?>
          </div>
          <div class="pull-left info">
            <p><?= $current_user['username']; ?></p>
           
          <?php echo $this->Html->link("<i class='fa fa-circle text-success'></i> ".__('Conectado'),array(),array('escape' => false)); ?>
          </div>
        </div>
        <ul class="nav nav-sidebar text-white">
          <?php echo "<li>".$this->Html->link("<i class='glyphicon glyphicon-user'></i> ".__('Perfil'),array(),array('escape' => false))."<li>"; ?>
          <?php echo "<li>".$this->Html->link("<i class='glyphicon glyphicon-search'></i> ".__('Buscar'),array(),array('escape' => false))."<li>"; ?> 
          <?php echo "<li>".$this->Html->link("<i class='glyphicon glyphicon-filter'></i> ".__('Filtrar'),array(),array('escape' => false))."<li>"; ?>

          <?php echo "<li>".$this->Html->link("<i class='fa fa-envelope'></i> ".__('Mensajes'),array(),array('escape' => false))."<li>"; ?>

                        
         
          <li><a href="#pregunta" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-plus"></i><span> <?php echo __('Preguntas') ?></span></a></li>

           <?php echo "<li>".$this->Html->link("<i class='fa fa-circle-o text-red'></i> ".__('Favoritas'),array(),array('escape' => false))."<li>"; ?>
           <?php echo "<li>".$this->Html->link("<i class='fa fa-circle-o text-orange'></i> ".__('Mis Preguntas'),array(),array('escape' => false))."<li>"; ?> 
           <?php echo "<li>".$this->Html->link("<i class='fa fa-circle-o text-aqua'></i> ".__('Mis Respuestas'),array(),array('escape' => false))."<li>"; ?> 

                      
        </ul> 
      </div>

              <!-- MODAL PREGUNTA -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title txt-center" id="myModalLabel"><?php echo __('pregunta') ?></h3>
              </div>
              <div class="modal-body">
                <!--<form role="form">-->
                <?php 
                echo $this->Form->create('Post', array('controller' => 'posts', 'action'=>'add')); 
                  echo $this->Form->hidden('user_id', array('value' => $current_user['id']));
                  echo $this->Form->hidden('initDate', array('value' => date('Y-m-d H:i:s')));

                ?>
                  <!--<div class="form-group">
                    <label for="email">Nueva pregunta:</label>
                    <input type="text" class="form-control" id="nuevaPregunta">
                  </div>-->
                  <div class="form-group">
                    <!--<label for="email">Título pregunta:</label>-->
                    <!--<input type="text" class="form-control" id="tituloPregunta">-->
                     <?php echo $this->Form->input('title', array('class' => 'form-control')); ?>
                  </div>
                  <!--<div class="form-group">
                    <label for="email">Tags:</label>
                    <input type="text" class="form-control" id="tags">
                  </div>-->
                  <div class="form-group">
                    <label for="email"><?php echo __('Descripción:') ?></label>
                    <!--<textarea placeholder="Descripción..." class="form-control txtarea-mod" id="descripcion" rows="3"></textarea>-->
                    <?php echo $this->Form->textarea('content', array('class' => 'form-control', 'rows' => '3')); ?>
                  </div>   
                <!--</form>-->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo __('Cerrar') ?></button>
                <!--<button type="button" class="btn btn-primary">Enviar</button>-->
                <?php 
                echo $this->Form->submit(__('Enviar'), array('div' => false, 'class' => 'btn btn-success')); 
                echo $this->Form->end(); 
                ?>
              </div>
            </div>
          </div>
        </div>
