const eventStart = document.querySelector('#booking_event_start');
const eventEnd = document.querySelector('#booking_event_end');

let start = undefined;
let end = undefined;

eventStart.addEventListener('change', (event) => {
  start = event.target.value;
  let dateStart = new Date(start);

  calculatePrice(dateStart, end);
  flatpickr(".datepicker_end", { allowInput: true, enableTime: true, minDate: dateStart })
});

eventEnd.addEventListener('change', (event) => {
  console.log(event);
  console.log(event.target);
  end = event.target.value;
  console.log(end);
  let dateEnd = new Date(end);

  calculatePrice(dateEnd, start);
})

const priceDiv = document.querySelector('.total-price');
const priceValue = priceDiv.dataset.price;

function calculatePrice(initDate, newTime) {
  if (newTime !== undefined) {
    let newDate = new Date(newTime);
    let totalTime = Math.abs((initDate - newDate) / 3600000);
    let totalPrice = Math.round(totalTime * priceValue * 100) / 100;
    console.log(totalPrice);
    priceDiv.innerHTML = `<p><b>TOTAL:</b> $${totalPrice}</p>`;
  }
}
