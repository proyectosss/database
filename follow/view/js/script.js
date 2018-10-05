function initMap() {}

//script de mensaje de validacion de login
function openModalLogin(type_error){
  if(type_error=='email'){
    var men = document.getElementById('messageWrong');
    men.innerHTML = 'Correo no encontrado, por favor verifique el correo o póngase en contacto con nuestro administrador';
  }else if(type_error=='password'){
    var men = document.getElementById('messageWrong');
    men.innerHTML = 'Contraseña incorrecta, por favor verifique la contraseña o póngase en contacto con nuestro administrador';
  }
    $('#mensaje').modal('toggle');
}

//abrir el modal de "eliminar" con su respetivo valores
function Eliminar(id,nom,action){
  var men = document.getElementById('body-modal_eliminar');
  var Value = 'esta seguro que desea eliminar lo datos del cliente indentificado con el numero  '.concat(nom, '');
  men.innerHTML = Value;
  document.getElementById('id').value=id;
  document.forms.delete.action=action;
  $('#delete').modal('toggle');
}

//abrir el modal de "eliminar" con su respetivo valores
function Eliminar_persona(id,nom,action){
  var men = document.getElementById('body-modal_eliminar');
  var Value = 'esta seguro que desea eliminar el usuario llamano  '.concat(nom, '');
  men.innerHTML = Value;
  document.getElementById('id').value=id;
  document.forms.delete.action=action;
  $('#delete').modal('toggle');
}

function Eliminar_producto(id,nom,action){
  var men = document.getElementById('body-modal_eliminar');
  var Value = 'esta seguro que desea eliminar el producto indentificado con el numero '.concat(nom, '');
  men.innerHTML = Value;
  document.getElementById('id').value=id;
  document.forms.delete.action=action;
  $('#delete').modal('toggle');
}

//validar la contraseña del usuario a la hora de ingresar uno nuevo
function validacionUsuario()
{
  if(document.getElementById("Password").value==document.getElementById("Confirmapass").value)
  {
    return true;
  }else {
    var men = document.getElementById('messageWrong');
    men.innerHTML = 'Por favor confirme la contraseña.';
    $('#mensaje').modal('toggle');
    return false;
  }
}

//cambiar la imagen cuando suba
//cambia de imagen en le campo scan
function soporteImagen(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imageSoporte').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#soporte").change(function(){
    soporteImagen(this);
});

//llamamos el datatable
$(document).ready(function() {
  $('#dataTables').DataTable();
});





