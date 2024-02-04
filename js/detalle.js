if (localStorage.getItem("rol") == "User") document.getElementById("tipoOrganizador").style.visibility = "hidden";
if (localStorage.getItem("rol") == "Anonimous") {
    document.getElementById("iconoFav").style.visibility = "hidden";
    document.getElementById("tipoOrganizador").style.visibility = "hidden";
    document.getElementById("contenedorOrganizador").style.visibility = "hidden";
}

let form = document.forms.edit;
let race = {
    "name": localStorage.getItem("raceName")
}
let date = new Date();
let currentYear = date.getFullYear()

let currentPage = 0;
let itemsPerPage = 10;
let totalPages;
let globalClasifications;
let coor;

/* Carreras favoritas del usuario */
if (localStorage.getItem("rol") == "Organizer") {
    fetch("http://localhost/php/proyecto/api/races/checkOrganizator/", {
        method: "POST",
        headers: {
            Authorization: `${localStorage.getItem("token")}`
        },
        body: JSON.stringify(race)
    })
    .then( response => {
        if (response.status !== 200) {
            document.getElementById("contenedorOrganizador").style.visibility = "hidden"
            document.getElementById("tipoOrganizador").style.visibility = "hidden"
        }
    })
    .then( data => {
        if (data) {
        }
    })
}

/* Comprobar si es organizador de esa carrera */


/* Datos de la carrera seleccionada */
fetch("http://localhost/php/proyecto/api/races/oneRace/", {
    method: "POST",
    body: JSON.stringify(race)
})
.then( response => {
    if (response.status === 200) return response.json()
        else if (response.status === 404) alert(response.statusText)
        else console.log("Todo mal");
})
.then( data => {
    if (data) {
        let raceData = data[0];
        let olderClasifications = data[1];
        let raceServices = data[2];
        let category = data[3].type
        let modality = data[4]

        coor = JSON.parse(raceData.coor)

        globalClasifications = olderClasifications

        if (date.toJSON().slice(0,10) > raceData.race_day) form.elements.clasifications.classList.remove("hidden")
        document.getElementById("enlacePagina").textContent = raceData.name

        renderOptions(raceData)
        renderDetails(raceData, modality, category, raceServices)
        renderClasifications(olderClasifications)
    }
})

function renderDetails (raceData, modality, category, services) {
    document.getElementById("nombreRaceInfo").textContent = raceData.name
    document.getElementById("diaRealizacionInfo").textContent = raceData.race_day
    document.getElementById("poblacionInfo").textContent = raceData.poblation
    document.getElementById("distanciaInfo").textContent = `${raceData.distance} km`
    document.getElementById("desnivelInfo").textContent = `${raceData.total_slope} m`
    document.getElementById("desnivelPositivoInfo").textContent = `${raceData.positive_slope} m`
    document.getElementById("desnivelNegativoInfo").textContent = `${raceData.negative_slope} m`
    document.getElementById("categoriaInfo").textContent = category;
    document.getElementById("modalidadInfo").textContent = modality.type

    document.getElementById("main_photo").src = `./img/races/${raceData.name}/${raceData.main_photo}`
    document.getElementById("pdf").href = `./pdf/${raceData.pdf}`
    document.getElementById("enlacePagina").href = `http://${raceData.webRef}`
    document.getElementById("premios").innerHTML = `
        <i class="fa-solid fa-trophy"></i>
        <span class="underlined" id="premiosInfo">Premios:</span>
        <span>${modality.first_prize} €</span>
        <span class="prize">${modality.second_prize} €</span>
        <span class="prize">${modality.third_prize} €</span>
    `;

    renderServices(services);
}

function renderClasifications (olderClasifications) {
    totalPages = Math.ceil((olderClasifications.length / itemsPerPage) - 1);
    let table = document.getElementById('tabla');
    table.innerHTML = `
        <tr>
            <th></th>
            <th>1ª Posición</th>
            <th>2ª Posición</th>
            <th>3ª Posición</th>
            <th>Año realizacion</th>
        </tr>`;
    if (olderClasifications.length == 0) document.getElementById("contenedorClasificaciones").innerHTML = "<h2>Todavia no hay clasificaciones disponibles</h2>"
    if (olderClasifications.length <= 10) {
        if (document.getElementById("anterior")) document.getElementById("anterior").classList.add("hidden")
        if (document.getElementById("siguiente")) document.getElementById("siguiente").classList.add("hidden")
    }
    olderClasifications.filter( (_, index) => Math.trunc(index / itemsPerPage) == currentPage )
        .forEach( item => {
        table.innerHTML += `
            <tr>
                <td>${item.time_race}</td>
                <td>${item.winner}</td>
                <td>${item.second_place}</td>
                <td>${item.third_place}</td>
                <td>${item.year_race}</td>
            </tr>`;
    });
}

function handlePrevClick () {
    if (currentPage > 0) {
        currentPage--;
    }
    renderClasifications(globalClasifications);
}

function handleNextClick () {
    if (currentPage < totalPages) {
        currentPage++;
    }
    renderClasifications(globalClasifications);
}

