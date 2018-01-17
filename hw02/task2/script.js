var num = 10;
var heading = document.getElementById("heading");
function buttonAlert() {
    alert(num);
}
function increaseNum() {
    num += 1;
    heading.innerHTML = num;
}
function addPar() {
    var body = document.body;
    var par = document.createElement("P");
    par.innerHTML = num;
    body.appendChild(par);
}
var button1 = document.getElementById("popButtonAlert");
var button2 = document.getElementById("incNum");
var button3 = document.getElementById("newPar");
button1.addEventListener("click", buttonAlert); 
button2.addEventListener("click", increaseNum);		
button3.addEventListener("click", addPar);