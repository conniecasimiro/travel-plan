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
    rmarkersyacht: Array,
    rmarkersfirst: Array,
    rmarkers: Array,
    landmarkarray: Array,
    myarray: Array
  }

  static targets = ["card", "map", "maplandmarks", "length", "btn", "place"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    console.log(this.rmarkersValue)

    console.log(this.myarrayValue)

    console.log(this.rmarkersfirstValue)

    console.log(this.landmarkarrayValue)

    console.log("hello1")

    this.btnTarget.focus()

    console.log(this.btnTarget.focus)

    this.map = new mapboxgl.Map({
      container: this.placeTarget,
        // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
        style: 'mapbox://styles/mapbox/streets-v10',

    });



    // landmark map
    // this.#addLmarkersToMap()
    // this.#fitMapToLmarkers()

    // route map
    this.#fitMapToRmarkers()
    this.#addRmarkersplaneToMap()
    this.#addRmarkerscarToMap()
    this.#addRmarkersbusToMap()
    this.#addRmarkersboatToMap()
    this.#addRmarkersbikeToMap()
    this.#addRmarkersfirstToMap()
    this.#addRmarkersyachtToMap()

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

  routes () {
    this.placeTarget.hidden = false
    console.log("im here")
    this.map = new mapboxgl.Map({
      container: this.placeTarget,
        // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
        style: 'mapbox://styles/mapbox/streets-v10',

    });
    this.#fitMapToRmarkers()
    this.#addRmarkersplaneToMap()
    this.#addRmarkerscarToMap()
    this.#addRmarkersbusToMap()
    this.#addRmarkersboatToMap()
    this.#addRmarkersbikeToMap()
    this.#addRmarkersfirstToMap()
    this.#addRmarkersyachtToMap()

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
  }

  landmarks () {
    this.placeTarget.hidden = false
    this.maplandmarks = new mapboxgl.Map({
      container: this.placeTarget,
        // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
        style: 'mapbox://styles/mapbox/streets-v10',

    });
    this.#addLmarkersToMap()
    this.#fitMapToLmarkers()

  }

  comments () {
    this.placeTarget.hidden = true
    this.mapTarget.hidden = true
  }


    zoom0 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(0, (this.landmarkarrayValue[0])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1500 })
    }

    zoom1 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0], (this.landmarkarrayValue[0] + this.landmarkarrayValue[1])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1500 })
    }

    zoom2 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1], (this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
    }

    zoom3 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2], ( this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2]+ this.landmarkarrayValue[3])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
    }


    zoom4 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2] + this.landmarkarrayValue[3], ( this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2]+ this.landmarkarrayValue[3] + this.landmarkarrayValue[4])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
    }

    zoom5 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2] + this.landmarkarrayValue[3] + this.landmarkarrayValue[4], ( this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2]+ this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
    }

    zoom6 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2] + this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5], ( this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2]+ this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5] + this.landmarkarrayValue[6])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
    }

    zoom7 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2] + this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5] + this.landmarkarrayValue[6], ( this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2]+ this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5] + this.landmarkarrayValue[6] + this.landmarkarrayValue[7])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
    }


    zoom8 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2] + this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5] + this.landmarkarrayValue[6] + this.landmarkarrayValue[7], ( this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2]+ this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5] + this.landmarkarrayValue[6] + this.landmarkarrayValue[7] + this.landmarkarrayValue[8])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
    }

    zoom9 () {
      console.log("a")
      const bounds = new mapboxgl.LngLatBounds()
      this.lmarkersValue.slice(this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2] + this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5] + this.landmarkarrayValue[6] + this.landmarkarrayValue[7] + this.landmarkarrayValue[8], ( this.landmarkarrayValue[0] + this.landmarkarrayValue[1] + this.landmarkarrayValue[2]+ this.landmarkarrayValue[3] + this.landmarkarrayValue[4] + this.landmarkarrayValue[5] + this.landmarkarrayValue[6] + this.landmarkarrayValue[7] + this.landmarkarrayValue[8] + this.landmarkarrayValue[9])).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.maplandmarks.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 1500 })
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

  #addRmarkersfirstToMap() {
    this.rmarkersfirstValue.forEach((marker) => {
      const el = document.createElement('div');
      el.className = 'first';
      new mapboxgl.Marker(el)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #addRmarkersyachtToMap() {
    this.rmarkersyachtValue.forEach((marker) => {
      const el = document.createElement('div');
      el.className = 'markeryacht';
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
