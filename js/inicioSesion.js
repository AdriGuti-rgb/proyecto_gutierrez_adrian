let form;
let send; 
let canSubmitPass = false
let canSendMail = false
let mail;
let formMail = document.forms.introducirCorreo;
localStorage.clear();



/*  Botones pasar foto */  
let anterior = document.querySelector("#anterior");
let posterior = document.querySelector("#posterior");
let img = document.getElementById("fotosLandingRandom");
let nivel = (Math.random() * 15).toFixed();
if (nivel == 0) nivel = 1;
img.src = `./img/fotosLandingRandom/${nivel}Foto.jpg`;
anterior.addEventListener("click", () => { if (nivel > 1) img.src = `./img/fotosLandingRandom/${--nivel}Foto.jpg` });
posterior.addEventListener("click", () => { if (nivel < 15) img.src = `./img/fotosLandingRandom/${++nivel}Foto.jpg` });

/* Modal inicio de sesión */
function openModal (e) {
    let photos = document.getElementById("photos");
    
    if (document.getElementById("inicioSesion") != null) document.getElementById("inicioSesion").remove();

    let inicioSesion = document.createElement("div");
    inicioSesion.id = "inicioSesion";
    inicioSesion.innerHTML = `
        <div id="cerrar">
            <i class="fa-solid fa-xmark"></i>
        </div>
    
        <div id="formulario"> 
            <form action="" method="post" name="login">
                <h2>Inicio sesión</h2>
                <div id="divisoriaSuperior"></div>
                <div class="campos">
                    <label for="usuario">Nombre de usuario:</label>
                    <input type="text" name="nombre" id="nombre" placeholder="Introduzca el usuario">
                </div>
    
                <div class="campos">
                    <label for="contrasena">Contraseña:</label>
                    <input type="password" name="contrasena" id="contrasena" placeholder="Introduzca una contraseña" required>
                    <i class="fa-solid fa-eye" id="vista"></i>
                </div>
    
                <span>Entrar como <a href="./paginaPpal.html" id="anonimo">invitado</a></span>
    
                <input type="submit" id="botonInicio" value="Iniciar Sesión" name="send"/>
            </form>
        </div>
    
        <div id="reset">
            <span>Se me olvidó la contraseña</span>
        </div>
        
        <div id="divisoriaInferior"></div>            
        
        <div id="noCuenta"><span>¿Aún no tienes cuenta? <a href="./registro.html">Resgistrate</a></span></div>
    `;
    photos.parentNode.append(inicioSesion);
    form = document.forms.login;
    send = form.elements.send;
    send.addEventListener("click", getParams);
    form.elements.contrasena.addEventListener("blur", checkPass);
    document.getElementById("vista").addEventListener("click", mostrarContrasena);
    document.getElementById("anonimo").addEventListener("click", () => localStorage.setItem("rol", "Anonimous"));
    document.getElementById("reset").addEventListener("click", handleModalEmail)

    if (document.getElementById("cerrar") != null) document.getElementById("cerrar").addEventListener("click", () => {
            inicioSesion.remove()
            document.getElementById("error").remove();
        });
}

/* Pasar foto aleatorio */
let interval = setInterval(updateTime, 10000);
let totalMils = 0;
function updateTime () {
    totalMils += 5000;
    
    nivel = (Math.random() * 15).toFixed(); 
    if (nivel == 0) nivel = 1;

    img.src = `./img/fotosLandingRandom/${nivel}Foto.jpg`;
}

/* Vista de la contraseña */
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

function checkPass (e) {
    let contrasena = e.target.value;
    let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

    if (!contrasena.match(regex)) {
        putErrors("La contraseña no cumple con los requisitos")
        e.target.style.borderColor = "red"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.borderColor = "white"
        canSubmitPass = true
    }
}

function getParams(e) {
    e.preventDefault();
    
    if (canSubmitPass) {
        let username = document.getElementById("nombre").value;
        let pass = document.getElementById("contrasena").value;
        let user = {
            "username": username,
            "pass": pass
        };
    
        if (username == "" || pass == "") putErrors("Rellene todos los campos")
            else {
                fetch("http://localhost/php/proyecto/api/users/login/", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json;charset=utf-8"
                    },
                    mode: "cors",
                    body: JSON.stringify(user)
                }).then( response => {
                    if (response.status === 200) return response.json()
                        else if (response.status === 404) alert(response.statusText)
                        else throw new Error("Hubo un problema con la solicitud")
                }).then(data => {                
                    let arrayDevuelto = Object.keys(data);
            
                    if (arrayDevuelto.length == 1) putErrors(data.error)
                        else {
                            localStorage.setItem('token', data.token);
                            localStorage.setItem('username', data.username);
                            localStorage.setItem('name', data.name);
                            localStorage.setItem("rol", data.rol);
                            location.href ="http://localhost/php/proyecto/paginaPpal.html";
                    }
                }).catch(error => console.error(error));
            }
    } else putErrors("Rellene los datos correctamente")

}

