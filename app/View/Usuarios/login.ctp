   <div id="buscar" class="container-fluid">
      <div class="container header-ppal">
        <img class="img-rounded img-responsive header-img" align="left" src="img/ASKarallouse_logo.png"
            onmouseover="this.src='img/ASKarallouse_logo.png';"
            onmouseout="this.src='img/ASKarallouse_logo.png';" alt="logo"/>
        <form>
          <div class="row">
            <div class="col-lg-4 pull-right">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Buscar...">
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>

    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-default">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="index.html"><span class="glyphicon glyphicon-home"></span></a></li>
                <li><a href="#">TAGS</a></li>                                
              </ul>
              <ul class="nav navbar-nav navbar-right">
                <li><a data-toggle="modal" data-target="#reg" href="#">Registro</a></li>
                <li class="divider-vertical"></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li id="login-menu">
                      <div class="container login">
                        <!--<form class="form-signin">-->
						<?php echo $this->Flash->render('auth'); ?>
						<?php echo $this->Form->create('Usuario', array('class' => 'form-signin')); ?>

                          <h2 class="form-signin-heading text-white">Identificarse</h2>
                          <label for="inputEmail" class="sr-only">Usuario</label>
                          <!--<input id="inputEmail" class="form-control margin-login" placeholder="Usuario" required="" autofocus="" type="email">-->
						  <?php echo $this->Form->input('Username', array('id' => 'inputEmail', 'class' => 'form-control margin-login', 'placeholder' => 'Username')); ?>
                          <label for="inputPassword" class="sr-only">Contraseña</label>
                          <!--<input id="inputPassword" class="form-control" placeholder="Contraseña" required="" type="password">-->
                          <?php echo $this->Form->input('Contraseña',  array('id' => 'inputPassword', 'class' => 'form-control', 'type' => 'password', 'placeholder' => 'Contraseña')); ?>
                          <div class="checkbox text-white">
                            <label>
                              <input value="remember-me" type="checkbox">Recuerdame</input>
                            </label>
                          </div>
                          <!--<button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>-->
                       	  <?php echo $this->Form->submit('Entrar', array('class' => 'btn btn-lg btn-primary btn-block')); ?>
                        <!--</form>-->
                        <?php echo $this->Form->end(); ?>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>



    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li class="active" data-target="#myCarousel" data-slide-to="0"></li>
        <li class="" data-target="#myCarousel" data-slide-to="1"></li>
        <li class="" data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active item-1">
          <div class="container">
            <div class="carousel-caption">
              <h1>Sobre nosotros</h1>
              <p>ASKarallouse es una comunidad de usuarios de TSW, como tú, para ayudarse mutuamente.</p>
              <a href="#about" class="btn btn-circle page-scroll">
              </a>
            </div>
          </div>
        </div>
        <div class="item item-2">
          <div class="container">
            <div class="carousel-caption">
              <h1>Comunidad ASKarallouse</h1>
              <p>Pregunta y responde cualquier duda.</p>
              <a href="#about" class="btn btn-circle page-scroll">
              </a>
            </div>
          </div>
        </div>
        <div class="item item-3">
          <div class="container">
            <div class="carousel-caption">
              <h1>¿A qué esperas?</h1>
              <p>Únete y comienza a preguntar.</p>
              <a class="btn btn-primary" data-toggle="modal" data-target="#reg">Regístrate</a>
              <a href="#about" class="btn btn-circle page-scroll">
              </a>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
