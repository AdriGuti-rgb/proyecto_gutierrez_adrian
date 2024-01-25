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
            const coor = json.features[0].geometry.coordinates;
            
            let altitudMinima = coor.reduce( (acum, [_, __, alt]) => alt < acum ? alt : acum, Infinity);
            let altitudMaxima = coor.reduce( (acum, [_, __, alt]) => alt > acum ? alt : acum, -Infinity);
        
            let altitudes = coor.map(item => item[2]);

            let values = altitudes.reduce( ({pos, neg, prev}, item) => {
                            if (item < prev) pos += (prev - item)
                                else neg += (item - prev)
                            return {pos: pos, neg: neg, prev:item}
                    }, {pos:0, neg:0, prev: altitudes[0]});

            
            
            console.log(`Altitud maxima: ${altitudMaxima}`);
            console.log(`Altitud minima: ${altitudMinima}`);
            console.log(`Desnivel negativo: ${values.neg.toFixed(2)}`);
            console.log(`Desnivel positivo: ${values.pos.toFixed(2)}`);
            console.log(`Desnivel acumulado: ${(values.pos + values.neg).toFixed(2)}`);

        }
    }
})
