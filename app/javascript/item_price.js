const fee = ()=> {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (priceInput){
    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        const addTaxValue = Math.floor(inputValue * 0.1);
        const profitValue = Math.floor(inputValue * 0.9);
        if (300 <= inputValue && inputValue <= 9999999){
          addTaxDom.innerHTML = addTaxValue;
          profitDom.innerHTML = profitValue;
        }else{
          addTaxDom.innerHTML = "-";
          profitDom.innerHTML = "-";
        }
    })
  }
}

window.addEventListener("turbolinks:load", fee);