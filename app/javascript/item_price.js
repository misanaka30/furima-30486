
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
     console.log(inputValue);

    const fee = document.getElementById("add-tax-price");
    fee.innerHTML = (Math.floor(inputValue*0.1));
    console.log(fee.innerHTML);

    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputValue-fee.innerHTML));
    console.log(profit.innerHTML);
  })
    
  });