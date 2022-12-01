import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-method"
export default class extends Controller {
  static targets = ["button", "form"]

  displayForm() {
    this.buttonTarget.classList.add("d-none")
    this.formTarget.style.display = "block"
  }
}
