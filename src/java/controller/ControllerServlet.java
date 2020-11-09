/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.KupacDao;
import DAO.KupovinaDao;
import DAO.ProizvodDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Kupac;
import model.Kupovina;
import model.Proizvod;

/**
 *
 * @author ivana
 */
@WebServlet(name = "ControllerServlet",
        loadOnStartup = 1,
        urlPatterns = {
            /*Kupci*/
            "/kupci",
            "/sacuvajKupca",
            "/noviKupac",
            "/izmenaKupca",
            "/azurirajKupca",
            "/brisanjeKupca",
            /*Proizvodi*/
            "/proizvodi",
            "/noviProizvod",
            "/izmenaProizvoda",
            "/azurirajProizvod",
            "/sacuvajProizvod",
            "/brisanjeProizvoda",
            /*Promet*/
            "/promet",
            "/kupovina",
            "/kasa",
            "/potvrdaKupovine"})
public class ControllerServlet extends HttpServlet {

    private KupacDao kupacDao;
    private ProizvodDao proizvodDao;
    private KupovinaDao kupovinaDao;

    /* ovaj deo je dodat za korpu*/
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, IOException {

        String userPath = request.getServletPath();

        kupacDao = new KupacDao();
        proizvodDao = new ProizvodDao();
        kupovinaDao = new KupovinaDao();

        try {

            switch (userPath) {

                /*Sekcija za Kupce*/
                case ("/kupci"):
                    listaKupaca(request, response);
                    break;
                case "/noviKupac":
                    formaKupac(request, response);
                    break;
                case "/izmenaKupca":
                    izmenaKupca(request, response);
                    break;
                case "/brisanjeKupca":
                    brisanjeKupca(request, response);
                    break;

                /*Sekcija za proizvode*/
                case ("/proizvodi"):
                    listaProizvoda(request, response);
                case "/noviProizvod":
                    formaProizvod(request, response);
                    break;
                case "/izmenaProizvoda":
                    izmenaProizvoda(request, response);
                    break;
                case "/brisanjeProizvoda":
                    brisanjeProizvoda(request, response);
                    break;

                /*Sekcija za promet*/
                case ("/promet"):
                    listaPrometa(request, response);
                    break;
                case ("/brisanjeKupovine"):
                    brisanjeKupovine(request, response);
                    break;
                case ("/kupovina"):
                    listaZaProdaju(request, response);
                    break;
                case ("/kasa"):
                    naKasi(request, response);
                    break;
            }
        } catch (IOException | ServletException | SQLException ex) {
            System.out.println("GRESKA!" + ex);

        }

    }

