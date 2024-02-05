
document.getElementById("gpx").addEventListener("change", e => {
    const file = e.target.files[0];
    
    if (file) {
        const fileReader = new FileReader();
        const r = fileReader.readAsText(file);
        fileReader.onload = event => {
            const textContent = event.target.result;
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(textContent, "application/xml");
            const json = toGeoJSON.gpx(xmlDoc);
            const coor = json.features[0].geometry.coordinates;
            
            
            var map = L.map('map', { mapTypeId: 'terrain', center: [coor[0][1], coor[0][0]], zoom: 10 });
            L.polyline(coor.reverse() , {color: "blue", weight: 3}).addTo(map);
        
            var puntos = coor;
          
            var elevation = L.control.elevation({
              theme: 'lime-theme',  // Puedes cambiar el tema según tus preferencias.
            });
            elevation.addTo(map);
          
            elevation.addData(puntos);
        }
    }         
    // Full list options at "leaflet-elevation.js"

          
})   