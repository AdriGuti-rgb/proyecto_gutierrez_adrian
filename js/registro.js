let selectLocalidadNormal = document.getElementById("localidadNormal");
let selectLocalidadOrganizador = "";

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
                    
                        <form action="./registro.html" method="get">
                            <ul>
                                <div id="camposOrganizador">
                                <li>
                                    <label for="nombre">Nombre de usuario:</label>
                                    <input type="text" name="nombre" id="nombre">
                                </li>
                                <li>
                                    <label for="nombreMostrado">Nombre que se mostrará:</label>
                                    <input type="text" name="nombreMostrado" id="nombreMostrado">
                                </li>
                                <li>
                                    <label for="correo">Correo electrónico:</label>
                                    <input type="text" name="correo" id="correo">
                                </li>
                                <li>
                                    <label for="contrasena">Contraseña:</label>
                                    <input type="password" name="contrasena" id="contrasena">
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
                                    <input type="tel" name="telefono" id="telefono">
                                </li>
                                <li>
                                    <label for="entidad">Entidad organizador:</label>
                                    <input type="text" name="entidad" id="entidad">
                                </li>
                            </div>
                            </ul>
                            <input type="submit" value="Enviar">
                        </form>
                </div>
            `;
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
                
                    <form action="./registro.html" method="get">
                        <ul>
                            <div id="camposNormal">
                            <li>
                                <label for="nombre">Nombre de usuario:</label>
                                <input type="text" name="nombre" id="nombre">
                            </li>
                            <li>
                                <label for="nombreMostrado">Nombre que se mostrará:</label>
                                <input type="text" name="nombreMostrado" id="nombreMostrado">
                            </li>
                            <li>
                                <label for="correo">Correo electrónico:</label>
                                <input type="text" name="correo" id="correo">
                            </li>
                            <li>
                                <label for="contrasena">Contraseña:</label>
                                <input type="password" name="contrasena" id="contrasena">
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
                        <input type="submit" value="Enviar">
                    </form>
                
            </div>
        
            `;
    }
    
    main[0].append(contenedor);

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