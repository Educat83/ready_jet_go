import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["totalprice"]
  static values = {
    price: String
  }
  connect() {
  }

  counter(event) {
    const hours = parseInt(event.srcElement.value);
    const fh_price = parseInt(this.priceValue);
    const total_price = hours * fh_price;
    this.totalpriceTarget.innerText=total_price;
  }
}
