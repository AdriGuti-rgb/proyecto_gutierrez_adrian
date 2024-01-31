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
console.log(currentYear);

/* Carreras favoritas del usuario */
fetch("http://localhost/php/proyecto/api/races/favourites/", {
    headers: {
        Authorization: `${localStorage.getItem("token")}`
    }
})
.then( response => {
    if (response.status === 200) return response.json()
        else if (response.status === 404) alert(response.statusText)
        else console.log("Todo mal");
})
.then( data => {
    if (data) {
        let carrera = data.find( ({name}) => name == localStorage.getItem("raceName"));
        if (carrera) {
            document.getElementById("iconoFav").classList.toggle("fa-regular")
            document.getElementById("iconoFav").classList.toggle("fa-solid")
        }
    }
})


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
    // console.log(olderClasifications);
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
    console.log(date.toJSON().slice(0,10) < raceData.race_day)
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

form.elements.send.addEventListener("click", handleOptionsRace);
form.elements.delete.addEventListener("click", handleOptionsRace);
document.getElementById("iconoFav").addEventListener("click", handleFavourite);
document.getElementById("tipoDetalle").addEventListener("click", handleTipeClick)
document.getElementById("tipoMapa").addEventListener("click", handleTipeClick)
document.getElementById("tipoReglamento").addEventListener("click", handleTipeClick)
document.getElementById("tipoWeb").addEventListener("click", handleTipeClick)
document.getElementById("tipoClasificaciones").addEventListener("click", handleTipeClick)
document.getElementById("tipoOrganizador").addEventListener("click", handleTipeClick)