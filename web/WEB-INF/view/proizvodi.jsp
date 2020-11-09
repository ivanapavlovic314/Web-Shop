<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proizvodi</title>
        <link rel="stylesheet" type="text/css" href="./css/styles.css"/>
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
                    <li><a class="active" href="${pageContext.request.contextPath}/proizvodi" >Katalog proizvoda</a></li>
                </ul>
            </div>

            <div id="previewstr" >
                <div id="tabele-a">
                    <a class="btn" href="<%=request.getContextPath()%>/noviProizvod">UNOS NOVOG PROIZVODA</a>
                </div>

                <!-- Placeholder za tabelu -->

                <table class="tabela">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Naziv</th>
                            <th>Cena [RSD]</th>
                            <th>Opis</th>
                            <th>Stanje na lageru</th>
                            <th>Vrsta proizvoda</th>

                            <th>Obrada podataka</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="proizvod" items="${proizvodi}">

                            <tr>
                                <td>
                                    <c:out value="${proizvod.id}" />
                                </td>
                                <td>
                                    <c:out value="${proizvod.naziv}" />
                                </td>
                                <td>
                                    <c:out value="${proizvod.cena}" />
                                </td>
                                <td>
                                    <c:out value="${proizvod.opis}" />
                                </td>
                                <td>
                                    <c:out value="${proizvod.lager}" />
                                </td>
                                <td>
                                    <c:out value="${proizvod.kategorija}" />
                                </td>

                                <td><a href="izmenaProizvoda?id=<c:out value='${proizvod.id}'/>">Izmeni</a> <a href="brisanjeProizvoda?id=<c:out value='${proizvod.id}' />">Obrisi</a></td>
                            </tr>
                        </c:forEach>
                        <!-- } -->
                    </tbody>

                </table>

            </div>

        </div>

        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>


    </body>
</html>
