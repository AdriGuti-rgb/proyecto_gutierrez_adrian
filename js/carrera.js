document.getElementById('perfil').addEventListener('click', toggleMenu);

function toggleMenu() {
    if (document.getElementById("opcionesPerfil") != null) {
        document.getElementById("opcionesPerfil").remove(); 
    } else {
        let div = document.createElement("div");
        div.id = "opcionesPerfil";
        div.classList.add("mostrar")
        div.innerHTML = `
            <div id="accesoPerfil">
                <span>Perfil</span>
            </div>
            <div id="cerrarSesion">
                <span>Cerrar sesión</span>
            </div>
            `;
    
        document.getElementById("links").append(div)

    }

}