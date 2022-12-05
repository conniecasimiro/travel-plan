import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="likes"
export default class extends Controller {
  static targets = ["like", "counter", "form"]
  connect() {
    console.log(this.likeTarget)
    console.log(this.counterTarget)
  }

  update(event) {
    event.preventDefault()
    if (document.getElementsByClassName('red').length > 0) {
      this.likeTarget.classList.remove('red')
      this.counterTarget.innerText = parseInt(this.counterTarget.innerText) - 1
      // this.likeTarget.setAttribute("disabled", "")
      console.log(this.formTarget)

      fetch(this.formTarget.action, {
        method: this.formTarget.method,
        headers: { "Accept": "application/json" },
        body: new FormData(this.formTarget)
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
    } else {
      this.likeTarget.classList.add('red')
      this.counterTarget.innerText = parseInt(this.counterTarget.innerText) + 1
        // this.likeTarget.setAttribute("disabled", "")
        console.log(this.formTarget)

        fetch(this.formTarget.action, {
          method: this.formTarget.method,
          headers: { "Accept": "application/json" },
          body: new FormData(this.formTarget)
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
          })
      }
    }
}
