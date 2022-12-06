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
    index: Number,
    myarray: Array
  }

  static targets = ["card", "map", "maplandmarks", "length"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue



    console.log(this.rmarkersValue)

    console.log(this.myarrayValue)

    console.log(Number(this.lengthTarget.innerText))

    console.log(this.indexValue)

    console.log("helloo00")

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
        // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
        style: 'mapbox://styles/mapbox/streets-v10',

    });

    this.maplandmarks = new mapboxgl.Map({
      container: this.maplandmarksTarget,
        // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
        style: 'mapbox://styles/mapbox/streets-v10',



    });

    // landmark map
    this.#addLmarkersToMap()
    this.#fitMapToLmarkers()

    // route map
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

    zoom0 () {
      console.log("helooooo0")
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.rmarkersValue[0].lng, this.rmarkersValue[0].lat ])
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
    }

    zoom1 () {
      console.log("helooooo0")
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.rmarkersValue[1].lng, this.rmarkersValue[1].lat ])
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
    }

    zoom2 () {
      console.log("helooooo0")
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.rmarkersValue[2].lng, this.rmarkersValue[2].lat ])
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
    }

    zoom3 () {
      console.log("helooooo0")
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.rmarkersValue[3].lng, this.rmarkersValue[3].lat ])
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
    }

    zoom4 () {
      console.log("helooooo0")
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.rmarkersValue[4].lng, this.rmarkersValue[4].lat ])
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
    }

    zoom5 () {
      console.log("helooooo0")
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.rmarkersValue[5].lng, this.rmarkersValue[5].lat ])
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
    }

    zoom6 () {
      console.log("helooooo0")
      const bounds = new mapboxgl.LngLatBounds()
      bounds.extend([ this.rmarkersValue[6].lng, this.rmarkersValue[6].lat ])
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 7, duration: 0 })
    }


  #addLmarkersToMap() {
    this.lmarkersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.maplandmarks)
    })
  }


  #fitMapToLmarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.lmarkersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
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
