import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {

    flatpickr(this.element,
      {
        minDate: "today",
        dateFormat: "Y-m-d",
        OnClose: function(selectedDates, dateStr,instance) {
          let daysInRange = document.getElementById("date")
          let daysLengthTotal = daysInRange.length + 1;
          console.log(daysLengthTotal)
          console.log(selectedDates)
        }
      }
    )
                }
  }
