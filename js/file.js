const file = inputGPX.files[0];

if (file) {
    const fileReader = new FileReader();
    const r = fileReader.readAsText(file);
    fileReader.onload = event => {
        console.log(event.target);
        const textContent = event.target.result;
        
        const parser = new DOMParser();
        const xmlDoc = parser.parseFromString(textContent, "application/xml");

        const json = toGeoJSON.gpx(xmlDoc);
        console.log(json);

        const coor = json.features[0].geometry.coordinates;
        coor.reduce( (item, index, [lat, lon, alt]) => alt <+ acum ? alt : acum, Infinity);
        coor.reduce( (acum, [_, __, alt]) => alt <+ acum ? alt : acum, Infinity);
    }
}