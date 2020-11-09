<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kupovina</title>
        <link rel="stylesheet" type="text/css" href="./css/styles.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


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


            <div id="previewstr" >

                <!-- Placeholder za tabelu -->
                <form name="zaKasu" action="kasa" method="get">
                    <table id="katalog" class="tabela">


                        <thead>

                            <c:forEach var="kategorija" items="${kategorije}">
                                <tr>
                                    <td class="kategorija" colspan="5">
                                        <c:out value="${kategorija}" />
                                    </td>
                                </tr>
                                <tr>

                                    <th>Naziv proizvoda</th>
                                    <th>Opis</th>
                                    <th>Cena [RSD]</th>

                                    <th>Kolicina [komada]:</th>
                                    <th>Za kasu:</th>

                                </tr>
                            </thead>
                            <c:forEach var="proizvod" items="${proizvodi}">
                                <c:if test="${proizvod.kategorija eq kategorija }">

                                    <tbody>
                                        <tr>

                                            <td>
                                                <c:out value="${proizvod.naziv}"/>
                                            </td>

                                            <td>
                                                <c:out value="${proizvod.opis}" />
                                            </td>
                                            <td>
                                                <c:out value="${proizvod.cena}" />
                                            </td>
                                            <td>
                                                <input class="kupovina-input" id="${proizvod.id}" name="kom" type="number" step="1" disabled="true" min="1" max="10" value="1">
                                            </td>
                                            <td>
                                                <input class="artikli" type="checkbox" name="artikal" value="${proizvod.id}" 
                                                       onchange="document.getElementById('${proizvod.id}').disabled = !this.checked;" >
                                            </td>


                                        </tr>         
                                    </c:if>
                                </c:forEach>
                            </c:forEach>


                            <!-- } -->
                        </tbody>

                    </table>

                    <input id="kasa-dugme" class="kasa-dugme" type="submit" value="KASA" hidden>

                </form>

            </div>

        </div>

        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>
        <script>
            

            $(".artikli").click(function () {
                $('.kasa-dugme').toggle($(".artikli:checked").length > 0);
            });
            
            
        </script>
    </body>
</html>
