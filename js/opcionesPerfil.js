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

document.getElementById('perfil').addEventListener('click', toggleMenu);