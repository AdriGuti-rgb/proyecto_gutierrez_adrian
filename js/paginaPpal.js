let currentPage = 0;
let itemsPerPage = 12;
let totalPages = 0;
let dataGlobal;
let point = [];
let valueDistance = null
let valueCity = null
let valueNegSlope = null
let valuePosSlope = null
let filterEndedCheck = false
let valueCategory = null;
let valueSlope = null

fetch("http://localhost/php/proyecto/api/races/totalRaces/", )
    .then( response => {
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else console.log("Todo mal");
    })
    .then( data => {
        if (data) {
            dataGlobal = data;
            data.forEach((item) => point.push(JSON.parse(item.coor)))
            renderRaces(dataGlobal);
        }
    })



fetch("http://localhost/php/proyecto/api/races/cities/", )
    .then( response => {
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else console.log("Todo mal");
    })
    .then( data => {
        if (data) {
            data.forEach( ({poblation}) => {
                let option = new Option(poblation, poblation, false, false)
                option.classList.add("noMarcado")
                option.addEventListener("click", hanldeFilterCity)
                document.getElementById("cuartoValor").append(option)
            })
        }
    })


fetch("http://localhost/php/proyecto/api/races/categories/", )
    .then( response => {
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else console.log("Todo mal");
    })
    .then( data => {
        if (data) {
            data.forEach( ({type}) => {
                let option = new Option(type, type, false, false)
                option.classList.add("noMarcado")
                option.addEventListener("click", hanldeFilterCategory)
                document.getElementById("tercerValor").append(option)
            })
        }
    })



function renderRaces(data) {
    if (filterEndedCheck) {
        let hoy = new Date();
        let otra = hoy.toLocaleDateString()
    
        let partesFecha = otra.split("/");
        let dia = partesFecha[0];
        let mes = partesFecha[1];
        let año = partesFecha[2];
    
        let fecha = new Date(año, mes - 1, dia);
    
        let añoFormateado = fecha.getFullYear();
        let mesFormateado = ("0" + (fecha.getMonth() + 1)).slice(-2);
        let diaFormateado = ("0" + fecha.getDate()).slice(-2);
    
        let finalDate = añoFormateado + "-" + mesFormateado + "-" + diaFormateado;
    
        data = data.filter(({race_day}) => race_day < finalDate);
    }

    if (valueNegSlope) {
        data = data.filter(({negative_slope}) => parseFloat(negative_slope) > valueNegSlope);
    }

    if (valuePosSlope) {
        data = data.filter(({positive_slope}) => parseFloat(positive_slope) > valuePosSlope);
    }

    if (valueCategory) {
        data = data.filter(({type}) => type == valueCategory);
    }

    if (valueCity) {
        data = data.filter(({poblation}) => poblation == valueCity);
    }

    if (valueDistance) {
        data = data.filter(({distance}) => parseFloat(distance) > valueDistance);
    }

    if (valueSlope) {
        data = data.filter(({total_slope}) => parseFloat(total_slope) > valueSlope);
    }

    let races = document.getElementById('carreras');
    let paginas = document.getElementById("numerosPagina");
    totalPages = Math.ceil((data.length / itemsPerPage) - 1);
    races.innerHTML = "";
    document.getElementById("cantidad").textContent = `Mostrando ${itemsPerPage < data.length ? itemsPerPage : data.length} de ${data.length}`
    data.filter( (_, index) => Math.trunc(index / itemsPerPage) == currentPage )
        .forEach( ({name, main_photo}) => {
        races.innerHTML += `
            <div class="cards">
                <div class="fotoCarrera">
                    <img src="./img/races/${name}/${main_photo}" alt="Foto 1">
                </div>
                <div class="info">
                    <span>${name}</span>
                    <div class="detalles" id="botonDetalle">
                        <span>Detalles</span>
                    </div>
                </div>
            </div>
            `;
    });

    Array.from(document.getElementsByClassName("detalles")).forEach(item => item.addEventListener("click", getName));
    paginas.innerHTML = `
            Página ${currentPage +1} de ${totalPages + 1}
        `;
}

