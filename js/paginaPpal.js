let currentPage = 0;
let itemsPerPage = 12;
let totalPages = 0;
let dataGlobal;
let point = [];

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
            // data.forEach((item) => console.log(item.coor[0]))
            // console.log(point);
            document.getElementById("cantidad").textContent = `Mostrando ${itemsPerPage < data.length ? itemsPerPage : data.length} de ${data.length}`
            renderRaces(dataGlobal);
        }
    })


function renderRaces(data) {
    let races = document.getElementById('carreras');
    let paginas = document.getElementById("numerosPagina");
    totalPages = Math.ceil((data.length / itemsPerPage) - 1);
    races.innerHTML = "";
    
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
    marcados.forEach( item => item.classList.remove("marcado"));
}

function handleIconFav (e) {
    e.target.classList.toggle("fa-regular");
    e.target.classList.toggle("fa-solid");
    document.getElementById("favoritas").classList.toggle("hidden");
    document.getElementById("tapar").classList.toggle("hidden");

    if (e.target.classList.contains("fa-solid")) {
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
        attribution: "© OpenStreetMap"
    }).addTo(map)
    L.control.scale().addTo(map);
    

    point.forEach(item => {
        console.log(item[0]);
        L.marker(item[0]).addTo(map);
    })
    
}

localStorage.removeItem('raceName');

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
document.getElementById("closeMap").addEventListener("click", e => {
    e.target.parentNode.classList.add("hidden")
    document.getElementById("tapar").classList.add("hidden")
});