    <!-- http://getbootstrap.com/javascript/ -->
    <div id="reg" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-md">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 class="txt-center">Registro</h3>
          </div>
          <div class="modal-body">
            <?php echo $this->Form->create('Usuario'); ?>                
            <!--<h4>Usuario</h4>
            <input type="text" name="alias" class="form-control form-pers" placeholder="Usuario" />-->
            <?php echo $this->Form->input('username', array('class' => 'form-control form-pers', 'placeholder' => 'Username', 'label' => 'Alias Usuario')); ?>
            <!--<h4>Correo Electrónico</h4>
            <input type="text" name="email" class="form-control form-pers" placeholder="Correo Electrónico" />-->
            <?php echo $this->Form->input('nombre', array('class' => 'form-control form-pers', 'placeholder' => 'Nombre')); ?>
            <?php echo $this->Form->input('apellidos', array('class' => 'form-control form-pers', 'placeholder' => 'Apellidos')); ?>  
            <?php echo $this->Form->input('email', array('class' => 'form-control form-pers', 'placeholder' => 'Username', 'label' => 'Alias Usuario')); ?>    
            <!--h4>Contraseña</h4>-->            
            <!--<input type="password" name="pass" class="form-control form-pers" placeholder="Contraseña" />-->
            <?php echo $this->Form->input('password', array('class' => 'form-control form-pers', 'placeholder' => 'Contraseña', 'label' => 'Contraseña')); ?>
            <div class="clearfix"></div>
          </div>
          <div class="modal-footer">
            <?php 
              echo $this->Form->submit('Registrarse', array('class' => 'btn btn-success'));
              $this->Form->end();
            ?>
            <a href="#" data-dismiss="modal" class="btn">Cerrar</a>
          </div>
        </div>
      </div>
    </div>  