function handleFistClick () {
    currentPage = 0;
    renderRaces(dataGlobal);
}

function handleLastClick () {
    currentPage = totalPages;
    renderRaces(dataGlobal);
}

function handlePrevClick () {
    if (currentPage > 0) {
        currentPage--;
    }
    renderRaces(dataGlobal);
}

function handleNextClick () {
    if (currentPage < totalPages) {
        currentPage++;
    }
    renderRaces(dataGlobal);
}

function handleNameSearchClick () {
    let value = document.getElementById("nombreCarrera").value;
    let dataTemporal = dataGlobal.filter( ({name}) => name.toLowerCase().includes(value.toLowerCase()))
    
    renderRaces(dataTemporal)
}

function handleProvinceSearchClick () {
    let value = document.getElementById("provincia").value;
    let dataTemporal = dataGlobal.filter( ({poblation}) => poblation.toLowerCase().includes(value.toLowerCase()))
    
    renderRaces(dataTemporal)
}

function handleOrderChange (e) {
    let noMarcado = Array.from(e.explicitOriginalTarget.options).find( (_, index) => index == e.explicitOriginalTarget.options.selectedIndex)
    Array.from(e.explicitOriginalTarget.options).forEach(item => {
        item.classList.remove("marcado")
        item.classList.add("noMarcado")
    })

    noMarcado.classList.add("marcado");
    noMarcado.classList.remove("noMarcado");

    let dataTemporal;
    switch (e.explicitOriginalTarget.value) {
        case "nombre":
            dataTemporal = dataGlobal.sort((a, b) => a.name.toLowerCase() > b.name.toLowerCase());
            break;
        case "distancia":
            dataTemporal = dataGlobal.sort((a, b) => parseFloat(a.distance) > parseFloat(b.distance))
            break;
        case "desnivelTot":
            dataTemporal = dataGlobal.sort((a, b) => parseFloat(a.total_slope) > parseFloat(b.total_slope))
            break;
        case "desnivelPos":
            dataTemporal = dataGlobal.sort((a, b) => parseFloat(a.positive_slope) > parseFloat(b.positive_slope))
            break;
        case "desnivelNeg":
            dataTemporal = dataGlobal.sort((a, b) => parseFloat(a.negative_slope) > parseFloat(b.negative_slope))
            break;
        case "poblacion":
            dataTemporal = dataGlobal.sort((a, b) => a.poblation.toLowerCase() > b.poblation.toLowerCase())
            break;
        case "fecha":
            dataTemporal = dataGlobal.sort((a, b) => a.race_day > b.race_day)
            break;
        default:
            dataTemporal = []
            break;
    }

    renderRaces(dataTemporal);
}

function handeFilterDelete () {
    let marcados = document.querySelectorAll(".campos .marcado");
    let cross = document.querySelectorAll(".fa-xmark")

    marcados.forEach( item => item.classList.remove("marcado"));
    cross.forEach( item => item.remove());

    valueDistance = null
    filterEndedCheck = false
    valueCategory = null
    valueCity = null
    valueSlope = null
    valuePosSlope = null
    valueNegSlope = null

    renderRaces(dataGlobal)
}

function handleIconFav (e) {
    e.target.classList.toggle("fa-regular");
    e.target.classList.toggle("fa-solid");
    document.getElementById("favoritas").classList.toggle("hidden");
    document.getElementById("tapar").classList.toggle("hidden");
    document.getElementById("iconoMapa").style.zIndex = 4;
    if (e.target.classList.contains("fa-solid")) {
        document.getElementById("iconoMapa").style.zIndex = 0;
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
                document.getElementById("favoritas").innerHTML = `
                    <span style='font-size: 28px;'>Tus carreras favoritas:</span>
                `;
                data.sort( (a, b) => a.race_day > b.race_day)
                    .forEach( ({name, main_photo}) => {
                        document.getElementById("favoritas").innerHTML += `
                            <div class="cards">
                            <div class="fotoCarrera">
                                <img src="./img/races/${name}/${main_photo}" alt="Foto 1">
                            </div>
                            <div class="info">
                                <span>${name}</span>
                                <div class="detalles" id="botonDetalle">
                                    <span>Detalles</span>
                                </div>
                            </div>
                        </div> 
                        `;
                })
                Array.from(document.getElementsByClassName("detalles")).forEach(item => item.addEventListener("click", getName));
            }
        })

    }
}

