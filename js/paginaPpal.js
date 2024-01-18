// Obtener el elemento
var opcionesPerfil = document.getElementById('opcionesPerfil');

// Función para mostrar u ocultar el menú
function toggleMenu() {
    opcionesPerfil.classList.toggle('mostrar');
}

var botonMostrarOpciones = document.getElementById('perfil');
botonMostrarOpciones.addEventListener('click', toggleMenu);
