/**
 * Created by cretu on 12/7/2016.
 */

function close_window() {
    if (confirm("Close Window?")) {
        close();
    }
}
function openWindow() {
    window.open("https://android-arsenal.com/free");
}

function checkTime(i) {
    return (i < 10) ? "0" + i : i;
}

function startTime() {
    var today = new Date(),
        h = checkTime(today.getHours()),
        m = checkTime(today.getMinutes()),
        s = checkTime(today.getSeconds());
    document.getElementById('time').innerHTML = h + ":" + m + ":" + s;
    setTimeout(function () {
        startTime()
    }, 500);
}

function submitEmail() {

    var submitted = {
        email : document.getElementById("myText2").value,
        checkBox : document.getElementById("termAndCond").checked,
        checkBox2 : document.getElementById("myRadio2").checked,
        gender : null
    }

    if(submitted.checkBox)
        submitted.gender="student";
    else
        submitted.gender="not student";
    if(submitted.email!=null && submitted.checkBox == true)
    {
        var secondEmail = submitted.email.replace(submitted.email.charAt(0),'*');

        alert("Thanks for your subscription!\nYour email is " + secondEmail);
        appendChild(submitted.gender);
    }
    else if(submitted.checkBox == false)
    {
        alert("You must agree with the terms and conditions");
    }
    appendChild2(submitted.email);
    emailCounter();
}

function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

function changeSubmitButtonColor() {
    document.getElementById("surveySubmitButton").style.background=getRandomColor();
}

function loadFunction() {
    var el = document.getElementById("surveySubmitButton");
    el.addEventListener("mouseover",changeSubmitButtonColor, false);
    alertUserIfOffline();
    editCansas();
}

function appendChild(boy) {
    var t = document.createTextNode("You are a " +boy);
    document.body.appendChild(t);
    var btn = document.createElement("BUTTON");
    var t = document.createTextNode("Click here, " +boy);
    btn.appendChild(t);
    document.body.appendChild(btn);

}

function appendChild2(name)
{

    var node = document.createElement("LI");
    var textnode = document.createTextNode(name);
    node.appendChild(textnode);
    document.getElementById("myList").appendChild(node);
    /*var myNode = document.getElementById("Elements");
    var t = document.createTextNode("Good job!");
    myNode.appendChild(t);*/
}

function deleteChildren()
{
    var list = document.getElementById("myList");
    list.removeChild(list.childNodes[0]);
}
function deleteAll()
{
    var list = document.getElementById("myList");
    while(list.childNodes[0])
        list.removeChild(list.childNodes[0]);
    /*list.removeChild(list.childNodes[0]);
    var myNode = document.getElementById("Elements");
    while (myNode.firstChild) {
        myNode.removeChild(myNode.firstChild);
    }*/
}


function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
    //change class of an element
    document.getElementById("div1").className = "div2";
}

function emailCounter() {
    if(typeof(Storage) !== "undefined") {
        if (localStorage.emailcount) {
            localStorage.emailcount = Number(localStorage.emailcount)+1;
        } else {
            localStorage.emailcount = 1;
        }
        document.getElementById("result").innerHTML = "You have entered " +localStorage.emailcount+  " time(s) your emails ";
    } else {
        document.getElementById("result").innerHTML = "Sorry, your browser does not support web storage...";
    }
}

function  alertUserIfOffline() {
    setInterval(function(){ alert("Hello , are you still online?"); }, 333000);
}

function editCansas()
{
    var c = document.getElementById("myCanvas");
    var ctx = c.getContext("2d");
    ctx.font = "10px Arial";
    ctx.strokeText("Proof you are not a robot :",10,10);
}



