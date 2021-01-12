const pay = () => {
  Payjp.setPublicKey("pk_test_******************"); // PAY.JPテスト公開鍵(仮設置)
  // console.log("カード情報トークン化のためのJavaScript");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    // console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("load", pay);