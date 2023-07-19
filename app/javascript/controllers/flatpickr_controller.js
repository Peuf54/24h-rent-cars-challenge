import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static values = {
    array: Array,
    pricePerDay: Number
  }

  connect() {
    flatpickr(this.element, {
      mode: 'range',
      enableTime: true,
      time_24hr: true,
      minDate: "today",
      disable: this.arrayValue,
      onClose: () => {
        var dateRange = this.element.value.split(" to ");
        var startDate = dateRange[0];
        var endDate = dateRange[1];

        var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };

        document.getElementById("starts_at").value = startDate;
        document.getElementById("ends_at").value = endDate;
        document.getElementById("from-label").innerHTML = `From <b>${new Date(startDate).toLocaleString('en-US', options)}</b>`;
        document.getElementById("to-label").innerHTML = `To <b>${new Date(endDate).toLocaleString('en-US', options)}</b>`;
        document.getElementById("recap-label").innerHTML = `${this.recapMaker(endDate, startDate)}`;
      }
    });
  }

  getDayNumber(endDate, startDate) {
    const seconds = (new Date(endDate) - new Date(startDate)) / 1000;
    const hours = seconds / 3600;
    const days = hours / 24;
    return days
  }

  recapMaker(endDate, startDate) {
    const totalDays = this.getDayNumber(endDate, startDate);
    const totalPrice = totalDays * this.pricePerDayValue;
    return `You'll book <b>${totalDays}</b> days, for <b>$${totalPrice}</b>`;
  }
}
