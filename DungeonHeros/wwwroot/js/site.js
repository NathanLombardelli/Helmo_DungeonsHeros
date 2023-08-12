
// gestion/creation de donjons //

function resetCount(id) {

    var data = document.getElementById(id).innerText;
    data = Number(0);
    document.getElementById(id).innerText = data;

    document.getElementById(id.replace("Counting", "ForceTotal")).innerText = (Number(document.getElementById(id.replace("Counting", "Force")).innerText) * Number(data));

    document.getElementById(id.replace("Counting", "CountingPost")).value = id.replace("Counting", ";") + Number(0); //la donnée qui sera Post.


    calculateLvL();

}


function increment(id) {
    var data = document.getElementById(id).innerText;
    data = Number(data) + 1;
    document.getElementById(id).innerText = data;

    document.getElementById(id.replace("Counting", "CountingPost")).value = id.replace("Counting", ";") + data; //la donnée qui sera Post.

    document.getElementById(id.replace("Counting", "ForceTotal")).innerText = (Number(document.getElementById(id.replace("Counting", "Force")).innerText) * Number(data));

    calculateLvL();
}


function decrement(id) {
    var data = document.getElementById(id).innerText;
    if (data != 0) {
        data = data - 1;
        document.getElementById(id).innerText = data;

        document.getElementById(id.replace("Counting", "CountingPost")).value = id.replace("Counting", ";") + data; //la donnée qui sera Post.

        document.getElementById(id.replace("Counting", "ForceTotal")).innerText = (Number(document.getElementById(id.replace("Counting", "Force")).innerText) * Number(data));
    }

    calculateLvL();

}

function calculateLvL() {

    var lvl = 0;
    var x = document.querySelectorAll('[id*="ForceTotal"]');
    for (var i = 0; i < x.length; i++) {
        console.log(x[i].innerHTML);
        lvl = lvl + Number(x[i].innerHTML);
    }

    document.getElementById("Lvl").innerText = lvl;
    document.getElementById("LvlDj").value = lvl; //la donnée qui sera Post.
}



// Creation de Hero //

document.getElementById('ForceHero').addEventListener('change', function () {
    var totalValue = Number(document.getElementById('EnduranceHero').value) + Number(this.value);
    if (totalValue > 7) {
        this.value = this.value - 1;
    }
});

document.getElementById('EnduranceHero').addEventListener('change', function () {
    var totalValue = Number(document.getElementById('ForceHero').value) + Number(this.value);
    if (totalValue > 7) {
        this.value = this.value - 1;
    }
});




