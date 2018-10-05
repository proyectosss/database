<div class="modal fade" id="mensaje" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="ModalLabel">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" name="button">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="font text-color">Advertencia</h3>
          </div>
          <div class="modal-body">
          <p class="font" id="messageWrong"></p>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-raised background-color font " data-dismiss="modal" data-toggle="modal" data-target="#Modal"
            id="button-modal">Ok</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="cerrar" tabindex="-1" role="dialog" aria-labelledby="cerrar">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="ModalLabel">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" name="button">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title">Advertencia</h3>
        </div>
        <div class="modal-body">
          <p class="font-family" >Esta seguro en cerrar sesión??</p>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-raised btn-danger font" data-dismiss="modal" name="button">cancel</button>
        <button type="button" class="btn btn-raised btn-default background-color font" data-dismiss="modal"  onclick="location='index.php?c=summary&a=cerrar'" id="button-modal">Ok</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="ModalLabel">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" name="button">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title">Advertencia</h3>
        </div>
        <div class="modal-body">
          <p class="font-family" id="body-modal_eliminar"></p>
        </div>
      </div>
      <div class="modal-footer">
        <form action="" method="POST" id="delete" name="delete">
          <input name="id" hidden="" id="id"></input>
          <button type="button" class="btn btn-raised btn-danger font" data-dismiss="modal" name="button" id="button-cancelar">cancel</button>
          <button type="submit" class="btn btn-raised btn-default background-color font" id="button-modal">Ok</button>
        </form>
      </div>
    </div>
  </div>
</div>
