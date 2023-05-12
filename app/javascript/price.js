window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
  const addTaxDom1 = document.getElementById("profit");
    addTaxDom1.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
  })
})