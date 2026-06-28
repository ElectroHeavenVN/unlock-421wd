function slItemClick(item) {
    /* skip disabled items */
    if (item.classList.contains("disabled")) {
        return;
    }
    /* When an item is clicked, update the original select box,
    and the selected item: */
    var y, i, k, s, h, sl, yl, a;
    a = item.parentNode.parentNode;
    s = a.getElementsByTagName("select")[0];
    sl = s.length;
    h = a.getElementsByClassName("select-selected")[0];;

    i = Array.from(item.parentNode.children).indexOf(item); //index of selected elment
    if (i >= 0) {
        s.selectedIndex = i;
        h.innerHTML = item.innerHTML;
        y = item.parentNode.getElementsByClassName("same-as-selected");
        yl = y.length;
        for (k = yl - 1; k >= 0; k--) {
            y[k].removeAttribute("class");
        }
        item.setAttribute("class", "same-as-selected");
    }
    h.click();
    s.onchange();
}

function generate_cs(Elmnt) {
    var x, j, ll, selElmnt, a, b, c; 
    selElmnt = Elmnt.getElementsByTagName("select")[0];
    ll = selElmnt.length;
    /* For each element, create a new DIV that will act as the selected item: */
    if (selElmnt.options.length == 0) {
        return;
    }
    a = document.createElement("DIV");
    a.setAttribute("class", "select-selected");
    a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
    Elmnt.appendChild(a);
    /* For each element, create a new DIV that will contain the option list: */
    b = document.createElement("DIV");
    b.setAttribute("class", "select-items select-hide");
    for (j = 0; j < ll; j++) {
        /* For each option in the original select element,
        create a new DIV that will act as an option item: */
        c = document.createElement("DIV");
        c.innerHTML = selElmnt.options[j].innerHTML;
        if (selElmnt.options[j].selected) {
            c.setAttribute("class", "same-as-selected");
        }
        if (selElmnt.options[j].disabled) {
            c.setAttribute("class", "disabled");
        }
        c.addEventListener("click", function(e) {
            slItemClick(this);
        });
        b.appendChild(c);
    }
    Elmnt.appendChild(b);
    a.addEventListener("click", function(e) {
        /* When the select box is clicked, close any other select boxes,
        and open/close the current select box: */
        if ((this.parentNode.classList.contains("select-disable") == false) && (this.parentNode.getElementsByTagName("select")[0].disabled == false))
        {
            e.stopPropagation();
            closeAllSelect(this);
            this.nextSibling.classList.toggle("select-hide");
            this.classList.toggle("select-arrow-active");
        }
    });
}

function closeAllSelect(elmnt) {
    /* A function that will close all select boxes in the document,
    except the current select box: */
    var x, y, i, xl, yl, arrNo = [];
    x = document.getElementsByClassName("select-items");
    y = document.getElementsByClassName("select-selected");
    xl = x.length;
    yl = y.length;
    for (i = 0; i < yl; i++) {
        if (elmnt == y[i]) {
            arrNo.push(i)
        }
        else {
            y[i].classList.remove("select-arrow-active");
        }
    }
    for (i = 0; i < xl; i++) {
        if (arrNo.indexOf(i)) {
            x[i].classList.add("select-hide");
        }
    }
}

