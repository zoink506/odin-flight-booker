import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "newPassenger" ]

  connect() {
    // show the amount of passenger templates represented in the hidden field
    console.log(this.newPassengerTarget);
    console.log("passenger_form controller connected");
    let num_of_passengers = document.getElementById("booking_num_of_passengers").value;
    console.log(num_of_passengers);

    const ediv = document.getElementById("passengers-section");
    const templateSection = document.getElementById("templates");
    const templates = ediv.querySelectorAll("template");

    console.log(ediv.querySelectorAll("template"));

    for(let i = 0; i <= num_of_passengers-1; i++) {
      templateSection.appendChild(templates[i].content.cloneNode(true));
    }
  }

  new() {
    console.log("new passenger function");
  }
}
