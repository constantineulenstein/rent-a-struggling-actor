import mapboxgl from 'mapbox-gl';

mapboxgl.accessToken = process.env.MAPBOX_API_KEY;

const mapElement = document.querySelectorAll('.map');

const buildMap = (mapId) => {
  return new mapboxgl.Map({
    container: mapId,
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);

};

const fitMapToMarkers = (map, marker) => {
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ marker.lng, marker.lat ])
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = (mapId, marker) => {
  if (mapElement) {
    const map = buildMap(mapId);
    addMarkersToMap(map, marker);
    fitMapToMarkers(map, marker);
  }
};

const insertMapHTML = () => {

  let mapHTMLArray = [];
  markers.forEach((marker, index) => {
  let markerObj = JSON.stringify({ lat: marker.lat, lng: marker.lng });
  let mapHTML = `<div
      id='map${index}'
      style="width: 100%;
      height: 200px;"
      data-marker=${markerObj}
    ></div>`;
    mapHTMLArray.push(mapHTML);

  });

  mapElement.forEach((m, index) => {
    m.innerHTML = mapHTMLArray[index];
    const mapId = m.firstElementChild.id;
    const marker = JSON.parse(m.firstElementChild.dataset.marker);
    console.log(marker)
      initMapbox(mapId, marker);
  });

}

export { insertMapHTML };

