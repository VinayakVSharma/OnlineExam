<%-- 
    Document   : jquery
    Created on : 19 Jun, 2017, 3:47:24 PM
    Author     : Vinayak Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <script src="../js/plugins/jquery/jquery.min.js"></script>
        <script>
            var currFFZoom = 1;
            var currIEZoom = 100;

            function plus() {
                //alert('sad');
                var step = 0.02;
                currFFZoom += step;
                $('body').css('MozTransform', 'scale(' + currFFZoom + ')');
                var stepie = 2;
                currIEZoom += stepie;
                $('body').css('zoom', ' ' + currIEZoom + '%');

            }
            ;
            function minus() {
                //alert('sad');
                var step = 0.02;
                currFFZoom += step;
                $('body').css('MozTransform', 'scale(' + currFFZoom + ')');
                var stepie = 2;
                currIEZoom -= stepie;
                $('body').css('zoom', ' ' + currIEZoom + '%');
            }
            ;
            function reset() {
                //alert('sad');
                currFFZoom = 1;
                $('body').css('MozTransform', 'scale(' + currFFZoom + ')');
                currIEZoom = 100;
                $('body').css('zoom', ' ' + currIEZoom + '%');
            }
            ;
        </script>
    </head>
    <body>
        <!--zoom controls-->
        <input type="submit" onclick="minus()" value="------"/>
        <input type="submit" onclick="reset()" value="Reset"/>
        <input type="submit" onclick="plus()" value="++++++" />
    </body>
</html>