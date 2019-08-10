<%-- 
    Document   : javascript_timer
    Created on : Mar 23, 2017, 5:14:56 AM
    Author     : Vinayak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>

            function startTimer(duration, display) {
                var timer = duration, minutes, seconds;
                setInterval(function () {
                    minutes = parseInt(timer / 60, 10);
                    seconds = parseInt(timer % 60, 10);

                    minutes = minutes < 10 ? "0" + minutes : minutes;
                    seconds = seconds < 10 ? "0" + seconds : seconds;

                    document.getElementById("demo").innerHTML = minutes + ":" + seconds;

                    if (--timer < 0) {
                        timer = duration;
                     
                    }
                }, 1000);
            }

            window.onload = function () {
                var fiveMinutes = 5 * 1,
                        display = document.querySelector('#time');
                startTimer(fiveMinutes, display);
            };

        </script>
    </head>
    <body>
        <p id="demo"></p>
    </body>
</html>







try using this

<body>
  <div id="divCounter"></div>
    <script type="text/javascript">
    if(localStorage.getItem("counter")){
      if(localStorage.getItem("counter") >= 10){
        var value = 0;
      }else{
        var value = localStorage.getItem("counter");
      }
    }else{
      var value = 0;
    }
    document.getElementById('divCounter').innerHTML = value;

    var counter = function (){
      if(value >= 10){
        localStorage.setItem("counter", 0);
        value = 0;
      }else{
        value = parseInt(value)+1;
        localStorage.setItem("counter", value);
      }
      document.getElementById('divCounter').innerHTML = value;
    };

    var interval = setInterval(function (){counter();}, 1000);
  </script>
</body>

