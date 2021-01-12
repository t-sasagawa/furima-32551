const pay = () => {
  Payjp.setPublicKey("pk_test_******************"); // PAY.JPテスト公開鍵(仮設置)
  // console.log("カード情報トークン化のためのJavaScript");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    // console.log("フォーム送信時にイベント発火")

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shipping_order[number]"),
      cvc: formData.get("shipping_order[cvc]"),
      exp_month: formData.get("shipping_order[exp_month]"),
      exp_year: `20${formData.get("shipping_order[exp_year]")}`,
    };

  });
};

window.addEventListener("load", pay);