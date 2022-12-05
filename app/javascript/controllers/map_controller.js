import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    lmarkers: Array,
    rmarkersplane: Array,
    rmarkerscar: Array,
    rmarkersbus: Array,
    rmarkersboat: Array,
    rmarkersbike: Array,
    rmarkers: Array,
    myarray: Array
  }

  static targets = ["card", "map"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue



    console.log(this.rmarkersValue)

    console.log(this.myarrayValue)

    console.log("helloo")

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
        // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
        style: 'mapbox://styles/mapbox/streets-v10',


    });

    this.#fitMapToRmarkers()
    this.#addRmarkersplaneToMap()
    this.#addRmarkerscarToMap()
    this.#addRmarkersbusToMap()
    this.#addRmarkersboatToMap()
    this.#addRmarkersbikeToMap()

    this.map.on('load', () => {
      console.log("pleaseee")
        this.map.addSource('route', {
            'type': 'geojson',
            'data': {
                'type': 'Feature',
                'properties': {},
                'geometry': {
                    'type': 'LineString',
                    'coordinates': this.myarrayValue
                }
            }
        });
        this.map.addLayer({
            'id': 'route',
            'type': 'line',
            'source': 'route',
            'layout': {
                'line-join': 'round',
                'line-cap': 'round'
            },
            'paint': {
                'line-color': '#888',
                'line-width': 5
            }
        });
    });

    // this.#addRmarkersToMap()
    // this.#fitMapToRmarkers()


    // this.#addLmarkersToMap()
    // this.#fitMapToLmarkers()



  }


  #addLmarkersToMap() {
    this.lmarkersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }


  #fitMapToLmarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.lmarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addRmarkersToMap() {
    this.rmarkersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToRmarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.rmarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addRmarkersplaneToMap() {
    this.rmarkersplaneValue.forEach((marker) => {
      const el = document.createElement('div');
      el.className = 'markerplane';
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #addRmarkerscarToMap() {
    this.rmarkerscarValue.forEach((marker) => {
      const el = document.createElement('div');
      el.className = 'markercar';
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #addRmarkersbusToMap() {
    this.rmarkersbusValue.forEach((marker) => {
      const el = document.createElement('div');
      el.className = 'markerbus';
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #addRmarkersboatToMap() {
    this.rmarkersboatValue.forEach((marker) => {
      const el = document.createElement('div');
      el.className = 'markerboat';
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #addRmarkersbikeToMap() {
    this.rmarkersbikeValue.forEach((marker) => {
      const el = document.createElement('div');
      el.className = 'markerbike';
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }


}
  // landmark(e) {
  //   e.preventDefault()
  //   console.log(e)
  //   console.log(e.target)
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  // }
