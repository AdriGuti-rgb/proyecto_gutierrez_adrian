let selectLocalidadNormal = document.getElementById("localidadNormal");
let selectLocalidadOrganizador = "";
let form;
let send; 
let canSubmitEmail = false
let canSubmitPass = false
let canSubmitUserExists = false
let canSubmitUser = false
let canSubmitUserName = false

form = document.forms.login;
send = form.elements.send;
form.elements.nombreMostrado.addEventListener("blur", checkUsernameExists)
form.elements.nombreMostrado.addEventListener("blur", checkUserName)
form.elements.contrasena.addEventListener("blur", checkPass)
form.elements.correo.addEventListener("blur", checkMail)
form.elements.nombre.addEventListener("blur", checkUser)

if (document.getElementById("checkNormal") != null) document.getElementById("checkNormal").addEventListener("click", handleMarc);
if (document.getElementById("checkOrganizador") != null) document.getElementById("checkOrganizador").addEventListener("click", handleMarc);

function handleMarc (e) {
    let contenedor = document.createElement("div");
    let main = document.getElementsByTagName("main")
    contenedor.id = "contenedorRegistro";
    contenedor.innerHTML = "";
    if (document.getElementById("error")) document.getElementById("error").remove()

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
                                    <label for="nombre">Nombre completo:</label>
                                    <input type="text" name="nombre" id="nombre" placeholder="Juan Hernandez Segundo">
                                </li>
                                <li>
                                    <label for="nombreMostrado">Nombre que se mostrará:</label>
                                    <input type="text" name="nombreMostrado" id="nombreMostrado" placeholder="nombreMostrado">
                                </li>
                                <li>
                                <label for="correo">Correo electrónico:</label>
                                <input type="text" name="correo" id="correo" placeholder="mail@mail.com">
                            </li>
                            <li>
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" name="contrasena" id="contrasena" placeholder="********">
                                <i class="fa-solid fa-eye" id="vista"></i>
                            </li>
                                <li>
                                    <label for="fotoPerfil">Imagen de perfil:</label>
                                    <input type="file" name="fotoPerfil" id="fotoPerfil">
                                </li>
                                <li>
                                    <label for="localidad">Localidad:</label>
                                    <select name="localidad" id="localidadOrganizador">
                                        <option value="">Seleccione una localidad</option>
                                    </select>
                                </li>
                                <li>
                                    <label for="telefono">Numero de teléfono:</label>
                                    <input type="tel" name="telefono" id="telefono" placeholer="987653127">
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
            form.elements.nombreMostrado.addEventListener("blur", checkUsernameExists)
            form.elements.nombreMostrado.addEventListener("blur", checkUserName)
            form.elements.contrasena.addEventListener("blur", checkPass)
            form.elements.correo.addEventListener("blur", checkMail)
            form.elements.nombre.addEventListener("blur", checkUser)
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
                                <input type="text" name="nombre" id="nombre" placeholder="Juan Hernandez Segundo">
                            </li>
                            <li>
                                <label for="nombreMostrado">Nombre que se mostrará:</label>
                                <input type="text" name="nombreMostrado" id="nombreMostrado" placeholder="nombreMostrado">
                            </li>
                            <li>
                                <label for="correo">Correo electrónico:</label>
                                <input type="text" name="correo" id="correo" placeholder="mail@mail.com">
                            </li>
                            <li>
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" name="contrasena" id="contrasena" placeholder="********">
                                <i class="fa-solid fa-eye" id="vista"></i>
                            </li>
                            <li>
                                <label for="fotoPerfil">Imagen de perfil:</label>
                                <input type="file" name="fotoPerfil" id="fotoPerfil">
                            </li>
                            <li>
                                <label for="localidad">Localidad:</label>
                                <select name="localidad" id="localidadNormal">
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
            form.elements.nombreMostrado.addEventListener("blur", checkUsernameExists)
            form.elements.nombreMostrado.addEventListener("blur", checkUserName)
            form.elements.contrasena.addEventListener("blur", checkPass)
            form.elements.correo.addEventListener("blur", checkMail)
            form.elements.nombre.addEventListener("blur", checkUser)
            send.addEventListener("click", getParams);
            document.getElementById("vista").addEventListener("click", mostrarContrasena);
    }

    document.getElementById("checkNormal").addEventListener("click", handleMarc);
    document.getElementById("checkOrganizador").addEventListener("click", handleMarc);
    selectLocalidadOrganizador = document.getElementById("localidadOrganizador");
    if (document.getElementById("localidadOrganizador") != null) document.getElementById("localidadOrganizador").addEventListener("click", anadirLocalidades);
    if (document.getElementById("localidadNormal") != null) document.getElementById("localidadNormal").addEventListener("click", anadirLocalidades);
}

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

