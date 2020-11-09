package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Kupovina;

public class KupovinaDao {

    private final String url = "jdbc:mysql://localhost:3306/webprodavnica";
    private final String user = "test";
    private final String password = "test";

    private static final String NOVA_KUPOVINA = "INSERT INTO kupovina (iznos, vreme, listaProizvoda, kupac) VALUES (?,?,?,?)";
    private static final String KUPOVINA_U_VREME = "select id from kupovina where vreme=?;";
    private static final String PROMET = "select * from kupovina;";
    private static final String BRISANJE = "delete from kupovina where id = ?;";

    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException | ClassNotFoundException e) {

            System.out.println("Greska u konekciji");
        }

        return con;
    }

    public List<Kupovina> izlistajPromet() {

        List<Kupovina> promet = new ArrayList<>();

        try (Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(PROMET)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                double iznos = rs.getDouble("iznos");
                String vreme = rs.getString("vreme");
                String listaProizvoda = rs.getString("listaProizvoda");
                int kupac = rs.getInt("kupac");

                promet.add(new Kupovina(id, iznos, vreme, listaProizvoda, kupac));
            }
        } catch (SQLException e) {
            System.out.println("SQL greska" + e);
        }
        return promet;
    }

    public void novaKupovina(Kupovina kupovina) throws SQLException {

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(NOVA_KUPOVINA)) {

            ps.setDouble(1, kupovina.getIznos());
            ps.setString(2, kupovina.getVreme());
            ps.setString(3, kupovina.getListaProizvoda());
            ps.setInt(4, kupovina.getKupac());

            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("SQL Insert greska" + e);
        }

    }

    public boolean izbrisiKupovinu(int id) throws SQLException {
        boolean izbrisan;
        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(BRISANJE);) {

            ps.setInt(1, id);
            izbrisan = ps.executeUpdate() > 0;
        }
        return izbrisan;
    }

    public Kupovina posljednjaKupovina(String vreme) {
        Kupovina kupovina = null;

        try (
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement(KUPOVINA_U_VREME)) {

            ps.setString(1, vreme);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");

                kupovina = new Kupovina(id);
            }
        } catch (SQLException e) {
            System.out.println("SQL greska" + e);
        }
        return kupovina;
    }

}
