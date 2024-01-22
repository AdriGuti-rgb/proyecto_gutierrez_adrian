let selectLocalidadNormal = document.getElementById("localidadNormal");
let selectLocalidadOrganizador = "";
let form;
let send; 

form = document.forms.login;
send = form.elements.send;

if (document.getElementById("checkNormal") != null) document.getElementById("checkNormal").addEventListener("click", handleMarc);
if (document.getElementById("checkOrganizador") != null) document.getElementById("checkOrganizador").addEventListener("click", handleMarc);

function handleMarc (e) {
    let contenedor = document.createElement("div");
    let main = document.getElementsByTagName("main")
    contenedor.id = "contenedorRegistro";
    contenedor.innerHTML = "";

    if (!(e.target.classList.contains("marcado")) && e.target.id == "checkOrganizador") {
        document.getElementById("contenedorRegistro").remove();
        contenedor.innerHTML = `
            <div id="tipoUsuarioOrganizador">
                    <h2>Tipo usuario:</h2>
                    <div class="usuarios">
                        <div class="checkBox" id="checkNormal"></div>
                        <span>Normal</span>
                    </div>

                    <div class="usuarios">
                        <div class="checkBox marcado" id="checkOrganizador"></div>
                        <span>Organizador</span>
                    </div>
                </div>
                
                <div id="divisoriaCentralOrganizador"></div>

                <div id="formularioOrganizador">
                    <span>Organizador</span>
                    
                        <form action="" method="post" name="login">
                            <ul>
                                <div id="camposOrganizador">
                                <li>
                                    <label for="nombre">Nombre de usuario:</label>
                                    <input type="text" name="nombre" id="nombre" required>
                                </li>
                                <li>
                                    <label for="nombreMostrado">Nombre que se mostrará:</label>
                                    <input type="text" name="nombreMostrado" id="nombreMostrado" required>
                                </li>
                                <li>
                                <label for="correo">Correo electrónico:</label>
                                <input type="text" name="correo" id="correo" pattern="[a-zA-Z0-9\.]+@[a-zA-Z0-9\.]+\.[a-zA-Z]+" required>
                            </li>
                            <li>
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" name="contrasena" id="contrasena" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                <i class="fa-solid fa-eye" id="vista"></i>
                            </li>
                                <li>
                                    <label for="fotoPerfil">Imagen de perfil:</label>
                                    <input type="file" name="fotoPerfil" id="fotoPerfil" required>
                                </li>
                                <li>
                                    <label for="localidad">Localidad:</label>
                                    <select name="localidad" id="localidadOrganizador" required>
                                        <option value="">Seleccione una localidad</option>
                                    </select>
                                </li>
                                <li>
                                    <label for="telefono">Numero de teléfono:</label>
                                    <input type="tel" name="telefono" id="telefono" required>
                                </li>
                                <li>
                                    <label for="entidad">Entidad organizador:</label>
                                    <input type="text" name="entidad" id="entidad" required>
                                </li>
                            </div>
                            </ul>
                            <input type="submit" value="Enviar" name="send">
                        </form>
                </div>
            `;
            main[0].append(contenedor);
            form = document.forms.login;
            send = form.elements.send;
            send.addEventListener("click", getParams);
            document.getElementById("vista").addEventListener("click", mostrarContrasena);
    }

    if (!(e.target.classList.contains("marcado")) && e.target.id == "checkNormal") {
        document.getElementById("contenedorRegistro").remove();
        contenedor.innerHTML = `
        
            <div id="tipoUsuarioNormal">
                <h2>Tipo usuario:</h2>
                <div class="usuarios" >
                    <div class="checkBox marcado" id="checkNormal"></div>
                    <span>Normal</span>
                </div>

                <div class="usuarios">
                    <div class="checkBox" id="checkOrganizador"></div>
                    <span>Organizador</span>
                </div>
            </div>
            
            <div id="divisoriaCentralNormal"></div>

            <div id="formularioNormal">
                <span>Normal</span>
                
                    <form action="" method="post" name="login">
                        <ul>
                            <div id="camposNormal">
                            <li>
                                <label for="nombre">Nombre de usuario:</label>
                                <input type="text" name="nombre" id="nombre" required>
                            </li>
                            <li>
                                <label for="nombreMostrado">Nombre que se mostrará:</label>
                                <input type="text" name="nombreMostrado" id="nombreMostrado" required>
                            </li>
                            <li>
                                <label for="correo">Correo electrónico:</label>
                                <input type="text" name="correo" id="correo" pattern="[a-zA-Z0-9\.]+@[a-zA-Z0-9\.]+\.[a-zA-Z]+" required>
                            </li>
                            <li>
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" name="contrasena" id="contrasena" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                <i class="fa-solid fa-eye" id="vista"></i>
                            </li>
                            <li>
                                <label for="fotoPerfil">Imagen de perfil:</label>
                                <input type="file" name="fotoPerfil" id="fotoPerfil" required>
                            </li>
                            <li>
                                <label for="localidad">Localidad:</label>
                                <select name="localidad" id="localidadNormal" required>
                                    <option value="">Seleccione una localidad</option>
                                </select>
                            </li>
                        </div>
                        </ul>
                        <input type="submit" value="Enviar" name="send">
                    </form>
                
            </div>
        
            `;
            main[0].append(contenedor);
            form = document.forms.login;
            send = form.elements.send;
            send.addEventListener("click", getParams);
            document.getElementById("vista").addEventListener("click", mostrarContrasena);
    }
    
    

    document.getElementById("checkNormal").addEventListener("click", handleMarc);
    document.getElementById("checkOrganizador").addEventListener("click", handleMarc);
    selectLocalidadOrganizador = document.getElementById("localidadOrganizador");
    if (document.getElementById("localidadOrganizador") != null) document.getElementById("localidadOrganizador").addEventListener("click", anadirLocalidades);
    if (document.getElementById("localidadNormal") != null) document.getElementById("localidadNormal").addEventListener("click", anadirLocalidades);
}

