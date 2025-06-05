document.addEventListener("DOMContentLoaded", () => {
  const addBtn = document.getElementById("add-expertise-btn");
  const container = document.getElementById("expertises-container");
  const template = document.getElementById("expertise-template");

  if (!addBtn || !container || !template) return;

  let index = container.children.length;

  addBtn.addEventListener("click", () => {
    const newFields = template.innerHTML.replace(/INDEX/g, index);
    container.insertAdjacentHTML("beforeend", newFields);
    index++;
  });
});
