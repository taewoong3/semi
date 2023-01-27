const todoForm = document.querySelector("#todo-form");
const todoInput = document.querySelector("#todo-form input");
const todoList = document.querySelector("#todo-list");

const TODOS_KEY = "todos";

let toDos = [];

function saveToDo() {
  localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
}

function deleteToDo(event) {
  const li = event.target.parentElement;
  toDos = toDos.filter((todo) => todo.id !== parseInt(li.id));
  li.remove();
  saveToDo();
}

function paintToDo(newToDo) {
  const li = document.createElement("li");
  li.id = newToDo.id;
  const button = document.createElement("button");
  const span = document.createElement("span");
  span.innerText = newToDo.text;
  button.innerText = "❌";
  button.addEventListener("click", deleteToDo);
  li.appendChild(button);
  li.appendChild(span);
  todoList.appendChild(li);
}

function onToDoSubmit(event) {
  event.preventDefault();
  const newToDo = todoInput.value;
  todoInput.value = "";
  const newToDoObj = {
    text: newToDo,
    id: Date.now(),
  };
  toDos.push(newToDoObj);
  paintToDo(newToDoObj);
  saveToDo();
}

todoForm.addEventListener("submit", onToDoSubmit);

const savedToDo = localStorage.getItem(TODOS_KEY);

if (savedToDo !== null) {
  const parsedToDo = JSON.parse(savedToDo);
  toDos = parsedToDo;
  parsedToDo.forEach(paintToDo);
}
