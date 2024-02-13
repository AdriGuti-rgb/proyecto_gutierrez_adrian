if (localStorage.getItem("rol") == "Anonimous") document.getElementById("links").style.visibility = "hidden"
if (localStorage.getItem("rol") == "User") {
    document.getElementById("crearCarrera").style.visibility = "hidden";
    document.getElementById("nombreLocal").textContent = localStorage.getItem("name");
}

if (localStorage.getItem("rol") == "Organizer") document.getElementById("nombreLocal").textContent = localStorage.getItem("name")

function toggleMenu() {
    if (document.getElementById("opcionesPerfil") != null) {
        document.getElementById("opcionesPerfil").remove(); 
    } else {
        let div = document.createElement("div");
        div.id = "opcionesPerfil";
        div.classList.add("mostrar")
        div.innerHTML = `
        <div id="accesoPerfil">
            <span><a href="./perfil.html">Perfil</a></span>
        </div>
        <div id="cerrarSesion">
            <span><a href="./index.html">Cerrar sesión</a></span>
        </div>
        `;
        
        document.getElementById("links").append(div)
        document.getElementById("cerrarSesion").addEventListener("click", () => localStorage.clear());
    }
}

/* Mando el token cuando queden poco tiempo para crear uno nuevo */
let time = 3300;
setTimeout(renovateToken, time);

function renovateToken() {
    let tokenTotal = localStorage.getItem("token").split(".");
    let payload = tokenTotal[1];
    let datosToken = atob(payload);

    let tokenJSON = JSON.parse(datosToken);

    let exp = tokenJSON.exp;

    let restante = exp -(Math.trunc(Date.now() / 1000));

    if (restante <= 1305) {
        fetch("http://localhost/php/proyecto/api/users/token/", {
        headers: {
            Authorization: `${localStorage.getItem("token")}`
        }
        }).then( response => {
            if (response.status === 200) return response.json()
                else if (response.status === 404) alert(response.statusText)
                else if (response.status === 401) expirationToken()
                else console.log("Todo mal");
        }).then( data => {
            localStorage.setItem("token", data.token)
        })
    }
    setTimeout(renovateToken, time);
};

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

/* Poner fotos perfil */
fetch("http://localhost/php/proyecto/api/users/main_photo/", {
    headers: {
        Authorization: `${localStorage.getItem("token")}`
    }
    }).then( response => {
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else if (response.status === 401) expirationToken()
            else console.log("Todo mal");
    }).then( data => {
        document.getElementById("imgPerfilSuperior").src = `./img/userPhotos/${data.photo}`
        if (document.getElementById("fotoPerfilGrande")) document.getElementById("fotoPerfilGrande").src = `./img/userPhotos/${data.photo}`
    })

document.getElementById('perfil').addEventListener('click', toggleMenu);
