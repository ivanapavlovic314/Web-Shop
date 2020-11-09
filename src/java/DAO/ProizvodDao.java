package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Proizvod;

public class ProizvodDao {

    private final String url = "jdbc:mysql://localhost:3306/webprodavnica";
    private final String user = "test";
    private final String password = "test";

    private static final String NOVI_PROIZVOD = "INSERT INTO proizvod (naziv, cena, opis, lager, kategorija) VALUES (?,?,?,?,?)";
    private static final String PROIZVOD_ID = "select id, naziv, cena, opis, lager, kategorija from proizvod where id =?;";
    private static final String SVI_PROIZVODI = "select * from proizvod;";
    private static final String BRISI_PROIZVOD = "delete from proizvod where id = ?;";
    private static final String AZURIRAJ_PROIZVOD = "update proizvod set naziv=?, cena=?, opis=?, lager=?, kategorija=? where id = ?";
    private static final String KUPI_PROIZVOD = "update proizvod set lager=? where id = ?";

    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException e) {

            System.out.println("Greska u konekciji" + e);
        }

        return con;
    }

    public void noviProizvod(Proizvod proizvod) throws SQLException {

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(NOVI_PROIZVOD)) {

            ps.setString(1, proizvod.getNaziv());
            ps.setDouble(2, proizvod.getCena());
            ps.setString(3, proizvod.getOpis());
            ps.setInt(4, proizvod.getLager());
            ps.setString(5, proizvod.getKategorija());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("SQL Insert greska" + e);
        }
    }

    public Proizvod izaberiProizvod(int id) {
        Proizvod proizvod = null;

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(PROIZVOD_ID);) {
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String naziv = rs.getString("naziv");
                Double cena = rs.getDouble("cena");
                String opis = rs.getString("opis");
                Integer lager = rs.getInt("lager");
                String kategorija = rs.getString("kategorija");
                proizvod = new Proizvod(id, naziv, cena, opis, lager, kategorija);
            }
        } catch (SQLException e) {
            System.out.println("SQL greska" + e);
        }
        return proizvod;
    }

    public List< Proizvod> izlistajSveProizvode() {

        List<Proizvod> proizvodi = new ArrayList<>();

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(SVI_PROIZVODI);) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String naziv = rs.getString("naziv");
                double cena = rs.getDouble("cena");
                String opis = rs.getString("opis");
                Integer lager = rs.getInt("lager");
                String kategorija = rs.getString("kategorija");

                proizvodi.add(new Proizvod(id, naziv, cena, opis, lager, kategorija));
            }
        } catch (SQLException e) {
            System.out.println("SQL greska" + e);
        }
        return proizvodi;
    }

    public boolean izbrisiProizvod(int id) throws SQLException {
        boolean izbrisan;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(BRISI_PROIZVOD);) {

            ps.setInt(1, id);
            izbrisan = ps.executeUpdate() > 0;
        }
        return izbrisan;
    }

    public boolean azurirajProizvod(Proizvod proizvod) throws SQLException {
        boolean azuriran;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(AZURIRAJ_PROIZVOD);) {

            ps.setString(1, proizvod.getNaziv());
            ps.setDouble(2, proizvod.getCena());
            ps.setString(3, proizvod.getOpis());
            ps.setInt(4, proizvod.getLager());
            ps.setString(5, proizvod.getKategorija());

            ps.setInt(6, proizvod.getId());
            azuriran = ps.executeUpdate() > 0;
        }
        return azuriran;
    }

    public boolean kupiProizvod(Proizvod proizvod, int kolicina) throws SQLException {
        boolean kupljen;
        int lager = proizvod.getLager() - kolicina;

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(KUPI_PROIZVOD);) {

            ps.setInt(1, lager);
            ps.setInt(2, proizvod.getId());

            kupljen = ps.executeUpdate() > 0;
        }
        return kupljen;
    }
}
