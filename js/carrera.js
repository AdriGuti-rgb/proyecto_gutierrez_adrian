if (localStorage.getItem("rol") == "Anonimous") location.href = "./paginaPpal.html"
let inputGPX = document.getElementById("gpx");
let form = document.forms.registerRace;
let send = form.elements.send;

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

function registerRace (e) {
    e.preventDefault();

    let arrayServices = [];
    
    
    let formData = new FormData();
    
    formData.append("raceName", form.elements.nombreCarrera.value)
    formData.append("categories", form.elements.categorias.value)
    formData.append("total_slope", form.elements.desnivel.value)
    formData.append("distance", form.elements.distancia.value)
    formData.append("positive_slope", form.elements.desnivelPos.value)
    formData.append("negative_slope", form.elements.desnivelNeg.value)
    formData.append("poblation", form.elements.poblacion.value)
    formData.append("main_photo", form.fotoPrincipal.files[0])
    formData.append("race_day", form.elements.fechaRealizacion.value)
    formData.append("services", arrayServices)
    formData.append("modality", form.elements.modalidad.value)
    
    Array.from(form.fotosAnteriores.files)
        .forEach( item => {
            console.log(item);
            formData.append("older_photos[]", item)
        })

    Array.from(form.elements.servicios.selectedOptions)
        .forEach( item => formData.append("services", item.value))
    
    fetch("http://localhost/php/proyecto/api/races/register/", {
        method: "POST",
        mode: "cors",
        body: formData
    }).then( response => {
        if (response.status === 201) location.href = "./paginaPpal.html"
            else if (response.status === 404) alert(response.statusText)
            else throw new Error("Hubo un problema con la solicitud")
    }).then(data => {                
        if (data) console.log(data);
    }).catch(error => console.error(error));
}

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

inputGPX.addEventListener("change", calcultateSlope);
send.addEventListener("click", registerRace);