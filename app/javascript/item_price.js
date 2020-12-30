window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  // console.log(priceInput);
  priceInput.addEventListener("input", () => {
    // console.log("イベント発火");
    const inputValue = priceInput.value;
    // console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price"); //販売手数料を表示する場所のid
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)); //入力した金額をもとに販売手数料を計算する処理
    // console.log(addTaxDom);
    const profitNumber = document.getElementById("profit")
      const value_result = inputValue * 0.1
      // console.log(value_result)
      profitNumber.innerHTML = (Math.floor(inputValue - value_result));
        // console.log(profitNumber);
  });
});