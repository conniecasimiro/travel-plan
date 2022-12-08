import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["address", "search"]


  revealMap() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })

    this.geocoder.addTo(this.searchTarget)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())

    const landmarkLocationElement = document.getElementsByClassName('landmark_location')[0]
    if (landmarkLocationElement) {
      const label2 = landmarkLocationElement.children[0]
      label2.style.marginBottom = '-14px'
      label2.style.fontSize = '22px'

    } else {
      const label = document.getElementById('new_route').children[2].querySelector(".form-label")
      label.style.fontSize = '22px'
      label.style.marginBottom = '-14px'
    }
  }
  disconnect() {
    this.geocoder.onRemove()
  }

  #setInputValue(event) {
    console.log("setting destination value")
    console.log(event)
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
