

const eventStart = document.querySelector('#booking_event_start');
const eventEnd = document.querySelector('#booking_event_end');

let start = "";
eventStart.addEventListener('blur', (event) => {
  start = event.target.value;
  let dateStart = new Date(start);

  calculatePrice(dateStart, end);
});

let end = "";
eventEnd.addEventListener('blur', (event) => {
  end = event.target.value;
  let dateEnd = new Date(end);

  calculatePrice(dateEnd, start);
})

const priceDiv = document.querySelector('.total-price');
const priceValue = priceDiv.dataset.price;

function calculatePrice(initDate, newTime) {
  if (newTime !== undefined) {
    let newDate = new Date(newTime);
    let totalTime = Math.abs((initDate - newDate) / 3600000);
    let totalPrice = totalTime * priceValue;
    priceDiv.innerHTML = `<p><b>Total price:</b> $${totalPrice}</p>`;
  }
}
