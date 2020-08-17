
/*!
 * Common js script
 */

 /*!
 * Global Variables
 */
var statusArr = ["Unsorted", "OnProcess", "Current", "Finished", "GiveUp", "", "LookBack", "Complete", "", "Regular"];
var sortedArr = ["Unsorted", "Event", "Person", "Collection", "Achievement"];

function formatDate(date, format) {
    format = format.replace(/yyyy/g, date.getFullYear());
    format = format.replace(/MM/g, ('0' + (date.getMonth() + 1)).slice(-2));
    format = format.replace(/dd/g, ('0' + date.getDate()).slice(-2));
    return format;
}

 /*!
 * Common Functions
 */
function chgDate(days) {
      var date = new Date(document.getElementById("targetDate").value);
      date.setDate(date.getDate() + days);
      var formatedDate = formatDate(date, "yyyy-MM-dd");
      //var formatDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
      document.getElementById("targetDate").value = formatedDate;
      chgDateForm.submit();
}

function chgMonth(months) {
    var date = new Date(document.getElementById("targetDate").value);
    date.setMonth(date.getMonth() + months);
    var year = date.getFullYear();
    var mon = date.getMonth();
    var end = new Date(year, mon + 1, 0).getDate(); // 获取本月最后一天

    var formatedDate = formatDate(date, "yyyy-MM-dd");
    var formatedStart = formatDate(new Date(year, mon, 1), "yyyy-MM-dd");
    var formatedEnd = formatDate(new Date(year, mon, end), "yyyy-MM-dd");
    //var formatDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    document.getElementById("targetDate").value = formatedDate;
    document.getElementById("startDate").value = formatedStart;
    document.getElementById("endDate").value = formatedEnd;
    chgDateForm.submit();
}

function chgPeriod(days) {
    var start = new Date(document.getElementById("startDate").value);
    var end = new Date(document.getElementById("endDate").value);
    start.setDate(start.getDate() + days);
    var formatedDate = formatDate(date, "yyyy-MM-dd");
    //var formatDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    document.getElementById("targetDate").value = formatedDate;
    chgDateForm.submit();
}

function totalCalc() {
    var list = document.getElementsByClassName("time");
    var total = 0.0;
    for(n=0; n<list.length; n++)
    {
        try {
            var t = parseFloat(list[n].value) ;
            if(!isNaN(t))
                total += t;
        } catch (error) {
        }
    }

    document.getElementById("totaltime").innerHTML = total;
}

function convertCat(str) {
    var res = document.getElementById(str);
    return res.innerText;
}

function convertStatus(str) {
    // return str.replace(/[Ａ-Ｚａ-ｚ０-９]/g, function(s) {
    //     return String.fromCharCode(s.charCodeAt(0)-0xFEE0);
    // });
    var s = str;
    var idx = parseInt(str);
    try {
        if(!isNaN(idx)) {
            var tmp = statusArr[idx];
            if(typeof(tmp) != "undefined")
                s = tmp;
        }
    } catch (error) {
    }

    // switch(str)
    // {
    //     case "1": 
    //         s = "OnProcess";
    //         break;
    //     case "2":
    //         s = "Current";
    //         break;
    //     case "3": 
    //         s = "Finished";
    //         break;
    //     case "4":
    //         s = "GiveUp";
    //         break;
    //     case "6":
    //         s = "LookBack";
    //         break;
    //     case "7": 
    //         s = "Complete";
    //         break;
    //     case "9":
    //         s = "Regular";
    //         break;   
    //     default:
    //         s = str;
    //         break;
    // }

    return s;
}

function convertSorted(str) {
    var s = str;
    var idx = parseInt(str);
    try {
        if(!isNaN(idx)) {
            var tmp = sortedArr[idx];
            if(typeof(tmp) != "undefined")
                s = tmp;
        }
    } catch (error) {
    }
    return s;
}


function convertTime(str) {
    // return str.replace(/[Ａ-Ｚａ-ｚ０-９]/g, function(s) {
    //     return String.fromCharCode(s.charCodeAt(0)-0xFEE0);
    // });
    var time = 0.0;
    var cnt = 1.0;
    if(str.length == 2)
    {
        cnt = parseFloat(str.substr(0,1));
        str = str.substr(1,1);
    }
    if (str == "h" || str == "H")
    {
        time = 0.5 * cnt;
    }
    else if (str == "q" || str == "Q")
    {
        time = 0.25 * cnt;
    }
    else if (str == "t" || str == "T")
    {
        time = 0.1 * cnt;
    }
    if(time != 0.0)
    {
        return String(time);
    }
    return str;
}

$(function() {
    $('.category').on('blur', function() {
        var str = $(this).val();
        $(this).val(convertCat(str));
    });
});

$(function() {
    $('.status').on('blur', function() {
        var str = $(this).val();
        $(this).val(convertStatus(str));
    });
});

$(function() {
    $('.sorted').on('blur', function() {
        var str = $(this).val();
        $(this).val(convertSorted(str));
    });
});

$(function() {
    $('.time').on('blur', function() {
        var str = $(this).val();
        $(this).val(convertTime(str));
        totalCalc();
    });
});


/*!
 * catlist show
 */
$(document).ready(function(e) {
    $(".showcatlist").click(function(e) {
        $(".catlist").toggle();
        return false;
    });
});