<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/styles.css"/> 

        <title>Web Prodavnica</title>
    </head>
    <body>
        <div id="main">

            <div id="header">
                <a class="header" href="#">
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



            <div id="preview">



                <div>
                    <h1>Dobrodosli u WebProdavnicu</h1>
                    <br>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ullamcorper 
                    risus in ex luctus pellentesque. Aenean commodo eros urna, eget pharetra
                    justo tristique ut. Nam mollis tempor pretium. Donec consectetur lacus ut
                    magna mollis, sit amet viverra eros faucibus. Donec facilisis, nulla quis
                    finibus commodo, nulla purus mollis augue, ac feugiat purus quam nec lectus.
                    Proin hendrerit tempus quam, blandit varius mi. Donec nibh ipsum, imperdiet
                    vitae convallis at, congue eu massa. Sed lacinia est est, ac hendrerit augue
                    maximus vel. Donec in convallis lacus, ac scelerisque lorem. Orci varius natoque
                    penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus egestas
                    eros sed euismod pellentesque. Maecenas efficitur diam ac eros gravida, eget fringilla
                    metus mollis. Quisque sollicitudin sem ut erat cursus, ut iaculis dui dignissim. Nunc 
                    quis eleifend nulla. Curabitur vel rhoncus massa. Nulla ac sagittis mauris, nec varius magna.
                    <br>

                </div>



                <div id="previewstr" >

                    <!-- Placeholder za TASTERE -->
                    <div id="index-a">
                        <a  class="btn" href="<%=request.getContextPath()%>/kupovina">ZAPOCNI KUPOVINU</a>
                    </div>

                </div>


            </div>
        </div>

        <div id="footer">
            <h5>Ivana Pavlovic @ ITAcademy jul 2020.</h5>
        </div>


    </body>
</html>
