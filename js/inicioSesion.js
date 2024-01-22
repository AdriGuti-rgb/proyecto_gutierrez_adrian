let form;
let send; 

/* Modal inicio de sesión */
document.getElementById("abrirModal").addEventListener("click", openModal);

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
                    <input type="password" name="contrasena" id="contrasena" placeholder="Introduzca una contraseña"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    <i class="fa-solid fa-eye" id="vista"></i>
                </div>
    
                <span>Entrar como <a href="./paginaPpal.html" id="anonimo">invitado</a></span>
    
                <input type="submit" id="botonInicio" value="Iniciar Sesión" name="send"/>
            </form>
        </div>
    
        <div id="oAuth">
            <img src="./img/iconoGoogle.jpg" width="23" height="23">
            <span>Continúa con Google</span>
        </div>
        
        <div id="divisoriaInferior"></div>            
        
        <div id="noCuenta"><span>¿Aún no tienes cuenta? <a href="./registro.html">Resgistrate</a></span></div>
    `;
    photos.parentNode.append(inicioSesion);
    form = document.forms.login;
    send = form.elements.send;
    send.addEventListener("click", getParams);
    document.getElementById("vista").addEventListener("click", mostrarContrasena);
    document.getElementById("anonimo").addEventListener("click", () => {
        localStorage.setItem("rol", "Anonimous");
    });

    if (document.getElementById("cerrar") != null) document.getElementById("cerrar").addEventListener("click", () => {
            inicioSesion.remove()
            document.getElementById("error").remove();
        });
}

/*  Botones pasar foto */  
let anterior = document.querySelector("#anterior");
let posterior = document.querySelector("#posterior");
let img = document.getElementById("fotosLandingRandom");
let nivel = (Math.random() * 15).toFixed();
if (nivel == 0) nivel = 1;
img.src = `./img/fotosLandingRandom/${nivel}Foto.jpg`;
anterior.addEventListener("click", () => { if (nivel > 1) img.src = `./img/fotosLandingRandom/${--nivel}Foto.jpg` });
posterior.addEventListener("click", () => { if (nivel < 15) img.src = `./img/fotosLandingRandom/${++nivel}Foto.jpg` });


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

localStorage.clear();

function getParams(e) {
    e.preventDefault();

    // let username = form.elements.nombre;
    // let pass = form.elements.contrasena;
    
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
                console.log(data);
                
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
}

function putErrors (error) {
    if (document.getElementById("error") != null) document.getElementById("error").remove();
    let div = document.createElement("div");
    div.id = "error";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${error}`;
    main[0].append(div);
}