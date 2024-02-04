if (localStorage.getItem("rol") == "Anonimous") location.href = "./paginaPpal.html"
localStorage.removeItem("raceName");
let inputGPX = document.getElementById("gpx");
let form = document.forms.registerRace;
let send = form.elements.send;
let neg_slope;
let pos_slope;
let coordenadas = []

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

    let formData = new FormData();
    
    if (coordenadas.length == 0) putErrors("Introduzca la ruta")
    else {
        formData.append("raceName", form.elements.nombreCarrera.value)
        formData.append("categories", form.elements.categorias.value)
        formData.append("total_slope", form.elements.desnivel.value)
        formData.append("distance", form.elements.distancia.value)
        formData.append("positive_slope", neg_slope)
        formData.append("negative_slope", pos_slope)
        formData.append("poblation", form.elements.poblacion.value)
        formData.append("main_photo", form.fotoPrincipal.files[0])
        formData.append("pdf", form.pdf.files[0])
        formData.append("webRef", form.enlaceWeb.value)
        formData.append("race_day", form.elements.fechaRealizacion.value)
        formData.append("modality", form.elements.modalidad.value)
        formData.append("coor", JSON.stringify(coordenadas))


        Array.from(form.fotosAnteriores.files)
            .forEach( item => formData.append("older_photos[]", item))

        Array.from(form.elements.servicios.selectedOptions)
            .forEach( item => formData.append("services[]", item.value))

        fetch("http://localhost/php/proyecto/api/races/register/", {
            method: "POST",
            headers: {
                Authorization: `${localStorage.getItem("token")}`
            },
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
        
        neg_slope = values.neg.toFixed(2);
        pos_slope = values.pos.toFixed(2);
        form.elements.desnivel.value = (values.pos + values.neg).toFixed(2);
        }
    }   
}

function putErrors (error) {
    if (document.getElementById("error") != null) document.getElementById("error").remove();
    let div = document.createElement("div");
    div.id = "error";
    let main = document.getElementsByTagName("main");
    div.innerHTML = `${error}`;
    main[0].append(div);
}

inputGPX.addEventListener("change", calcultateSlope);
send.addEventListener("click", registerRace);