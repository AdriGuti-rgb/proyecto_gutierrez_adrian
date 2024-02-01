let map = L.map("map")
            .setView([42.60, -5.57], 13)


L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", 
            {
                maxZoom: 19,
                // atribution: &copy
            }).addTo(map)
    
let marker = L.marker([42.60, -5.57], {title: "Leon"}).addTo(map)
marker.bindPopup("<h1>Nunca se sabra</h1>")
// .openPopup() Hace que cuando entre a la pagina, este abierto


L.circle([42.60, -5-57], {radius: 1000, color: "orange"}).addTo(map)

L.polyline( [
    [42.60, -5.57],
    [41.60, -8.57],
    [44.60, -6.57]
], {color: "black", weight: 10} ).addTo(map)