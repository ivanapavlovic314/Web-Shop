<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proizvod - Formular</title>
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
            <h1>Formular</h1>

            <div id="previewstr" >

                <!-- Placeholder za FORMULAR -->
                <div id="formular" >
                    <c:if test="${proizvod != null}">
                        <form id="proizvod" action="azurirajProizvod" method="post">
                        </c:if>

                        <c:if test="${proizvod == null}">
                            <form id="proizvod" action="sacuvajProizvod" method="post">
                            </c:if>

                            <caption >
                                <h2 id="fs1">
                                    <c:if test="${proizvod != null}">
                                        Izmeni podatke o proizvodu
                                    </c:if>
                                    <c:if test="${proizvod == null}">
                                        Dodaj novi proizvod
                                    </c:if>
                                </h2>
                            </caption>

                            <c:if test="${proizvod != null}">
                                <input class="unos" type="hidden" name="id" value="<c:out value='${proizvod.id}' />" />
                            </c:if>

                            <fieldset >
                                <label class="opis"> Naziv proizvoda:</label> 
                                <input class="unos" type="text" value="<c:out value='${proizvod.naziv}' />" name="naziv" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Cena proizvoda:</label>
                                <input class="unos" type="number" step=".01" value="<c:out value='${proizvod.cena}' />" name="cena" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Kratak opis proizvoda:</label> 
                                <input class="unos" type="text" value="<c:out value='${proizvod.opis}' />" name="opis" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Kolicina na lageru:</label>
                                <input class="unos" type="text" value="<c:out value='${proizvod.lager}' />" name="lager" required="required">
                            </fieldset>

                            <fieldset >
                                <label class="opis">Vrsta proizvoda:</label>
                                <select id="vrste" name="kategorija" form="proizvod" value="<c:out value='${proizvod.kategorija}' />">
                                    <option >Izabrati...</option>
                                    <option value="Delikates" ${proizvod.kategorija == 'Delikates' ? 'selected' : ''} >Delikates</option>
                                    <option value="Konzervirano" ${proizvod.kategorija == 'Konzervirano' ? 'selected' : ''} >Konzervirano</option>
                                    <option value="Mesara" ${proizvod.kategorija == 'Mesara' ? 'selected' : ''} >Mesara</option>
                                    <option value="Mlecni proizvodi" ${proizvod.kategorija == 'Mlecni proizvodi' ? 'selected' : ''} >Mlecni proizvodi</option>
                                    <option value="Neprehrana" ${proizvod.kategorija == 'Neprehrana' ? 'selected' : ''} >Neprehrana</option>
                                    <option value="Osnovne namirnice" ${proizvod.kategorija == 'Osnovne namirnice' ? 'selected' : ''} >Osnovne namirnice</option>
                                    <option value="Pekara" ${proizvod.kategorija == 'Pekara' ? 'selected' : ''} >Pekara</option>
                                    <option value="Voda i pice" ${proizvod.kategorija == 'Voda i pice' ? 'selected' : ''} >Voda i pice</option>
                                    <option value="Slatkisi i grickalice" ${proizvod.kategorija == 'Slatkisi i grickalice' ? 'selected' : ''} >Slatkisi i grickalice</option>
                                </select>

                            </fieldset>



                            <button type="submit" class="btn">SACUVAJ PROIZVOD</button>
                        </form>

                </div>
            </div>

        </div>
        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>


    </body>
</html>
