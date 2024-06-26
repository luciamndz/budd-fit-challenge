import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-challenges"
export default class extends Controller {
  static targets = ["form", "list", "input"]
  connect() {
    console.log(this.formTarget)
    console.log(this.inputTarget)
    console.log(this.listTarget)
  }

  update() {
    console.log("hello there")
    const query = `?query=${this.inputTarget.value}`
    console.log(query)
    fetch( query, {
      headers: { Accept: "text/plain" }
    })
    .then(response => response.text())
    .then(data => (this.listTarget.outerHTML = data))
  }
}
