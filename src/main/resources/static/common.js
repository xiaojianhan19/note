
/*!
 * Common js script
 */

 /*!
 * Global Variables
 */
var typeArr = ["Unsorted", "Person", "Event", "Collection", "Diagram"];
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
      var date = new Date(document.getElementById("date").value);
      date.setDate(date.getDate() + days);
      var formatedDate = formatDate(date, "yyyy-MM-dd");
      //var formatDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
      document.getElementById("date").value = formatedDate;
      chgDateForm.submit();
}

function chgMonth(months) {
    var date = new Date(document.getElementById("date").value);
    date.setMonth(date.getMonth() + months);
    var year = date.getFullYear();
    var mon = date.getMonth();
    var end = new Date(year, mon + 1, 0).getDate(); // 获取本月最后一天

    var formatedDate = formatDate(date, "yyyy-MM-dd");
    var formatedStart = formatDate(new Date(year, mon, 1), "yyyy-MM-dd");
    var formatedEnd = formatDate(new Date(year, mon, end), "yyyy-MM-dd");
    //var formatDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    document.getElementById("date").value = formatedDate;
    document.getElementById("start").value = formatedStart;
    document.getElementById("end").value = formatedEnd;
    chgDateForm.submit();
}

function chgPeriod(days) {
    var start = new Date(document.getElementById("start").value);
    var end = new Date(document.getElementById("end").value);
    start.setDate(start.getDate() + days);
    var formatedDate = formatDate(date, "yyyy-MM-dd");
    //var formatDate = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    document.getElementById("date").value = formatedDate;
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
    total = Math.round(total * 100) / 100;
    document.getElementById("totaltime").innerHTML = total;
}

function convertType(str) {
    var s = str;
    var idx = parseInt(str);
    try {
        if(!isNaN(idx)) {
            var tmp = typeArr[idx];
            if(typeof(tmp) != "undefined")
                s = tmp;
        }
    } catch (error) {
    }
    return s;
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
    var subStr = str;
    if(str.length == 2)
    {
        cnt = parseFloat(str.substr(0,1));
        subStr = str.substr(1,1);
    }
    if (subStr == "h" || subStr == "H")
    {
        time = 0.5 * cnt;
    }
    else if (subStr == "q" || subStr == "Q")
    {
        time = 0.25 * cnt;
    }
    else if (subStr == "t" || subStr == "T")
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
    $('.type').on('blur', function() {
        var str = $(this).val();
        $(this).val(convertType(str));
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


function waterFall() {
      
    var items = document.getElementsByClassName('item');
    //定义间隙10像素
    var gap = 10;
    //首先确定列数 = 页面的宽度 / 图片的宽度
    var pageWidth = getClient().width;
    var itemWidth = items[0].offsetWidth;
    var columns = parseInt(pageWidth / (itemWidth + gap));
    var arr = [];//定义一个数组，用来存储元素的高度
    for(var i = 0;i < items.length; i++){
        if(i < columns) {
            //满足这个条件则说明在第一行，文章里面有提到
            items[i].style.top = 0;
            items[i].style.left = (itemWidth + gap) * i + 'px';
            arr.push(items[i].offsetHeight);
        }else {
            //其他行，先找出最小高度列，和索引
            //假设最小高度是第一个元素
            var minHeight = arr[0];
            var index = 0;
            for(var j = 0; j < arr.length; j++){//找出最小高度
               if(minHeight > arr[j]){
                   minHeight = arr[j];
                   index = j;
               } 
            }
            //设置下一行的第一个盒子的位置
            //top值就是最小列的高度+gap
            items[i].style.top = arr[index] + gap + 'px';
            items[i].style.left = items[index].offsetLeft + 'px';

            //修改最小列的高度
            //最小列的高度 = 当前自己的高度 + 拼接过来的高度 + 间隙的高度
            arr[index] = arr[index] + items[i].offsetHeight + gap;
        }
    }
}

  // clientWidth 处理兼容性
  function getClient() {
      return {
          width: window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
          height: window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight
      }
  }
  // scrollTop兼容性处理
  function getScrollTop() {
      return window.pageYOffset || document.documentElement.scrollTop;
  }