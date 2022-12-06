import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="likes"
export default class extends Controller {

  static targets = ["like", "counter", "form", "delete", "formWrapper"]
  update(event) {
    event.preventDefault()
    const token = document.querySelector('meta[name="csrf-token"]').content
    if (this.hasDeleteTarget) {
      this.likeTarget.classList.remove('red')
      this.counterTarget.innerText = parseInt(this.counterTarget.innerText) - 1
      fetch(this.deleteTarget.innerText, {
        method: "DELETE",
        headers: { "Accept": "application/json", "X-CSRF-Token": token },
      })
        .then(response => response.json())
        .then((data) => {
          console.log("Deleted bookmark", data)
          this.formWrapperTarget.innerHTML = data.form
        })

    } else {
      this.likeTarget.classList.add('red')
      this.counterTarget.innerText = parseInt(this.counterTarget.innerText) + 1
        fetch(this.formTarget.action, {
          method: this.formTarget.method,
          headers: { "Accept": "application/json" },
          body: new FormData(this.formTarget)
        })
          .then(response => response.json())
          .then((data) => {
            console.log("Created bookmark", data)
            this.formWrapperTarget.innerHTML = data.form
          })
      }
    }

}
