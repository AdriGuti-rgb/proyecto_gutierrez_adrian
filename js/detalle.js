if (localStorage.getItem("rol") == "User") document.getElementById("tipoOrganizador").style.visibility = "hidden";
if (localStorage.getItem("rol") == "Anonimous") {
    document.getElementById("iconoFav").style.visibility = "hidden";
    document.getElementById("tipoOrganizador").style.visibility = "hidden";
    document.getElementById("contenedorOrganizador").style.visibility = "hidden";
}


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

function handleFavourite (e) {
    let method;
    let race;
    if (e.target.classList.contains("fa-regular")) method = "PUT"
        else method = "DELETE"

    race = {
        "name": localStorage.getItem("raceName")
    }
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

document.getElementById("iconoFav").addEventListener("click", handleFavourite);
document.getElementById("tipoDetalle").addEventListener("click", handleTipeClick)
document.getElementById("tipoMapa").addEventListener("click", handleTipeClick)
document.getElementById("tipoReglamento").addEventListener("click", handleTipeClick)
document.getElementById("tipoWeb").addEventListener("click", handleTipeClick)
document.getElementById("tipoClasificaciones").addEventListener("click", handleTipeClick)
document.getElementById("tipoOrganizador").addEventListener("click", handleTipeClick)