function renderServices (services) {
    services.forEach( ({type}) => {
        let i = document.createElement("i");
        i.classList.add("fa-solid")
        switch (type) {
            case "Tiempos intermedios":
                i.classList.add("fa-stopwatch-20")
                break;
            case "Zonas ecologicas":
                i.classList.add("fa-leaf")
                break;
            case "Avituallamiento liquido":
                i.classList.add("fa-bottle-water")
                break;
            case "Avituallamiento solido":
                i.classList.add("fa-utensils")
                break;
            case "Parking":
                i.classList.add("fa-square-parking")
                break;
            case "Puestos de socorro":
                i.classList.add("fa-suitcase-medical")
                break;
            default:
                break;
        }
        document.getElementById("serviciosInfo").append(i)
    })
}

function renderOptions (raceData) {
    form.elements.nombreCarrera.value = raceData.name
    form.elements.poblacion.value = raceData.poblation
    form.elements.fechaRealizacion.value = raceData.race_day
    form.elements.distancia.value = raceData.distance
}

function handleFavourite (e) {
    let method;
    if (e.target.classList.contains("fa-regular")) method = "PUT"
        else method = "DELETE"

    fetch("http://localhost/php/proyecto/api/races/putFavourite/", {
        method: method,
        headers: {
            Authorization: `${localStorage.getItem("token")}`
        },
        mode: "cors",
        body: JSON.stringify(race)
    }).then( response => {
        if (response.status === 201 || response.status == 203) {
            e.target.classList.toggle("fa-solid")
            e.target.classList.toggle("fa-regular")
        } else if (response.status === 404) alert(response.statusText)
          else console.log("Todo mal");
    })
    .then( data => {
        if (data) console.log(data);
    });
}

function handleTipeClick (e) {
    document.querySelectorAll("#tiposSelector .marcado")[0].classList.remove("marcado");
    e.target.classList.toggle("marcado");
    document.querySelectorAll("#general .marcado")[0].classList.add("hidden");
    document.querySelectorAll("#general .marcado")[0].classList.remove("marcado");
    let contenedor;
    console.log(e.target.id);
    switch (e.target.id) {
        case "tipoDetalle":
            contenedor = "contenedorDetalles";
            break;
        case "tipoMapa":
            contenedor = "contenedorMapa";
            break;

        case "tipoReglamento":
            contenedor = "contenedorReglamento";
            break;

        case "tipoWeb":
            contenedor = "contenedorWeb";
            break;

        case "tipoClasificaciones":
            contenedor = "contenedorClasificaciones";
            break;

        case "tipoOrganizador":
            contenedor = "contenedorOrganizador";
            break;
    
        default:
            break;
    }

    console.log(contenedor);
    console.log(document.getElementById(contenedor))
    document.getElementById(contenedor).classList.add("marcado");
    document.getElementById(contenedor).classList.remove("hidden");
}

function handleOptionsRace (e) {
    e.preventDefault();
    let method = e.target.id == "delete" ? "DELETE" : "UPDATE";

    if (method === "UPDATE") {
        race.secondName = form.elements.nombreCarrera.value
        race.poblation = form.elements.poblacion.value
        race.race_day = form.elements.fechaRealizacion.value
        race.distance = form.elements.distancia.value
        if (form.elements.fotoPrincipal.files.length > 0) race.main_photo = form.elements.fotoPrincipal.value 
        if (form.elements.fotosAnteriores.files.length > 0) {
            let arrayOldPhotos = [];
            Array.from(form.elements.fotosAnteriores.files)
                .forEach( item => arrayOldPhotos.push(item.name));
            race.older_photos = arrayOldPhotos
        }
    }

    fetch(`http://localhost/php/proyecto/api/races/delete/`, {
        method: method,
        mode: "cors",
        body: JSON.stringify(race)
    }).then( response => {
        if (response.status == 203) location.href = "./paginaPpal.html"
            else if (response.status === 200) location.href = "./paginaPpal.html"
            else if (response.status === 404) alert(response.statusText)
            else console.log("Todo mal");
    })
    .then( data => {
        if (data) console.log(data);
    });
}

function addClasifications () {
    let formClasi = document.forms.clasifications;
    let winner = formClasi.elements.ganador.value;
    let second_place = formClasi.elements.segundoPuesto.value;
    let third_place = formClasi.elements.tercerPuesto.value;
    let year = formClasi.elements.año.value
    let time = formClasi.elements.tiempo.value

    let clasifications = {
        "winner": winner,
        "second_place": second_place,
        "third_place": third_place,
        "year": year,
        "time": time,
        "raceName": localStorage.getItem("raceName")
    }

    fetch("http://localhost/php/proyecto/api/races/olderClasifications/", {
        method: "POST",
        body: JSON.stringify(clasifications)
    })
    .then( response => {
        if (response.status === 201) location.reload()
            else if (response.status === 404) alert(response.statusText)
            else console.log("Todo mal");
    })
    .then( data => {
        if (data) console.log(data);
    })
}

function handleModalClasi () {
    document.getElementById("clasificacionesAntiguas").classList.toggle("hidden")
    document.getElementById("tapar").classList.toggle("hidden")
}

