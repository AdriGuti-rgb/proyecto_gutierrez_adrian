if (localStorage.getItem("rol") == "Anonimous") location.href = "./paginaPpal.html";
if (localStorage.getItem("rol") == "User") {
    document.getElementById("telefonoEntidad").remove();
    document.getElementById("entidadTelefono").remove();
}

let form = document.forms.login;
let formConfirm = document.forms.cambioContrasena
let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
let canSubmitPass = false

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
    let contrasenaInput = document.getElementById("actual");

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
            else if (response.status === 401) expirationToken()
            else console.log("Todo mal");
    })
    .then( data => {
        if (data) {
            pass = data.pass;
            let passLength = pass.length;
            let passPlaceholder = "*";

            for (let k = 0; k < passLength - 1; k++) {
                passPlaceholder += "*";
            }

            form.elements.nombreUsuario.value = data.name;
            form.elements.nombreMostrado.value = data.username;
            form.elements.correo.value = data.mail;
            form.elements.localidad[0].textContent = data.city;
            form.elements.localidad[0].value = data.city;
            // form.elements.contrasena.value = data.pass;

            if (data.phone != undefined && data.club != undefined) {
                form.elements.telefono.value = data.phone;
                form.elements.entidad.value = data.club;
            } 
        }
    })


/* Recojo los datos para mandarlos a la api y hacer el update con put */

function getParams (e) {
    e.preventDefault();

    let name = form.elements.nombreUsuario.value;
    let username = form.elements.nombreMostrado.value;
    let pass = form.elements.contrasena.value;
    let mail = form.elements.correo.value;
    let city = form.elements.localidad.value;
    let file = form.elements.fotoPerfil.files[0];
    let formData = new FormData();   
    
    formData.append('name', name);
    formData.append('username', username);
    formData.append('mail', mail);
    formData.append('pass', pass);
    formData.append('city', city);
    
    if (file) formData.append('file', file); 
    
    if (form.elements.telefono && form.elements.entidad) {
            formData.append('phone', form.elements.telefono.value);
            formData.append('club', form.elements.entidad.value);
    }

    fetch("http://localhost/php/proyecto/api/users/update/", {
        method: "POST",
        headers: {
            "Authorization": `${localStorage.getItem("token")}`
        },
        mode: "cors",
        body: formData
    }).then( response => {
        if (response.status === 200) {
            localStorage.setItem('username', formData.get("username"));
            localStorage.setItem('name', formData.get("name"));
            location.reload()
        } else if (response.status === 401) expirationToken()
          else if (response.status === 404) alert(response.statusText)
          else console.log("Todo mal");
    })
    .then( data => {
        if (data) console.log(data);
    });
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
        document.getElementById("tapar").classList.remove("hidden")
        secondForm.elements.deleteSend.addEventListener("click", deleteUser);
    }
}

function deleteUser (e) {
    e.preventDefault();
    
    if (secondForm.elements.opciones.value == "true") {
        
        fetch("http://localhost/php/proyecto/api/users/delete/", {
            method: "DELETE",
            headers: {
                Authorization: `${localStorage.getItem("token")}`
            },
        }).then( response => {
            if (response.status === 200) return response.json()
                else if (response.status === 401) expirationToken()
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
        document.getElementById("tapar").classList.add("hidden")
    }
}

function expirationToken () {
    if (document.getElementById("confirmacion") != null) document.getElementById("confirmacion").remove()
                
    let div = document.createElement("div");
    div.id = "confirmacion";
    div.innerHTML = `
        <span style="text-align:center">La sesion ha expirado, vuelva a iniciar sesión</span>
    `;
    
    let main = document.getElementsByTagName("main")
    main[0].append(div);

    setTimeout(() => {
        localStorage.clear();
        location.href = "./index.html";
    }, 5000);
}

function checkPass (e) {
    let contrasena = e.target.value;

    if (!contrasena.match(regex)) {
        putErrors("La contraseña no cumple los requisitos")
        e.target.style.borderColor = "red"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.borderColor = "white"

        let formData = new FormData()
        formData.append("pass", e.target.value)

        fetch("http://localhost/php/proyecto/api/users/checkPass/", {
            method: "POST",
            headers: {
                Authorization: `${localStorage.getItem("token")}`
            },
            body: formData
            })
            .then( response => {
                if (response.status === 200) {
                    formConfirm.elements.nueva.disabled = false
                    formConfirm.elements.repetida.disabled = false
                    document.getElementById("repetida").addEventListener("blur", e => {
                        if (e.target.value != formConfirm.elements.nueva.value) {
                            putErrors("Las contraseñas no coinciden")
                            e.target.style.borderColor = "red"
                        } else {
                            if (document.getElementById("error")) document.getElementById("error").remove()
                            e.target.style.borderColor = "white"
                        }
                    });
                }
                    else if (response.status === 401) putErrors(`Contraseña incorrecta`)
                    else console.log("Todo mal");
            })
            .then( data => {
            })
        
    }
}

function checkNewPass (e) {
    let contrasena = e.target.value;

    if (!contrasena.match(regex)) {
        putErrors("La contraseña no cumple los requisitos")
        e.target.style.borderColor = "red"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.borderColor = "white"
        canSubmitPass = true

    }
}

function changePass (e) {
    e.target.disabled = true
    document.getElementById("tapar").classList.remove("hidden");
    document.getElementById("cambioContraseña").classList.remove("hidden")
}

function putErrors (error) {
    if (document.getElementById("error") != null) document.getElementById("error").remove();
    let div = document.createElement("div");
    div.id = "error";
    let cambioContraseña = document.getElementById("cambioContraseña");
    div.innerHTML = `${error}`;
    cambioContraseña.append(div);
}

function controlDivPass () {
    document.getElementById("tapar").classList.add("hidden");
    document.getElementById("cambioContraseña").classList.add("hidden")
    formConfirm.elements.actual.value = ""
    formConfirm.elements.repetida.value = ""
    formConfirm.elements.nueva.value = ""
    if (document.getElementById("error")) document.getElementById("error").remove()
    formConfirm.elements.actual.style.borderColor = "white"
    formConfirm.elements.nueva.style.borderColor = "white"
    formConfirm.elements.repetida.style.borderColor = "white"
    form.elements.contrasena.disabled = false
    formConfirm.elements.repetida.disabled = true
    formConfirm.elements.nueva.disabled = true
}

function sendData () {
    if (canSubmitPass) {
        let formData = new FormData()
        formData.append("pass", formConfirm.elements.repetida.value)

        fetch("http://localhost/php/proyecto/api/users/newPass/", {
            method: "POST",
            headers: {
                Authorization: `${localStorage.getItem("token")}`
            },
            body: formData
            })
            .then( response => {
                if (response.status === 200) window.location.reload()
                    else if (response.status === 401) putErrors(`Error al modificar`)
                    else console.log("Todo mal");
            })
            .then( data => {
            })
    } else putErrors("Introduzca una contraseña válida")
}


/* Listeners */

form.elements.contrasena.addEventListener("click", changePass)
form.elements.send.addEventListener("click", getParams);
formConfirm.cancel.addEventListener("click", controlDivPass)
formConfirm.nueva.addEventListener("blur", checkNewPass)
formConfirm.change.addEventListener("click", sendData)
document.getElementById("localidad").addEventListener("click", anadirLocalidades);
document.getElementById("vista").addEventListener("click", mostrarContrasena);
document.getElementById("actual").addEventListener("blur", checkPass);
baja.addEventListener('click', verifyDelete);