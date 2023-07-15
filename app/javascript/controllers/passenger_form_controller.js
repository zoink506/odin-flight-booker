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
    // templates[0].content.querySelector("div.sub-form-div").isEqualNode(divs[0])

    console.log("new passenger function");
    const ediv = document.getElementById("passengers-section");
    const existingDivs = ediv.querySelectorAll("div.sub-form-div");
    const templates = ediv.querySelectorAll("template");
    const templateSection = document.getElementById("templates");

    console.log(existingDivs);

    // ruby pseudocode
    // divs = ...
    // templates.each do |template|
    //   if !divs.any? { |div| div == template }
    //     divs >> template
    //     break;
    //   end
    // end

    if(existingDivs.length < 4) {
      const existingDivsArr = Array.from(existingDivs);
      console.log(existingDivsArr);

      for(let j = 0; j < templates.length; j++) {
        const template = templates[j];

        console.log(template.content.querySelector("div.sub-form-div"))
        //existingDivsArr.forEach(div => { console.log(div); console.log(template.content.querySelector("div.sub-form-div").isEqualNode(div)) })
        let templateFound = false;

        for(let i = 0; i < existingDivs.length; i++) {
          const div = existingDivs[i];

          console.log(div);
          console.log(template.content.querySelector("div.sub-form-div").isEqualNode(div))
          if(template.content.querySelector("div.sub-form-div").isEqualNode(div)) {
            templateFound = true;
          }
        }

        if( templateFound === false ) {
          templateSection.appendChild(template.content.cloneNode(true));
          return;
        }
      }
    }

  }
}