/* Custom select method */
function cs_disable(sl_element) {
    $("#" + sl_element).parent().addClass("select-disable");
    $("#" + sl_element).prop("disabled", true);
}
function cs_enable(sl_element) {
    $("#" + sl_element).parent().removeClass("select-disable");
    $("#" + sl_element).prop("disabled", false);
}
function cs_disable_option(sl_element, index) {
    if (index >= $("#" + sl_element).children().length) {
        console.log("select index not existed.");
        return;
    }
    $("#" + sl_element).children().eq(index).prop("disabled",true);
    var cs_items = $("#" + sl_element).parent().children(".select-items");
    if (cs_items === undefined) {
        console.log("cs_items not found.");
        return;
    }
    if (index >= cs_items.children().length) {
        console.log("cs index not existed.");
        return;
    }
    cs_items.children().eq(index).addClass("disabled");
}
function cs_enable_option(sl_element, index) {
    if (index >= $("#" + sl_element).children().length) {
        console.log("select index not existed.");
        return;
    }
    $("#" + sl_element).children().eq(index).prop("disabled",false);
    var cs_items = $("#" + sl_element).parent().children(".select-items");
    if (cs_items === undefined) {
        console.log("cs_items not found.");
        return;
    }
    if (index >= cs_items.children().length) {
        console.log("cs index not existed.");
        return;
    }
    cs_items.children().eq(index).removeClass("disabled");
}
function cs_addoption(selItem,value,text,ifSelected) {
    for (var i = 0; i < selItem.length; i++) {
        if (selItem[i].value == value) {
            console.log("duplicatte")
            return;
        }
    }

    var option = document.createElement("option");
    option.innerHTML = text;
    option.value = value;
    option.selected = ifSelected;
    selItem.appendChild(option);
    var cs_div = selItem.parentNode;
    var items = cs_div.getElementsByClassName("select-items")[0];

    if (items === undefined) {
        generate_cs(cs_div);
        return;
    }
    var selected = cs_div.getElementsByClassName("select-selected")[0];

    var c = document.createElement("DIV");
    c.innerHTML = text;
    c.addEventListener("click", function(e) {
        slItemClick(this);
    });
    if ((ifSelected) || (selItem.length == 1)) {
        selected.innerHTML = text;
        for (var i = 0; i < items.childNodes.length; i++) {
            items.childNodes[i].removeAttribute("class");
        }
        c.setAttribute("class", "same-as-selected");
    }

    items.appendChild(c);
}
function cs_removeoption(selItem,index) {
    var cs_div = selItem.parentNode;
    var items = cs_div.getElementsByClassName("select-items")[0];
    var selected = cs_div.getElementsByClassName("select-selected")[0];
    if (cs_div === undefined) {
        return;
    }

    if (items === undefined) {
        return;
    }

    if (selItem[index] === undefined) {
        return;
    }
    var current_text = selItem[index].innerHTML;
    items.removeChild(items.childNodes[index]);
    if (selItem[index].selected) {
        if (selItem.length == 1) {
            selected.innerHTML = ""
        }
        else {
            if (index != 0) {
                selItem[0].selected;
                selected.innerHTML = selItem[0].innerHTML;
            }
            else {
                selItem[1].selected;
                selected.innerHTML = selItem[1].innerHTML;
            }
        }
    }
    selItem.removeChild(selItem.options[index]);
}

function cs_chooseoption(selItem,index) {
    if (index >= selItem.length) {
        return;
    }
    selItem.selectedIndex = index;
    var cs_div = selItem.parentNode;
    var items = cs_div.getElementsByClassName("select-items")[0];
    var selected = selItem.parentNode.getElementsByClassName("select-selected")[0];
    selected.innerHTML = selItem[index].innerHTML;
    for (var i = 0; i < items.childNodes.length; i++) {
        items.childNodes[i].removeAttribute("class");
    }
    items.childNodes[index].setAttribute("class", "same-as-selected");
}

function setSelect(sId,sValue) {
    var item;
    if (null == (item = getElById(sId)))
    {
        alert(sId + " is not existed" );
        return false;
    }
    
    for (var i = 0; i < item.options.length; i++) 
    {
        if (item.options[i].value == sValue)
        {
            if (item.parentNode.classList.contains("custom-select")) {
                cs_chooseoption(item,i);
            }
            else {
                item.selectedIndex = i;
            }
            return true;
        }
    }

    alert("the option which value is " + sValue + " is not existed in " + sId);
    return false;
}

/* Look for any elements with the class "custom-select": */
var x = document.getElementsByClassName("custom-select");
l = x.length;
for (var i = 0; i < l; i++) {
    generate_cs(x[i]);
}

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
document.addEventListener("click", closeAllSelect);

$(document).ready(function() {
    $('.nav-link-collapse').on('click', function() {
        $('.nav-link-collapse').not(this).removeClass('nav-link-show');
        $(this).toggleClass('nav-link-show');
    });

    logout_timer_run(timeout);
});


$(".toggle-switch>input[type=checkbox]").each(function(){
    this.value = (+(this.checked));
});

$(".toggle-switch>input[type=checkbox]").change(function(){
    this.value = (+(this.checked));
});

/* Handler for password */
$(".show-password-btn>a").on('click', function(event) {
    event.preventDefault();
    a = this.parentNode.parentNode.getElementsByTagName("input")[0];
    b = this.getElementsByTagName("i")[0];
    if (a.type == "text") {
        a.type = "password";
        b.classList.add("fa-eye-slash");
        b.classList.remove("fa-eye");
    }
    else {
        a.type = "text";
        b.classList.add("fa-eye");
        b.classList.remove("fa-eye-slash");
    }
});

function htmlDecode(input) {
    var doc = new DOMParser().parseFromString(input, "text/html");
    return doc.documentElement.textContent;
}