
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Promet</title>
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
                    <li><a class="active" href="${pageContext.request.contextPath}/promet" >Pregled prometa</a></li>
                    <li><a href="${pageContext.request.contextPath}/proizvodi" >Katalog proizvoda</a></li>
                </ul>
            </div>

            

            <div id="previewstr" >

                <!-- Placeholder za tabelu -->
                <table class="tabela">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Iznos porudzbine [RSD]</th>
                            <th>Vreme porudzbine</th>
                            <th>Lista kupljenih proizvoda</th>
                            <th>Kupac ID</th>

                            <th>Obrada podataka</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="kupovina" items="${promet}">

                            <tr>
                                <td>
                                    <c:out value="${kupovina.id}" />
                                </td>
                                <td>
                                    <c:out value="${kupovina.iznos}" />
                                </td>
                                <td>
                                    <c:out value="${kupovina.vreme}" />
                                </td>
                                <td>
                                    <c:out value="${kupovina.listaProizvoda}" />
                                </td>
                                <td>
                                    <c:out value="${kupovina.kupac}" />
                                </td>

                                <td><a href="brisanjeKupovine?id=<c:out value='${kupovina.id}' />">Obrisi</a></td>
                            </tr>
                        </c:forEach>

                    </tbody>

                </table>
            </div>

        </div>


        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>


    </body>
</html>
