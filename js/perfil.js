if (localStorage.getItem("rol") == "Anonimous") location.href = "./paginaPpal.html";
if (localStorage.getItem("rol") == "User") {
    // document.getElementById("entidadTelefono").style.visibility = "hidden"
    // document.getElementById("telefonoEntidad").style.visibility = "hidden"
    document.getElementById("telefonoEntidad").remove();
    document.getElementById("entidadTelefono").remove();
}
let form = document.forms.login;

/* Recojo las localidades para mostrarlas en el select */

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


/* 
    Hago el cambio de tipo del input y del icono para que 
    el usuario pueda ver la contraseña que esta escribiendo
*/
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


/* Recibo los datos para ponerlos en los placeholders */

let pass;

fetch("http://localhost/php/proyecto/api/users/profile/", {
    headers: {
        Authorization: `${localStorage.getItem("token")}`
    }
    })
    .then( response => {
        if (response.status === 200) return response.json()
        else if (response.status === 404) alert(response.statusText)
        else if (response.status === 401) {
            localStorage.clear();
            location.href = "./index.html";
        } else console.log("Todo mal");
    })
    .then( data => {
        pass = data.pass;
        let passLength = pass.length;
        let passPlaceholder = "*";

        for (let k = 0; k < passLength - 1; k++) {
            passPlaceholder += "*";
        }

        form.elements.nombreUsuario.placeholder = data.name;
        form.elements.nombreMostrado.placeholder = data.username;
        form.elements.correo.placeholder = data.mail;
        form.elements.localidad[0].textContent = data.city;
        form.elements.localidad[0].value = data.city;
        form.elements.nombreMostrado.value = "";
        form.elements.contrasena.value = "";
        form.elements.contrasena.placeholder = passPlaceholder;

        if (data.phone != undefined && data.club != undefined) {
            form.elements.telefono.placeholder = data.phone;
            form.elements.entidad.placeholder = data.club;
        } 
    })


/* Recojo los datos para mandarlos a la api y hacer el update con put */

function getParams (e) {
    e.preventDefault();

    let elementos = Array.from(form.elements)
    let limit;
    let user = {};
    if (localStorage.getItem("rol") == "User") limit = elementos.length - 2
        else limit = elementos.length - 2

    elementos.forEach( (item, index) => {
        if (index < limit) {
            if (item.value.trim() == "") {
                if (item.name === "contrasena") user[item.name] = pass
                    else user[item.name] = item.placeholder;
            }
                else user[item.name] = item.value;
        }
    })

    fetch("http://localhost/php/proyecto/api/users/update/", {
        method: "PUT",
        headers: {
            Authorization: `${localStorage.getItem("token")}`
        },
        mode: "cors",
        body: JSON.stringify(user)
    }).then( response => {
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else console.log("Todo mal");
    })
    .then( data => {
        console.log(data);
    })
}


/* 
    Controlo que de verdad quiere darse de baja y si es asi,
    mando el token a la api y hago el delete
*/
let baja = form.elements.baja;
if (baja.checked) baja.checked = false;
let secondForm;

function verifyDelete () {
    if (document.getElementById("confirmacion") != null) document.getElementById("confirmacion").remove()
    
    if (baja.checked) {
        let div = document.createElement("div");
        div.id = "confirmacion";
        div.innerHTML = `
        <span>¿Seguro que quieres darte de baja y eliminar todos los datos relacionados contigo?</span>
        <form action="" method="get" name="deleteUserLogin">
            <input type="radio" name="opciones" id="Si" value="true">
            <label for="Si">Si</label>
            
            <input type="radio" name="opciones" id="No" value="false">
            <label for="No">No</label>
            
            <input type="submit" value="Confirmar" name="deleteSend" id="deleteSend">
        </form>
        `;
        
        let main = document.getElementsByTagName("main")
        main[0].append(div);
        secondForm = document.forms.deleteUserLogin;
        secondForm.elements.deleteSend.addEventListener("click", deleteUser);
    }
}

function deleteUser (e) {
    e.preventDefault();
    
    if (secondForm.elements.opciones.value == "true") {
        
        let user = {"rol": `${localStorage.getItem("rol")}`}
        
        fetch("http://localhost/php/proyecto/api/users/delete/", {
            method: "DELETE",
            headers: {
                Authorization: `${localStorage.getItem("token")}`
            },
            body: JSON.stringify(user)
        }).then( response => {
            if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
                else throw new Error("Hubo un problema con la solicitud")
        }).then(data => {                
            if (data == "Todo bien") {
                localStorage.clear()
                location.href = "./index.html"
            }
        }).catch(error => console.error(error));

    } else {
        document.getElementById("confirmacion").remove()
        if (baja.checked) baja.checked = false;
    }
}


/* Listeners */

form.elements.send.addEventListener("click", getParams);
document.getElementById("localidad").addEventListener("click", anadirLocalidades);
baja.addEventListener('click', verifyDelete);