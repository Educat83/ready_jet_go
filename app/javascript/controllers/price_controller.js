import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["hours", "totalprice"]
  connect() {
    console.log("connected")
    console.log(this.hoursTarget.innerHTML)
    console.log(this.totalpriceTarget.innerHTML)
  }
}