function getName (e) {
    localStorage.setItem('raceName', e.currentTarget.parentElement.children[0].textContent);
    location.href = "./detalle.html";
}

function loadMap () {
    document.getElementById("containerMap").classList.remove("hidden")
    document.getElementById("tapar").classList.remove("hidden")
    document.getElementById("iconoFav").style.zIndex = 0;
    document.getElementById("iconoMapa").style.zIndex = 0;

    let map = L.map("map").setView([40.41, -3.70], 6)

    L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', 
    {
        maxZoom: 19,
        attribution: "© OpenTopoMap"
    }).addTo(map)
    L.control.scale().addTo(map);
    

    point.forEach(item => {
        L.marker(item[0]).addTo(map);
    })
    
}

function hanldeFilterEnded (e) {
    e.currentTarget.classList.remove("noMarcado")
    e.currentTarget.classList.add("marcado")
    e.currentTarget.previousElementSibling.classList.remove("noMarcado")
    e.currentTarget.previousElementSibling.classList.add("marcado")
    e.currentTarget.previousElementSibling.innerHTML = "<i class='fa-solid fa-xmark' id='deleteFilterEnded'></i>"
    document.getElementById("deleteFilterEnded").addEventListener("click", quitFilter)
    filterEndedCheck = true

    renderRaces(dataGlobal)
}

