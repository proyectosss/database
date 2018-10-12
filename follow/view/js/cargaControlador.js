function cargaControlador(nombreDelControlador)
{
    $.get( "index.php?c="+nombreDelControlador , {} )
    .done(function( data ) {
    var men = document.getElementById('divDelControlador');
    men.innerHTML = data;
  });
}
