// landing.js

document.addEventListener("DOMContentLoaded", () => {
  const nav = document.querySelector(".glass-nav");

  // Add/remove the 'scrolled' class when page scroll passes 50px
  window.addEventListener("scroll", () => {
    if (window.scrollY > 50) {
      nav.classList.add("scrolled");
    } else {
      nav.classList.remove("scrolled");
    }
  });
});
