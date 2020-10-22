
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;


    const fee = document.getElementById("add-tax-price");
    fee.innerHTML = (Math.floor(inputValue*0.1));
  

    const profit = document.getElementById("profit");
    profit.innerHTML = (Math.floor(inputValue-fee.innerHTML ));
    
  })
    
  });