    /*PROMET*/
    private void listaPrometa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Kupovina> listaPrometa = kupovinaDao.izlistajPromet();
        request.setAttribute("promet", listaPrometa);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/promet.jsp");
        dispatcher.forward(request, response);
    }

    private void brisanjeKupovine(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        System.out.println("zapoceto brisanje");
        int id = Integer.parseInt(request.getParameter("id"));
        kupovinaDao.izbrisiKupovinu(id);
        System.out.println("zavrseno brisanje");
        listaPrometa(request, response);
    }

    private void naKasi(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {

        String[] listaArtikala = request.getParameterValues("artikal");
        List<Proizvod> zaKupovinu = new ArrayList();
        for (String br_a : listaArtikala) {
            Proizvod artikal = proizvodDao.izaberiProizvod(Integer.parseInt(br_a));
            zaKupovinu.add(artikal);
        }
        request.setAttribute("proizvodi", zaKupovinu);
        System.out.println("Izlistavanje:" + Arrays.toString(listaArtikala));
        String[] listaKolicina = request.getParameterValues("kom");
        request.setAttribute("komada", listaKolicina);
        int kolikoRazlicitih = listaKolicina.length;
        System.out.println("Obelezeno je " + kolikoRazlicitih + "artikala");

        List<Kupac> listaKupaca = kupacDao.izlistajSveKupce();
        request.setAttribute("kupci", listaKupaca);
        request.getRequestDispatcher("/WEB-INF/view/kasa.jsp").forward(request, response);
    }

    

    /* KUPAC Controller GET */
    private void listaKupaca(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List< Kupac> listaKupaca = kupacDao.izlistajSveKupce();
        request.setAttribute("kupci", listaKupaca);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/kupci.jsp");
        dispatcher.forward(request, response);
    }

    private void formaKupac(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/kupac-form.jsp");
        dispatcher.forward(request, response);
    }

    private void izmenaKupca(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        System.out.println("zapocet obrazac");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Preuzet id:" + id);
        Kupac stariKupac = kupacDao.izaberiKupca(id);
        System.out.println(stariKupac);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/kupac-form.jsp");
        request.setAttribute("kupac", stariKupac);
        System.out.println("prevacivanje je sledece");
        dispatcher.forward(request, response);
        System.out.println("zavrseno prebacivanje");

    }

    private void brisanjeKupca(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        System.out.println("zapoceto brisanje");
        int id = Integer.parseInt(request.getParameter("id"));
        kupacDao.izbrisiKupca(id);
        System.out.println("zavrseno brisanje");
        listaKupaca(request, response);

    }

    /* PROIZVOD Controller GET */
    private void listaProizvoda(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Proizvod> listaProizvoda = proizvodDao.izlistajSveProizvode();
        request.setAttribute("proizvodi", listaProizvoda);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/proizvodi.jsp");
        dispatcher.forward(request, response);
    }

    private void listaZaProdaju(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        List<String> kategorije = new ArrayList<>();
        kategorije.add("Delikates");
        kategorije.add("Konzervirano");
        kategorije.add("Mesara");
        kategorije.add("Mlecni proizvodi");
        kategorije.add("Neprehrana");
        kategorije.add("Osnovne namirnice");
        kategorije.add("Pekara");
        kategorije.add("Slatkisi i grickalice");
        kategorije.add("Voda i pice");
        request.setAttribute("kategorije", kategorije);
        System.out.println("zapocet obrazac za prodaju");
        List<Proizvod> listaProizvoda = proizvodDao.izlistajSveProizvode();
        request.setAttribute("proizvodi", listaProizvoda);
        System.out.println("preuzete liste za prodaju");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/kupovina.jsp");
        dispatcher.forward(request, response);
    }

    private void formaProizvod(HttpServletRequest request, HttpServletResponse response)
            throws IllegalStateException, ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/proizvod-form.jsp");
        dispatcher.forward(request, response);
    }

    private void izmenaProizvoda(HttpServletRequest request, HttpServletResponse response)
            throws IllegalStateException, SQLException, ServletException, IOException {
        System.out.println("zapocet obrazac");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Preuzet id:" + id);
        Proizvod stariProizvod = proizvodDao.izaberiProizvod(id);
        System.out.println(stariProizvod);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/proizvod-form.jsp");
        request.setAttribute("proizvod", stariProizvod);
        System.out.println("prevacivanje je sledece");
        dispatcher.forward(request, response);
        System.out.println("zavrseno prebacivanje");

    }

    private void brisanjeProizvoda(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        System.out.println("zapoceto brisanje");
        int id = Integer.parseInt(request.getParameter("id"));
        proizvodDao.izbrisiProizvod(id);
        System.out.println("zavrseno brisanje");
        listaProizvoda(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userPath = request.getServletPath();

        try {

            switch (userPath) {

                /*Sekcija za Kupce*/
                case "/sacuvajKupca":
                    unosNovogKupca(request, response);
                    break;

                case "/azurirajKupca":
                    azuriranjeKupca(request, response);
                    break;

                case "/brisanjeKupca":
                    brisanjeKupca(request, response);
                    break;

                /*Sekcija za proizvode*/
                case ("/sacuvajProizvod"):
                    unosNovogProizvoda(request, response);
                case "/azurirajProizvod":
                    azuriranjeProizvoda(request, response);
                    break;

                /*Sekcija za promet*/
                case ("/promet"):
                    request.getRequestDispatcher("/WEB-INF/view/promet.jsp").forward(request, response);

                /*Sekcija za kupovina*/
                case ("/dodajUKorpu"):
                    break;
                case ("/potvrdaKupovine"):
                    potvrdaKupovine(request, response);
                    break;

            }
        } catch (IOException | ServletException ex) {
            System.out.println("GRESKA!");
        } catch (SQLException ex) {
            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /* KUPAC Controller POST */
    private void unosNovogKupca(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String email = request.getParameter("email");
        String telefon = request.getParameter("telefon");
        String adresa = request.getParameter("adresa");
        String grad = request.getParameter("grad");
        String pposeta = "Bez aktivnosti";

        Kupac noviKupac;
        noviKupac = new Kupac(ime, prezime, email, telefon, adresa, grad, pposeta);

        kupacDao.noviKupac(noviKupac);
        System.out.println("Unos uspesan");

        listaKupaca(request, response);

    }

    private void azuriranjeKupca(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String ime = request.getParameter("ime");
        String prezime = request.getParameter("prezime");
        String email = request.getParameter("email");
        String telefon = request.getParameter("telefon");
        String adresa = request.getParameter("adresa");
        String grad = request.getParameter("grad");
        String pposeta = request.getParameter("pposeta");
        System.out.println("prevacivanje je sledece");
        Kupac stariKupac = new Kupac(id, ime, prezime, email, telefon, adresa, grad, pposeta);
        kupacDao.azurirajKupca(stariKupac);
        System.out.println("prevacivanje je zavrseno");

        listaKupaca(request, response);

    }

    /* PROIZVOD Controller POST */
    private void unosNovogProizvoda(HttpServletRequest request, HttpServletResponse response) throws NullPointerException, SQLException, IOException, ServletException {

        String naziv = request.getParameter("naziv");
        double cena = Double.parseDouble(request.getParameter("cena"));
        String opis = request.getParameter("opis");
        Integer lager = Integer.valueOf(request.getParameter("lager"));
        String kategorija = request.getParameter("kategorija");

        Proizvod noviProizvod;
        noviProizvod = new Proizvod(naziv, cena, opis, lager, kategorija);

        proizvodDao.noviProizvod(noviProizvod);
        System.out.println("Unos uspesan");

        listaProizvoda(request, response);

    }

    private void azuriranjeProizvoda(HttpServletRequest request, HttpServletResponse response) throws
            SQLException, IOException, ServletException {
        try {
            System.out.println("Zapoceto azuriranje");

            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("preuzet ID");
            String naziv = request.getParameter("naziv");
            System.out.println("preuzet naziv");
            double cena = Double.parseDouble(request.getParameter("cena"));
            System.out.println("preuzeta cena");
            String opis = request.getParameter("opis");
            int lager = Integer.valueOf(request.getParameter("lager"));
            System.out.println("preuzet opis");
            String kategorija = request.getParameter("kategorija");
            System.out.println("preuzeta kategorija i zavrseno preuzimanje");

            System.out.println("Pocinje pravljenje novog proizvoda");
            Proizvod stariProizvod = new Proizvod(id, naziv, cena, opis, lager, kategorija);
            proizvodDao.azurirajProizvod(stariProizvod);
            System.out.println("UPDATE je zavrsen");

            listaProizvoda(request, response);
            System.out.println("nazad na listu proizvoda");
        } catch (NullPointerException ex) {
            System.out.println("Greska" + ex);
        }
    }

    private void potvrdaKupovine(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String[] listaArtikala = request.getParameterValues("artikal");
        String[] kolicina = request.getParameterValues("kom");
        int idKupac = Integer.parseInt(request.getParameter("kupac"));
        String pattern = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String lista = "Kupljeno: ";
        String vremeKupovine = sdf.format(new Date());
        Kupac kupac = kupacDao.izaberiKupca(idKupac);
        kupacDao.aktivnostKupca(kupac, vremeKupovine);
        System.out.print("Kupac azuriran");

        for (int i = 0; i < listaArtikala.length; i++) {
            int id = Integer.parseInt(listaArtikala[i]);
            Proizvod artikal = proizvodDao.izaberiProizvod(id);
            proizvodDao.kupiProizvod(artikal, Integer.parseInt(kolicina[i]));
            lista = lista + artikal.getNaziv() + " - " + kolicina[i] + "kom;";
        }
        System.out.print("Lageri azurirani");
        double iznos = Double.parseDouble(request.getParameter("iznosRacuna"));
        Kupovina novaKupovina = new Kupovina(iznos, vremeKupovine, lista, idKupac);
        kupovinaDao.novaKupovina(novaKupovina);
        System.out.print("Kupovina upisana");
        
        Kupovina pkupovina = kupovinaDao.posljednjaKupovina(vremeKupovine);
        int brkupovine = pkupovina.getId();
        System.out.println("Preuzet broj: " + brkupovine );
        request.setAttribute("brkupovine", brkupovine);
        request.getRequestDispatcher("/WEB-INF/view/potvrda.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
// </editor-fold>

}