function hanldeFilterCategory (e) {
    e.currentTarget.parentNode.classList.remove("noMarcado")
    e.currentTarget.parentNode.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.remove("noMarcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.innerHTML = "<i class='fa-solid fa-xmark' id='deleteFilterCategory'></i>"
    document.getElementById("deleteFilterCategory").addEventListener("click", quitFilterOptions)

    valueCategory = e.target.value

    renderRaces(dataGlobal)
}

function hanldeFilterCity (e) {
    e.currentTarget.parentNode.classList.remove("noMarcado")
    e.currentTarget.parentNode.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.remove("noMarcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.innerHTML = "<i class='fa-solid fa-xmark' id='deleteFilterCity'></i>"
    document.getElementById("deleteFilterCity").addEventListener("click", quitFilterOptions)

    valueCity = e.target.value

    renderRaces(dataGlobal)
}

function hanldeFilterDistance (e) {
    e.currentTarget.parentNode.classList.remove("noMarcado")
    e.currentTarget.parentNode.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.remove("noMarcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.innerHTML = "<i class='fa-solid fa-xmark' id='deleteFilterDistance'></i>"
    document.getElementById("deleteFilterDistance").addEventListener("click", quitFilterOptions)

    valueDistance = e.target.value

    renderRaces(dataGlobal)
}

function hanldeFilterTotalSlope (e) {
    e.currentTarget.parentNode.classList.remove("noMarcado")
    e.currentTarget.parentNode.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.remove("noMarcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.innerHTML = "<i class='fa-solid fa-xmark' id='deleteFilterTotalSlope'></i>"
    document.getElementById("deleteFilterTotalSlope").addEventListener("click", quitFilterOptions)

    valueSlope = e.target.value

    renderRaces(dataGlobal)
}

function hanldeFilterPosSlope (e) {
    e.currentTarget.parentNode.classList.remove("noMarcado")
    e.currentTarget.parentNode.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.remove("noMarcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.innerHTML = "<i class='fa-solid fa-xmark' id='deleteFilterPosSlope'></i>"
    document.getElementById("deleteFilterPosSlope").addEventListener("click", quitFilterOptions)

    valuePosSlope = e.target.value

    renderRaces(dataGlobal)
}

function hanldeFilterNegSlope (e) {
    e.currentTarget.parentNode.classList.remove("noMarcado")
    e.currentTarget.parentNode.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.remove("noMarcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.classList.add("marcado")
    e.currentTarget.parentNode.parentNode.previousElementSibling.innerHTML = "<i class='fa-solid fa-xmark' id='deleteFilterNegSlope'></i>"
    document.getElementById("deleteFilterNegSlope").addEventListener("click", quitFilterOptions)

    valueNegSlope = e.target.value

    renderRaces(dataGlobal)
}

function quitFilter (e) {
    e.target.parentNode.classList.toggle("marcado")
    e.target.parentNode.classList.toggle("noMarcado")
    e.target.parentNode.nextElementSibling.classList.remove("marcado");
    e.target.parentNode.nextElementSibling.classList.add("noMarcado");
    e.target.remove()

    switch (e.target.id) {
        case "deleteFilterEnded":
            filterEndedCheck = false
            break;
        default:
            break;
    }
    renderRaces(dataGlobal)
}

function quitFilterOptions (e) {
    e.target.parentNode.classList.toggle("marcado")
    e.target.parentNode.classList.toggle("noMarcado")
    e.target.parentNode.parentNode.children[1].children[0].classList.remove("marcado");
    e.target.parentNode.parentNode.children[1].children[0].classList.add("noMarcado");
    e.target.remove()

    switch (e.target.id) {
        case "deleteFilterCategory":
            valueCategory = null
            break;
        case "deleteFilterCity":
            valueCity = null
            break;
        case "deleteFilterDistance":
            valueDistance = null
            break;
        case "deleteFilterTotalSlope":
            valueSlope = null
            break;
        case "deleteFilterNegSlope":
            valueNegSlope = null
            break;
        case "deleteFilterPosSlope":
            valuePosSlope = null
            break;
        default:
            break;
    }
    renderRaces(dataGlobal)
}

localStorage.removeItem('raceName');

document.querySelectorAll(".distanceOptions").forEach(item => item.addEventListener("click", hanldeFilterDistance))
document.querySelectorAll(".totalSlopeOptions").forEach(item => item.addEventListener("click", hanldeFilterTotalSlope))
document.querySelectorAll(".posSlopeOptions").forEach(item => item.addEventListener("click", hanldeFilterPosSlope))
document.querySelectorAll(".negSlopeOptions").forEach(item => item.addEventListener("click", hanldeFilterNegSlope))
document.getElementById("iconoFav").addEventListener("click", handleIconFav)
document.getElementById("tercerLi").addEventListener("click", handeFilterDelete);
document.getElementById("primera").addEventListener("click", handleFistClick);
document.getElementById("anterior").addEventListener("click", handlePrevClick);
document.getElementById("siguiente").addEventListener("click", handleNextClick);
document.getElementById("ultima").addEventListener("click", handleLastClick);
document.getElementById("busquedaNombre").addEventListener("click", handleNameSearchClick);
document.getElementById("nombreCarrera").addEventListener("input", handleNameSearchClick);
document.getElementById("busquedaProvincia").addEventListener("click", handleProvinceSearchClick);
document.getElementById("provincia").addEventListener("input", handleProvinceSearchClick);
document.getElementById("ordenar").addEventListener("change", handleOrderChange);
document.getElementById("iconoMapa").addEventListener("click", loadMap);
document.getElementById("terminadas").addEventListener("click", hanldeFilterEnded)
document.getElementById("closeMap").addEventListener("click", e => {
    e.target.parentNode.classList.add("hidden")
    document.getElementById("iconoFav").style.zIndex = 5;
    document.getElementById("tapar").classList.add("hidden")
});