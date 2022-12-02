import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal-form"
export default class extends Controller {
  static targets = ["button", "form"]

  displayForm() {
    this.buttonTarget.classList.add("d-none")
    this.formTarget.ClassList.remove("d-none")
  }
}
