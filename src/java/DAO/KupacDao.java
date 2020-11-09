package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Kupac;

public class KupacDao {

    private final String url = "jdbc:mysql://localhost:3306/webprodavnica";
    private final String user = "test";
    private final String password = "test";

    private static final String NOVI_KUPAC = "INSERT INTO kupac (ime, prezime, email, telefon, adresa, grad, pposeta) VALUES (?,?,?,?,?,?,?)";
    private static final String KUPAC_ID = "select id, ime, prezime, email, telefon, adresa, grad, pposeta from kupac where id =?;";
    private static final String SVI_KUPCI = "select * from kupac;";
    private static final String BRISI_KUPCA = "delete from kupac where id = ?;";
    private static final String AZURIRAJ_KUPCA = "update kupac set ime=?, prezime=?, email=?, telefon=?, adresa=?, grad=?, pposeta=? where id = ?";
    private static final String AKTIVNOST = "update kupac set pposeta=? where id = ?";

    public KupacDao() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException e) {

            System.out.println("Greska u konekciji" + e);

        }

        return connection;
    }

    public void noviKupac(Kupac kupac) throws SQLException {

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(NOVI_KUPAC)) {

            ps.setString(1, kupac.getIme());
            ps.setString(2, kupac.getPrezime());
            ps.setString(3, kupac.getEmail());
            ps.setString(4, kupac.getTelefon());
            ps.setString(5, kupac.getAdresa());
            ps.setString(6, kupac.getGrad());
            ps.setString(7, kupac.getPposeta());
         
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("SQL insert greska" + e);
        }
    }

    public Kupac izaberiKupca(int id) {
        Kupac kupac = null;

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(KUPAC_ID)) {

            ps.setInt(1, id);
           
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String ime = rs.getString("ime");
                String prezime = rs.getString("prezime");
                String email = rs.getString("email");
                String telefon = rs.getString("telefon");
                String adresa = rs.getString("adresa");
                String grad = rs.getString("grad");
                String pposeta = rs.getString("pposeta");
                kupac = new Kupac(id, ime, prezime, email, telefon, adresa, grad, pposeta);
            }
        } catch (SQLException e) {
            System.out.println("SQL greska" + e);
        }
        return kupac;
    }

    public List <Kupac> izlistajSveKupce() {

        List <Kupac> kupci = new ArrayList<>();

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(SVI_KUPCI);) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String ime = rs.getString("ime");
                String prezime = rs.getString("prezime");
                String email = rs.getString("email");
                String telefon = rs.getString("telefon");
                String adresa = rs.getString("adresa");
                String grad = rs.getString("grad");
                String pposeta = rs.getString("pposeta");
                kupci.add(new Kupac(id, ime, prezime, email, telefon, adresa, grad, pposeta));
            }
        } catch (SQLException e) {
            System.out.println("SQL greska" + e);
        }
        return kupci;
    }

    public boolean izbrisiKupca(int id) throws SQLException {
        boolean izbrisan;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(BRISI_KUPCA);) {
            ps.setInt(1, id);
            izbrisan = ps.executeUpdate() > 0;
        }
        return izbrisan;
    }

    public boolean azurirajKupca(Kupac kupac) throws SQLException {
        boolean azuriran;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(AZURIRAJ_KUPCA);) {

            ps.setString(1, kupac.getIme());
            ps.setString(2, kupac.getPrezime());
            ps.setString(3, kupac.getEmail());
            ps.setString(4, kupac.getTelefon());
            ps.setString(5, kupac.getAdresa());
            ps.setString(6, kupac.getGrad());
            ps.setString(7, kupac.getPposeta());
            ps.setInt(8, kupac.getId());
            azuriran = ps.executeUpdate() > 0;
        }
        return azuriran;
    }

    public boolean aktivnostKupca(Kupac kupac, String vremeKupovine) throws SQLException {
        boolean azuriran;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(AKTIVNOST);) {

            ps.setString(1, vremeKupovine);
            ps.setInt(2, kupac.getId());
            azuriran = ps.executeUpdate() > 0;
        }
        return azuriran;
    }

}
