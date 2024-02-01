if (localStorage.getItem("rol") == "Anonimous") location.href = "./paginaPpal.html"

fetch("http://localhost/php/proyecto/api/races/modalities/", )
    .then( response => {
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else if (response.status === 401) expirationToken()
            else console.log("Todo mal");
    })
    .then( data => {

        let form = document.forms.registerRace;

        let modalidad = form.elements.modalidad;

        data.forEach( (item, index) => {
            let selected = false;

            if (index == 0) selected = true;
            
            let option = new Option(item.type, item.type, false, selected);
            modalidad.append(option)
        });
    })


fetch("http://localhost/php/proyecto/api/races/categories/", )
    .then( response => {
        if (response.status === 200) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else if (response.status === 401) expirationToken()
            else console.log("Todo mal");
    })
    .then( data => {

        let form = document.forms.registerRace;

        let categorias = form.elements.categorias;

        data.forEach( (item, index) => {
            let selected = false;

            if (index == 0) selected = true;
            
            let option = new Option(item.type, item.type, false, selected);
            categorias.append(option)
        });
    })

    
    
    fetch("http://localhost/php/proyecto/api/races/services/", )
        .then( response => {
            if (response.status === 200) return response.json()
                else if (response.status === 404) alert(response.statusText)
                else if (response.status === 401) expirationToken()
                else console.log("Todo mal");
        })
        .then( data => {
            let form = document.forms.registerRace;

            let servicios = form.elements.servicios;

            data.sort( (a, b) => a.type > b.type)
                .forEach( (item, index) => {
                    let selected = false;

                    if (index == 0) selected = true;
                    
                    let option = new Option(item.type, item.type, false, selected);
                    servicios.append(option)
        })
    });
        
fetch("http://localhost/php/proyecto/api/races/categories/", )
        .then( response => {
            if (response.status === 200) return response.json()
                else if (response.status === 404) alert(response.statusText)
                else if (response.status === 401) expirationToken()
                else console.log("Todo mal");
        })
        .then( data => {
    
            let form = document.forms.registerRace;
    
            let categorias = form.elements.categorias;
    
            data.forEach( (item, index) => {
                let selected = false;
    
                if (index == 0) selected = true;
                
                let option = new Option(item.type, item.type, false, selected);
                categorias.append(option)
            });
        })


let form = document.forms.registerRace;
let send = form.elements.send;

send.addEventListener("click", registerRace);

function registerRace (e) {
    e.preventDefault();
    
    let arrayOldPhotos = [];
    let arrayServices = [];
    
    Array.from(form.elements.fotosAnteriores.files)
        .forEach( item => arrayOldPhotos.push(item.name));
    
    Array.from(form.elements.servicios.selectedOptions)
        .forEach( item => arrayServices.push(item.value))
    
    let race = {
        "raceName": form.elements.nombreCarrera.value,
        "categories": form.elements.categorias.value,
        "total_slope": form.elements.desnivel.value,
        "positive_slope": form.elements.desnivelPos.value,
        "negative_slope": form.elements.desnivelNeg.value,
        "distance": form.elements.distancia.value,
        "poblation": form.elements.poblacion.value,
        "main_photo": form.elements.fotoPrincipal.value,
        "gpx": form.elements.gpx.value,
        "race_day": form.elements.fechaRealizacion.value,
        "services": arrayServices,
        "modality": form.elements.modalidad.value,
        "older_photos": arrayOldPhotos
    };

    fetch("http://localhost/php/proyecto/api/races/register/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json;charset=utf-8"
        },
        mode: "cors",
        body: JSON.stringify(race)
    }).then( response => {
        if (response.status === 201) location.href = "./paginaPpal.html"
            else if (response.status === 404) alert(response.statusText)
            else throw new Error("Hubo un problema con la solicitud")
    }).then(data => {                
        if (data) console.log(data);
    }).catch(error => console.error(error));
}

let inputGPX = document.getElementById("gpx");

inputGPX.addEventListener("change", calcultateSlope);

function calcultateSlope (){
    const file = inputGPX.files[0];
    
    if (file) {
        const fileReader = new FileReader();
        const r = fileReader.readAsText(file);
        fileReader.onload = event => {
            const textContent = event.target.result;
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(textContent, "application/xml");
            const json = toGeoJSON.gpx(xmlDoc);
            const coor = json.features[0].geometry.coordinates;

            
            let altitudes = coor.map(item => item[2]);
            let coordenadas = [];
            coor.forEach((item, index) => {
                if ((index % 3 == 0) && (index % 2 == 0) && (index % 4 == 0)) {
                    coordenadas.push([item[1],item[0]])
                }
            })
            console.log(coordenadas.length);
            console.log(JSON.stringify(coordenadas));

            let values = altitudes.reduce( ({pos, neg, prev}, item) => {
                            if (item < prev) pos += (prev - item)
                                else neg += (item - prev)
                            return {pos: pos, neg: neg, prev:item}
                    }, {pos:0, neg:0, prev: altitudes[0]});

            form.elements.desnivelNeg.value = values.neg.toFixed(2);
            form.elements.desnivelPos.value = values.pos.toFixed(2);
            form.elements.desnivel.value = (values.pos + values.neg).toFixed(2);
        }
    }
}