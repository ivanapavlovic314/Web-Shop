<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kasa</title>
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
                    <li><a href="${pageContext.request.contextPath}/proizvodi" >Katalog proizvoda</a></li>
                </ul>
            </div>
            <h1>DOBRODOSLI NA KASU</h1>


            <div id="previewstr" >

                <!-- Placeholder za FORMULAR -->
                <div id="formular" >
                   
                    <form class="kasa" action="potvrdaKupovine" method="post">

                        <fieldset class="kasa">
                            <table class="tabela" id="kasa-tabela">
                                <thead>
                                    <tr>
                                        <th>Artikli</th>
                                        <th>Naziv</th>
                                        <th>Cena [RSD]</th>

                                        <th>Kolicina</th>

                                        <th>[RSD]</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="ukupanRacun" value="${0}"/>
                                    <c:forEach var="proizvod" items="${proizvodi}" varStatus="status">

                                        <c:set var="ukupanRacun" value="${ukupanRacun + proizvod.cena * komada[status.index]}"/>
                                        <tr>
                                            <td>
                                               ${status.index+1}
                                                <input  type="checkbox" name="artikal" value="${proizvod.id}" checked="true" 
                                                        hidden="true">
                                            </td>

                                            <td>
                                                <c:out value="${proizvod.naziv}" />
                                            </td>
                                            <td>
                                                <c:out value="${proizvod.cena}" />
                                            </td>

                                            <td>
                                                <label><c:out value="${komada[status.index]}"/></label>
                                                <input hidden="true" id="${proizvod.id}" name="kom" type="number" step="1"  min="1" max="10" 
                                                       value="<c:out value="${komada[status.index]}" />">
                                            </td>
                                            <td>
                                            
                                                <fmt:formatNumber type="number" value="${proizvod.cena * komada[status.index]}" maxFractionDigits="2"/>

                                            </td>


                                        </tr>
                                    </c:forEach>


                                    <!-- } -->
                                </tbody>

                            </table>
                        </fieldset>
                        <fieldset class="kasa">
                            <label id="iznosRacuna">
                                UKUPAN IZNOS : 

                                <input name="iznosRacuna" value="${ukupanRacun}" type="hidden">
                                <fmt:formatNumber type="number" value="${ukupanRacun}" maxFractionDigits="2"/> RSD
                            </label>
                        </fieldset>
                            
                        <br>
                        <br>
                        
                        <fieldset class="kasa">

                            <select id="kupac" name='kupac' required>
                                <option value="">Izaberi kupca:</option>
                                <c:forEach items="${kupci}" var="kupac">

                                    <option value="${kupac.id}">${kupac}</option>

                                </c:forEach>
                            </select>

                        </fieldset>
                        <br><br>
                        <input id="kasa-a" type="submit" value="POTVRDI PORUDZBINU"> 
                    </form>  

                </div>
            </div>

        </div>
        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>


    </body>
</html>