function handleModalEliminar () {
    document.getElementById("confirmarBorrar").classList.toggle("hidden")
    document.getElementById("tapar").classList.toggle("hidden")
}
  
function loadMap () {
    // if (!map) {

        let map = L.map("map").setView(coor[0], 11)
        L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", 
                    {
                        maxZoom: 19,
                        attribution: "© OpenStreetMap"
                    }).addTo(map)
        L.control.scale().addTo(map);
        
        let sosArr = Math.trunc(coor.length / 90);
        let waterArr = Math.trunc(coor.length / 80);
        let foodArr = Math.trunc(coor.length / 50);
        let ecoZona = Math.trunc(coor.length / 30);
        let interTime1Arr = Math.trunc(coor.length / 5);
        let interTime2Arr = Math.trunc(coor.length / 3);
        let interTime3Arr = Math.trunc(coor.length / 2);
        let park = coor[50]
        
        
        
        
        let startMarker = L.marker(coor[0], {
            icon: L.divIcon({
                className: 'leaflet-div-icon',
                html: '<i class="fa-solid fa-play"></i>',
            }),
            title: "Salida"
        }).addTo(map);
        
        let arriveMarker = L.marker(coor[coor.length - 1], {
            icon: L.divIcon({
                className: 'leaflet-div-icon',
                html: '<i class="fa-solid fa-flag-checkered"></i>',
            }),
            title: "Llegada"
        }).addTo(map);
        
        let interTime1 = L.marker(coor[interTime1Arr], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-stopwatch-20"></i>',
        }),
        title: "Punto intermedio 1"
        }).addTo(map);
        
        let interTime2 = L.marker(coor[interTime2Arr], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-stopwatch-20"></i>',
        }),
        title: "Punto intermedio 2"
        }).addTo(map);
        
        let interTime3 = L.marker(coor[interTime3Arr], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-stopwatch-20"></i>',
        }),
        title: "Punto intermedio 3"
        }).addTo(map);
        
        let finalTime = L.marker(coor[coor.length - 100], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-stopwatch"></i>',
        }),
        title: "Salida"
        }).addTo(map);
        
        let ecoZone = L.marker(coor[ecoZona], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-leaf"></i>',
        }),
        title: "Zona ecológica"
        }).addTo(map);
        
        let food = L.marker(coor[foodArr], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-utensils"></i>',
        }),
        title: "Avituallamiento sólido"
        }).addTo(map);
        
        let water = L.marker(coor[waterArr], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-bottle-water"></i>',
        }),
        title: "Avituallamiento líquido"
        }).addTo(map);
        
        let parking = L.marker(park, {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-square-parking"></i>',
        }),
        title: "Parking"
        }).addTo(map);
        
        let sos = L.marker(coor[sosArr], {
        icon: L.divIcon({
            className: 'leaflet-div-icon',
            html: '<i class="fa-solid fa-suitcase-medical"></i>',
        }),
        title: "Puesto de socorro"
        }).addTo(map);
        
        startMarker.bindPopup("Punto de salida")
        arriveMarker.bindPopup("Punto de llegada")
        interTime1.bindPopup("Punto intermedio 1")
        interTime2.bindPopup("Punto intermedio 2")
        interTime3.bindPopup("Punto intermedio 3")
        finalTime.bindPopup("Tiempo final")
        ecoZone.bindPopup("Zona ecológica")
        food.bindPopup("Avituallamiento sólido")
        water.bindPopup("Avituallamiento líquido")
        parking.bindPopup("Parking")
        sos.bindPopup("Puesto de socorro")
        // .openPopup() Hace que cuando entre a la pagina, este abierto
        // L.circle([42.804963, -5.631211], {radius: 1000, color: "orange"}).addTo(map);
        
        L.polyline(coor , {color: "blue", weight: 3}).addTo(map);
    // }
}

form.elements.send.addEventListener("click", handleOptionsRace);
document.getElementById("delete").addEventListener("click", handleOptionsRace)
form.elements.eliminar.addEventListener("click", handleModalEliminar);
document.getElementById("cancelar").addEventListener("click", handleModalEliminar)
document.getElementById("confirmarClasi").addEventListener("click", addClasifications)
document.getElementById("clasifications").addEventListener("click", handleModalClasi)
document.getElementById("cancel").addEventListener("click", handleModalClasi)
document.getElementById("iconoFav").addEventListener("click", handleFavourite);
document.getElementById("tipoDetalle").addEventListener("click", handleTipeClick)
document.getElementById("tipoMapa").addEventListener("click", handleTipeClick)
document.getElementById("tipoReglamento").addEventListener("click", handleTipeClick)
document.getElementById("tipoWeb").addEventListener("click", handleTipeClick)
document.getElementById("tipoClasificaciones").addEventListener("click", handleTipeClick)
document.getElementById("tipoOrganizador").addEventListener("click", handleTipeClick)
document.getElementById("anterior").addEventListener("click", handlePrevClick);
document.getElementById("siguiente").addEventListener("click", handleNextClick);
document.getElementById("tipoMapa"),addEventListener("click", loadMap)