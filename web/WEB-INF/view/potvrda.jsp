<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css"/> 

        <title>Potvrda kupovine</title>
    </head>
    <body>
        <div id="main">

            <div id="header">
                <a class="header" href="${pageContext.request.contextPath}">
                    <img src="img/logowp.png" id="logo" alt="WP logo" />
                </a>


            </div>

            <div id="navBar">
                <ul class="linkovi">
                    <li><a href="${pageContext.request.contextPath}/kupci" >Pregled kupaca</a></li>
                    <li><a href="${pageContext.request.contextPath}/promet" >Pregled prometa</a></li>
                    <li><a href="${pageContext.request.contextPath}/proizvodi" >Katalog proizvoda</a></li>
                </ul>
            </div>

            <div id="potvrda">

                <h1>Kupovina ${brkupovine} uspesno izvrsena!</h1>
                <br>
                <br>

                <h1>HVALA VAM! DODJITE NAM OPET</h1>
                <br>
                <a id="potvrda-a" href="${pageContext.request.contextPath}">POVRATAK NA HOMEPAGE</a>

            </div>
        </div>

        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>


    </body>
</html>
