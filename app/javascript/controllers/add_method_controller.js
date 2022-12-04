import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-method"
export default class extends Controller {
  static targets = ["button", "form", "button2", "form2", "routes", "title"]

  displayForm() {
    this.buttonTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")

  }

  // Used in new routes page
  displayForm2() {
    this.button2Target.classList.add("d-none")
    this.form2Target.classList.remove("d-none")
    this.routesTarget.classList.add("d-none")
    this.titleTarget.classList.add("d-none")
  }
}
