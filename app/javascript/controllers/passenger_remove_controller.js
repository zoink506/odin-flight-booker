import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  remove() {
    console.log("passenger-remove#remove() called");
    console.log(this.element);

    const divs = document.querySelectorAll("#templates > .sub-form-div");
    console.log(divs);
    
    if(divs.length >= 2) {
      this.element.remove();
    }
  }
}