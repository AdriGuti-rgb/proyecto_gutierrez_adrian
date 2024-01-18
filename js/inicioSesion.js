/* Modal inicio de sesión */

document.getElementById("abrirModal").addEventListener("click", openModal);

function openModal (e) {
    let photos = document.getElementById("photos");
    
    if (document.getElementById("inicioSesion") != null) inicioSesion.remove();

    let inicioSesion = document.createElement("div");
    inicioSesion.id = "inicioSesion";
    inicioSesion.innerHTML = `
        <div id="cerrar">
            <i class="fa-solid fa-xmark"></i>
        </div>
    
        <div id="formulario"> 
            <form action="./index.html" method="get">
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
    
                <span>Entrar como invitado</span>
    
                <input type="submit" id="botonInicio" value="Iniciar Sesión"/>
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
    document.getElementById("vista").addEventListener("click", mostrarContrasena);

    if (document.getElementById("cerrar") != null) document.getElementById("cerrar").addEventListener("click", () => inicioSesion.remove());

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


// fetch("http://localhost:3000/api/user/all", )
//     .then( response => {
//         console.log(response);
//         if (response.status === 200) return response.json()
//             else if (response.status === 404) console.log(response.text); 
//             else console.log("Todo mal");
//     })
//     .then( data => {
//         console.log(data);
//     })

// let user = {
//     "name": "Adrian Gutierrez Usoz",
//     "username": "adrianAVeces",
//     "mail": "adrian@hotmal.com",
//     "pass": "pasaste",
//     "city": "España",
//     "phone": "982345200",
//     "club": "CM Teide",
//     "rol": "organizer"
// };

// fetch("http://localhost:3000/api/user/register", {
//         method: "POST",
//         headers: {
//             "Content-Type": "application/json;charset=utf-8"
//         },
//         body: JSON.stringify(user)
//     }).then( response => {
//         console.log(response);
//         if (response.status === 200) return response.json()
//             else if (response.status === 404) console.log(response.text); 
//             else console.log("Todo mal");
//     }).then( data => {
//         console.log(data);
//     }).catch ( error => {
//         console.log(error);
//     })

document.getElementById("photos").addEventListener("click", getParams);

function getParams() {

    let user = {
        "username": `${document.getElementById("nombre").value}`,
        "pass": `${document.getElementById("contrasena").value}`
    };

    console.log(user);

    fetch("http://localhost:3000/api/auth/login", {
            method: "POST",
            headers: {
                "Content-Type": "application/json;charset=utf-8"
            },
            body: JSON.stringify(user)
        }).then( response => {
            console.log(response);
            if (response.status === 200) return response.json()
                else if (response.status === 404) console.log(response.text); 
                else console.log("Todo mal");
        }).then( data => {
            console.log(data);
        }).catch ( error => {
            console.log(error);
        })

}
        