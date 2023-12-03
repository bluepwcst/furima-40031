window.addEventListener('turbo:load', () => {
  console.log("OK");
});
// app/javascript/packs/price_calculation.js
// 金額を入力する要素
const priceInput = document.getElementById("item-price");

// 販売手数料を表示する要素
const addTaxPrice = document.getElementById("add-tax-price");

// 販売利益を表示する要素
const profit = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const price = priceInput.value; // 入力された金額を取得
  if(price >= 300 && price <= 9999999){
    const taxRate = 0.1; // 販売手数料率（10%の場合）
    const tax = Math.floor(price * taxRate); // 販売手数料を計算（小数点以下切り捨て）
    const profitAmount = price - tax; // 販売利益を計算
    addTaxPrice.textContent = tax; // 販売手数料を表示
    profit.textContent = profitAmount; // 販売利益を表示
  }
  console.log("イベント発火");
});
