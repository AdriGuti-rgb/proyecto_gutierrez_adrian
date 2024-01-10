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
                    <input type="password" name="contrasena" id="contrasena" placeholder="Introduzca una contraseña">
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