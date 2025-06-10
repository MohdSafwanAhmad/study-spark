document.addEventListener("DOMContentLoaded", () => {
  const buttons = document.querySelectorAll(".btn-warning");

  buttons.forEach((btn) => {
    btn.addEventListener("click", () => {
      alert("Welcome to StudySpark!");
    });
  });
});
