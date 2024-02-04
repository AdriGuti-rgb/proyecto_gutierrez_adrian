
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
            
            var elevation_options = {
          
                // Default chart colors: theme lime-theme, magenta-theme, ...
                theme: "lightblue-theme",
               
                // Chart container outside/inside map container
                detached: true,
               
                // if (detached), the elevation chart container
                elevationDiv: "#elevation-div",
               
                // if (!detached) autohide chart profile on chart mouseleave
                autohide: false,
               
                // if (!detached) initial state of chart profile control
                collapsed: false,
                
                // if (!detached) control position on one of map corners
                position: "topright",
                
                // Toggle close icon visibility
                closeBtn: true,
               
                // Autoupdate map center on chart mouseover.
                followMarker: true,
               
                // Autoupdate map bounds on chart update.
                autofitBounds: true,
               
                // Chart distance/elevation units.
                imperial: false,
               
                // [Lat, Long] vs [Long, Lat] points. (leaflet default: [Lat, Long])
                reverseCoords: false,
               
                // Acceleration chart profile: true || "summary" || "disabled" || false
                acceleration: false,
               
                // Slope chart profile: true || "summary" || "disabled" || false
                slope: false,
               
                // Speed chart profile: true || "summary" || "disabled" || false
                speed: false,
               
                // Altitude chart profile: true || "summary" || "disabled" || false
                altitude: true,
               
                // Display time info: true || "summary" || false
                time: true,
               
                // Display distance info: true || "summary" || false
                distance: true,
               
                // Summary track info style: "inline" || "multiline" || false
                summary: 'multiline',
               
                // Download link: "link" || false || "modal"
                downloadLink: 'link',
               
                // Toggle chart ruler filter
                ruler: true,
               
                // Toggle chart legend filter
                legend: true,
               
                // Toggle "leaflet-almostover" integration
                almostOver: true,
               
                // Toggle "leaflet-distance-markers" integration
                distanceMarkers: false,
               
                // Toggle "leaflet-edgescale" integration
                edgeScale: false,
                
                // Toggle "leaflet-hotline" integration
                hotline: true,
               
                // Display track datetimes: true || false
                timestamps: false,
               
                // Display track waypoints: true || "markers" || "dots" || false
                waypoints: true,
               
                // Toggle custom waypoint icons: true || { associative array of <sym> tags } || false
                wptIcons: {
                  '': L.divIcon({
                    className: 'elevation-waypoint-marker',
                    html: '<i class="elevation-waypoint-icon"></i>',
                    iconSize: [30, 30],
                    iconAnchor: [8, 30],
                  }),
                },
               
                // Toggle waypoint labels: true || "markers" || "dots" || false
                wptLabels: true,
               
                // Render chart profiles as Canvas or SVG Paths
                preferCanvas: true,
               
               };
            
            var map = L.map('map', { mapTypeId: 'terrain', center: [coor[0][1], coor[0][0]], zoom: 10 });
            L.polyline(coor.reverse() , {color: "blue", weight: 3}).addTo(map);
            var controlElevation = L.control.elevation(elevation_options).addTo(map);
        
            controlElevation.load(r);
        }
    }         
    // Full list options at "leaflet-elevation.js"

          
})   