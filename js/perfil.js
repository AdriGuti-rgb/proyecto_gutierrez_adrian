if (localStorage.getItem("rol") == "Anonimous") /* location.href = "./paginaPpal.html"; */ console.log(hola);

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

function mostrarContrasena (e) {
    let contrasenaInput = document.getElementById("contrasena");

    if (contrasenaInput.type === "password") {
        contrasenaInput.type = "text";
        e.target.classList.remove("fa-eye");
        e.target.classList.add("fa-eye-slash");
    } else {
        contrasenaInput.type = "password";
        e.target.classList.add("fa-eye");
        e.target.classList.remove("fa-eye-slash");
    }
        
}

/* Listeners */

document.getElementById("vista").addEventListener("click", mostrarContrasena);
document.getElementById("localidad").addEventListener("click", anadirLocalidades);