import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.index = this.containerTarget.children.length
  }

  add() {
    fetch(`/expertises/new_field?index=${this.index}`)
      .then(response => response.text())
      .then(html => {
        this.containerTarget.insertAdjacentHTML("beforeend", html)
        this.index++
      })
  }
}
