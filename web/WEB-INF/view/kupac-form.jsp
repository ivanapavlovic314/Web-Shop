<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kupac - Formular</title>
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
            <h1>Formular</h1>

            <div id="previewstr" >

                <!-- Placeholder za FORMULAR -->
                <div id="formular" >
                    <c:if test="${kupac != null}">
                        <form action="azurirajKupca" method="post">
                        </c:if>

                        <c:if test="${kupac == null}">
                            <form action="sacuvajKupca" method="post">
                            </c:if>

                            <caption >
                                <h2 id="fs1">
                                    <c:if test="${kupac != null}">
                                        Edit Kupac
                                    </c:if>
                                    <c:if test="${kupac == null}">
                                        Dodaj novog kupca
                                    </c:if>
                                </h2>
                            </caption>

                            <c:if test="${kupac != null}">
                                <input class="unos" type="hidden" name="id" value="<c:out value='${kupac.id}' />" />
                            </c:if>

                            <fieldset >
                                <label class="opis"> Ime:</label> 
                                <input class="unos" type="text" value="<c:out value='${kupac.ime}' />" name="ime" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Prezime:</label>
                                <input class="unos" type="text" value="<c:out value='${kupac.prezime}' />" name="prezime" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">E-mail:</label> 
                                <input class="unos" type="text" value="<c:out value='${kupac.email}' />" name="email" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Telefon:</label>
                                <input class="unos" type="text" value="<c:out value='${kupac.telefon}' />" name="telefon" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Adresa:</label>
                                <input class="unos" type="text" value="<c:out value='${kupac.adresa}' />" name="adresa" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Grad:</label>
                                <input class="unos" type="text" value="<c:out value='${kupac.grad}' />" name="grad" required="required">
                            </fieldset>


                            <c:if test="${kupac != null}">
                                <fieldset>
                                    <label class="opis">Vreme poslednje kupovine:</label>
                                    <input class="unos" type="text" value="<c:out value='${kupac.pposeta}' />" name="pposeta" required="required">
                                </fieldset>
                            </c:if>

                            <button type="submit" class="btn">SACUVAJ</button>
                        </form>

                </div>
            </div>

        </div>
        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>


    </body>
</html>