function checkUsernameExists (e) {
    fetch("http://localhost/php/proyecto/api/users/login/")
        .then( response => {
            if (response.status === 200) return response.json()
                else if (response.status === 404) alert(response.statusText)
                else console.log("Todo mal");
        }).then( data => {
            console.log(data);
            if (data.length == 0) canSubmitUserExists = true
            if (e.target.value.trim() != "") {
                try {
                    data.forEach( ({username}) => {
                        if (e.target.value == username) {
                            e.target.style.borderColor = "red"
                            e.target.style.backgroundColor = "rgb(255, 204, 204)"
                            throw new Error("Usuario ya registrado. Seleccione otro") 
                        } else {
                            e.target.style.borderColor = "white"
                            e.target.style.backgroundColor = "lightgreen"
                            e.target.style.borderColor = "green"
                            canSubmitUserExists = true
                        }
                    });
                } catch (error) {
                    putErrors(error)
                }
            }
        })
}

function checkPass (e) {
    let contrasena = e.target.value;
    let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;

    if (!contrasena.match(regex)) {
        putErrors("La contraseña no cumple con los requisitos")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.borderColor = "white"
        e.target.style.backgroundColor = "lightgreen"
        e.target.style.borderColor = "green"
        canSubmitPass = true
    }
}

function checkMail (e) {
    let mail = e.target.value;
    let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    if (!mail.match(regex)) {
        putErrors("El correo no cumple con los requisitos")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.borderColor = "white"
        e.target.style.backgroundColor = "lightgreen"
        e.target.style.borderColor = "green"
        canSubmitEmail = true
    }
}

function checkUser (e) {
    let user = e.target.value;
    let regex = /^[A-Z][a-z]+(?:\s[A-Z][a-z]+){0,2}$/;

    if (!user.match(regex)) {
        putErrors("No se ajusta al formato (Aaaa Aaaa Aaaa)")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"

    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.borderColor = "white"
        e.target.style.backgroundColor = "lightgreen"
        e.target.style.borderColor = "green"
        canSubmitUser = true
    }
}

function checkUserName (e) {
    let user = e.target.value;
    let regex = /^[A-Za-z]+(?:\s[A-Za-z]+){0,2}$/;

    if (!user.match(regex)) {
        putErrors("Solo puede contener letras")
        e.target.style.borderColor = "red"
        e.target.style.backgroundColor = "rgb(255, 204, 204)"
    } else {
        if (document.getElementById("error")) document.getElementById("error").remove()
        e.target.style.backgroundColor = "lightgreen"
        e.target.style.borderColor = "green"
        canSubmitUserName = true
    }
}

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

function getParams(e) {
    e.preventDefault();

    if (checkSubmit()) {
        let name = form.elements.nombre.value;
        let username = form.elements.nombreMostrado.value;
        let pass = form.elements.contrasena.value;
        let mail = form.elements.correo.value;
        let city = form.elements.localidad.value;
        let file = form.elements.fotoPerfil.files[0];
        let formData = new FormData();   
        
        formData.append('name', `${name}`);

        formData.append('username', `${username}`);
        formData.append('mail', `${mail}`);
        formData.append('pass', `${pass}`);
        formData.append('city', `${city}`);
        formData.append('file', file); 
        
        if (form.elements.telefono != null 
            && form.elements.entidad != null) {
                formData.append('phone', `${form.elements.telefono.value}`);
                formData.append('club', `${form.elements.entidad.value}`);
            }
    
        fetch("http://localhost/php/proyecto/api/users/register/", {
            method: "POST",
            mode: "cors",
            body: formData
        }).then( response => {
            if (response.status === 201) location.href ="http://localhost/php/proyecto/index.html";
            else putErrors("Error en los datos")
        }).then(data => {
            if (data.message == "Usuario creado") location.href ="http://localhost/php/proyecto/index.html"; 
                    else putErrors(data.message)
        }).catch(error => console.error(error));
    } else putErrors("Rellene los datos correctamente")

}

function putErrors (error) {
    if (document.getElementById("error") != null) document.getElementById("error").remove();
    let div = document.createElement("div");
    div.id = "error";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${error}`;
    div.style.boxShadow = "0px 0px 20px black"
    main[0].append(div);
}

function checkSubmit () {
    return canSubmit = canSubmitEmail && canSubmitPass && canSubmitUserExists && canSubmitUserName && canSubmitUser;
}

document.getElementById("vista").addEventListener("click", mostrarContrasena);
selectLocalidadNormal.addEventListener("click", anadirLocalidades)
send.addEventListener("click", getParams);
