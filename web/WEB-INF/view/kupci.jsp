<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kupci</title>
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
                    <li><a class="active" href="${pageContext.request.contextPath}/kupci" >Pregled kupaca</a></li>
                    <li><a href="${pageContext.request.contextPath}/promet" >Pregled prometa</a></li>
                    <li><a href="${pageContext.request.contextPath}/proizvodi" >Katalog proizvoda</a></li>
                </ul>
            </div>
            
           
            <div id="previewstr" >
                <div id="tabele-a">
                <a class="btn" href="<%=request.getContextPath()%>/noviKupac">UNOS NOVOG KUPCA</a>
                </div>
                <!-- Placeholder za tabelu -->

                <table class="tabela">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ime</th>
                            <th>Prezime</th>
                            <th>E-mail</th>
                            <th>Telefon</th>
                            <th>Adresa</th>
                            <th>Grad</th>
                            <th>Vreme poslednje kupovine:</th>
                            <th>Obrada podataka</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="kupac" items="${kupci}">

                            <tr>
                                <td>
                                    <c:out value="${kupac.id}" />
                                </td>
                                <td>
                                    <c:out value="${kupac.ime}" />
                                </td>
                                <td>
                                    <c:out value="${kupac.prezime}" />
                                </td>
                                <td>
                                    <c:out value="${kupac.email}" />
                                </td>
                                <td>
                                    <c:out value="${kupac.telefon}" />
                                </td>
                                <td>
                                    <c:out value="${kupac.adresa}" />
                                </td>
                                <td>
                                    <c:out value="${kupac.grad}" />
                                </td>
                                <td>
                                    <c:out value="${kupac.pposeta}" />
                                </td>
                                <td><a href="izmenaKupca?id=<c:out value='${kupac.id}'/>">Izmeni</a> <a href="brisanjeKupca?id=<c:out value='${kupac.id}' />">Obrisi</a></td>
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
