let inputGPX = document.getElementById("files");

inputGPX.addEventListener("change", () => {

    const file = inputGPX.files[0];
    
    if (file) {
        const fileReader = new FileReader();
        const r = fileReader.readAsText(file);
        fileReader.onload = event => {
            const textContent = event.target.result;
            
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(textContent, "application/xml");
    
            const json = toGeoJSON.gpx(xmlDoc);
            // console.log(json);
    
            const coor = json.features[0].geometry.coordinates;
            
            let altitudMinima = coor.reduce( (acum, [_, __, alt]) => alt < acum ? alt : acum, Infinity);
            let altitudMaxima = coor.reduce( (acum, [_, __, alt]) => alt > acum ? alt : acum, -Infinity);

            
            let desnivelPositivo = 0;
            let desnivelNegativo = 0;
            coor.forEach((item, index) => {
                if (index > 0) {
                    let altActual = item[2];
                    let altAnterior = coor[index - 1][2];
                    
                    if (altActual < altAnterior) desnivelPositivo += (altAnterior - altActual)
                }
            // if (alt < item[index - 1][2] && index > 1) {
                //     console.log(`Altitud: ${alt[2]}`);
                //     console.log(`Nose: ${item[index - 1][2]}`);
                //     desnivelPositivo += (alt[2] - item[index - 1][2]);
                //     console.log(`Total: ${desnivelPositivo}`);
                // }
            });
            
            coor.forEach((item, index) => {
                if (index > 0) {
                    let altActual = item[2];
                    let altAnterior = coor[index - 1][2];
                    
                    if (altActual > altAnterior) desnivelNegativo += (altActual - altAnterior)
                }
            });
        
            console.log(`Altitud maxima: ${altitudMaxima}`);
            console.log(`Altitud minima: ${altitudMinima}`);
            console.log(`Desnivel negativo: ${desnivelNegativo.toFixed(2)}`);
            console.log(`Desnivel positivo: ${desnivelPositivo.toFixed(2)}`);

        }
    }
})
