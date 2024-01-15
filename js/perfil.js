document.getElementById("localidad").addEventListener("click", anadirLocalidades);

function anadirLocalidades (e) {
let localidades = [];

if (localidades.length == 0) data.forEach( item => item.provinces.forEach( itemProvinces => localidades.push(itemProvinces.label)));

localidades
    .sort( (a, b) => a > b)
    .forEach( (item, index) => {
        let selected = false;

        if (index == 0) selected = true;
        
        let option = new Option(item, item, false, selected);
        e.target.append(option)
    });

e.target.removeEventListener("click", anadirLocalidades)
}

// Obtener el elemento
var opcionesPerfil = document.getElementById('opcionesPerfil');

// Función para mostrar u ocultar el menú
function toggleMenu() {
    opcionesPerfil.classList.toggle('mostrar');
}

var botonMostrarOpciones = document.getElementById('perfil');
botonMostrarOpciones.addEventListener('click', toggleMenu);
