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

send.addEventListener("click", e => {
    e.preventDefault();
    
    let raceName = form.elements.nombreCarrera.value;
    let categories = form.elements.categorias.value;
    let total_slope = form.elements.desnivel.value;
    let positive_slope = form.elements.desnivelPos.value;
    let poblation = form.elements.poblacion.value;
    let main_photo = form.elements.fotoPrincipal.value;
    let gpx = form.elements.gpx.value;
    let race_day = form.elements.fechaRealizacion.value;
    let negative_slope = form.elements.desnivelNeg.value;
    let services = Array.from(form.elements.servicios.selectedOptions);
    let modality = form.elements.modalidad.value;
    let older_photos = form.elements.fotosAnteriores.value;
    
    
    let arrayServices = [];
    Array.from(form.elements.servicios.selectedOptions)
    .forEach( item => arrayServices.push(item.value))
    
    let race = {
        "raceName": raceName,
        "categories": categories,
        "total_slope": total_slope,
        "positive_slope": positive_slope,
        "negative_slope": negative_slope,
        "poblation": poblation,
        "main_photo": main_photo,
        "gpx": gpx,
        "race_day": race_day,
        "services": arrayServices,
        "modality": modality,
        "older_photos": older_photos
    };
    console.log(race);
    // console.log(Array.from(form.elements.servicios.selectedOptions));
    // console.log(race);

    fetch("http://localhost/php/proyecto/api/races/register/", {
        method: "POST",
        headers: {
            "Content-Type": "application/json;charset=utf-8"
        },
        mode: "cors",
        body: JSON.stringify(race)
    }).then( response => {
        if (response.status === 201) return response.json()
            else if (response.status === 404) alert(response.statusText)
            else throw new Error("Hubo un problema con la solicitud")
    }).then(data => {                
        console.log(data);
    }).catch(error => console.error(error));
})