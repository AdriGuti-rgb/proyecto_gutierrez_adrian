if (localStorage.getItem("rol") == "Anonimous") location.href = "./paginaPpal.html";

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

fetch("http://localhost/php/proyecto/api/users/profile/", {
        headers: {
            Authorization: `${localStorage.getItem("token")}`
        }
    })
    .then( response => {
        console.log(response);
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else console.log("Todo mal");
    })
    .then( data => {
        
        console.log(data);

        if (!exists) {
            alert("No se ha encontrado ningun usuario, revise los datos");
        }
    })