selectLocalidadNormal.addEventListener("click", anadirLocalidades)

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


document.getElementById("vista").addEventListener("click", mostrarContrasena);

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


send.addEventListener("click", getParams);

function getParams(e) {

    e.preventDefault();

    let name = form.elements.nombre.value;
    let username = form.elements.nombreMostrado.value;
    let pass = form.elements.contrasena.value;
    let mail = form.elements.correo.value;    
    let photo = form.elements.fotoPerfil.value;
    let city = form.elements.localidad.value;

    let user = {
        "name": `${name}`,
        "username": `${username}`,
        "mail": `${mail}`,
        "pass": `${pass}`,
        "photo": `${photo}`,
        "city": `${city}`
    };

    if (form.elements.telefono != null 
        && form.elements.entidad != null) {
        
        user = {
            "name": `${name}`,
            "username": `${username}`,
            "mail": `${pass}`,
            "pass": `${mail}`,
            "photo": `${photo}`,
            "city": `${city}`,
            "phone": `${form.elements.telefono.value}`,
            "club": `${form.elements.entidad.value}`
        };
    }

    fetch("http://localhost/php/proyecto/api/users/register/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json;charset=utf-8"
        },
        mode: "cors",
        body: JSON.stringify(user)
    }).then( response => {
        if (response.status === 201) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else throw new Error("Hubo un problema con la solicitud")
    }).then(data => {
console.log(data);
        // let arrayDevuelto = Object.keys(data);

        // if (arrayDevuelto.length == 1) putErrors(data.error)
        //     else {
        //         localStorage.setItem('token', data.token);
        //         localStorage.setItem('username', data.username);
        //         localStorage.setItem('name', data.name);
        //         localStorage.setItem("rol", data.rol);
        //         location.href ="http://localhost/php/proyecto/paginaPpal.html";
        // }
    }).catch(error => console.error(error));
}