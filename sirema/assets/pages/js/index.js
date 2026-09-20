var map = L.map('map').setView([12.8654, -85.2072], 8);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

var LeafIcon = L.Icon.extend({
    options: {
        shadowUrl: '',
        iconSize:     [70, 70],
        shadowSize:   [50, 64],
        iconAnchor:   [35, 70],
        shadowAnchor: [4, 62],
        popupAnchor:  [0, -78]
    }
});

var greenIcon = new LeafIcon({iconUrl: 'assets/pages/img/pin_bicu.png'});

//var marker = L.marker([12.8654, -85.2072], {icon: greenIcon}).addTo(map).bindPopup(card);

function LatLon()
{
    axios.post('views/ajax/home/action.php', { type: "lat_lon"})
        .then(function(response) {
            //parseFloat(r)
            for(cen of response.data)
            {
                lat = parseFloat(cen.lat)
                lon = parseFloat(cen.lon)
                L.marker([lat, lon], {icon: greenIcon}).addTo(map).bindPopup(cen.card);
            }
        })
        .catch(function(error) {
            console.log(error)
        })
}

$(document).ready(function(){
   LatLon();
});