function handleModalEmail(e) {
    if (document.getElementById("error2")) document.getElementById("error2").remove()
    if (document.getElementById("error")) document.getElementById("error").remove()
    if (document.getElementById("change")) document.getElementById("change").remove()
    document.getElementById("tapar").classList.toggle("hidden")
    document.getElementById("introducirCorreo").classList.toggle("hidden")
    formMail.elements.actual.value = ""
    formMail.elements.actual.style.borderColor = "white"
    formMail.elements.actual.style.backgroundColor = "white"
    formMail.elements.repetido.value = ""
    formMail.elements.repetido.style.borderColor = "white"
    formMail.elements.repetido.style.backgroundColor = "white"
    formMail.elements.repetido.disabled = true
}

function sendMail (e) {
    if (canSendMail) {
        let formData = new FormData()
        formData.append("mail", mail)
        
        fetch("http://localhost/php/proyecto/api/users/sendMail/", {
            method: "POST",
            mode: "cors",
            body: formData
        })
        .then( response => {
            if (response.status === 200) {
                confirmChange("Correo enviado, compruebe sus correos")
                e.target.style.backgroundColor = "lightgreen"
                e.target.style.borderColor = "green"
            } else if (response.status === 401) {
                putErrors2("Correo no encontrado")
                e.target.style.borderColor = "red"
                e.target.style.backgroundColor = "rgb(255, 204, 204)"
            } else console.log("Todo mal");
        })
        .then( data => {
            if (data) {
                
            }
        })
    } else putErrors2("Rellene los campos correctamente")
}

function checkMail (e) {
    mail = e.target.value;
    let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!mail.match(regex)) {
        putErrors2("El correo no cumple con los requisitos")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"
    } else {
        if (document.getElementById("error2")) document.getElementById("error2").remove()

        let formData = new FormData()
        formData.append("mail", `${mail}`)

        fetch("http://localhost/php/proyecto/api/users/checkEmail/", {
            method: "POST",
            mode: "cors",
            body: formData
        })
        .then( response => {
            if (response.status === 200) {
                formMail.elements.repetido.disabled = false
                e.target.style.backgroundColor = "lightgreen"
                e.target.style.borderColor = "green"
            } else if (response.status === 401) {
                putErrors2("Correo no encontrado")
                e.target.style.borderColor = "red"
                e.target.style.backgroundColor = "rgb(255, 204, 204)"
            } else console.log("Todo mal");
        })
        .then( data => {
            if (data) {
                
            }
        })

    }
}

function checkMailTwice (e) {
    let mailTwice = e.target.value;

    if (mail != mailTwice) {
        putErrors2("Los correos no coinciden")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"
        canSendMail = false
    } else {
        if (document.getElementById("error2")) document.getElementById("error2").remove()
        e.target.style.backgroundColor = "lightgreen"
        e.target.style.borderColor = "green"
        canSendMail = true
    }
}

function putErrors (error) {
    if (document.getElementById("error") != null) document.getElementById("error").remove();
    let div = document.createElement("div");
    div.id = "error";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${error}`;
    main[0].append(div);
}

function putErrors2 (error) {
    if (document.getElementById("error2") != null) document.getElementById("error").remove();
    let div = document.createElement("div");
    div.id = "error2";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${error}`;
    main[0].append(div);
}

function confirmChange (change) {
    if (document.getElementById("change") != null) document.getElementById("change").remove();
    let div = document.createElement("div");
    div.id = "change";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${change}`;
    main[0].append(div);
}

document.getElementById("abrirModal").addEventListener("click", openModal);
formMail.elements.actual.addEventListener("blur", checkMail)
formMail.elements.repetido.addEventListener("blur", checkMailTwice)
formMail.elements.change.addEventListener("click", sendMail)
formMail.elements.cancel.addEventListener("click", handleModalEmail)