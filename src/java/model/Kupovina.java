package model;

import java.io.Serializable;

public class Kupovina implements Serializable {

    private int id;
    private double iznos;
    private String vreme;
    private String listaProizvoda;
    private int kupac;

    public Kupovina() {
    }

    public Kupovina(int id) {
        this.id = id;
    }

    public Kupovina(int id, double iznos, String vreme, String listaProizvoda, int kupac) {
        this.id = id;
        this.iznos = iznos;
        this.vreme = vreme;
        this.listaProizvoda = listaProizvoda;
        this.kupac = kupac;
    }

    public Kupovina(double iznos, String vreme, String listaProizvoda, int kupac) {
        this.iznos = iznos;
        this.vreme = vreme;
        this.listaProizvoda = listaProizvoda;
        this.kupac = kupac;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getIznos() {
        return iznos;
    }

    public void setIznos(double iznos) {
        this.iznos = iznos;
    }

    public String getVreme() {
        return vreme;
    }

    public void setVreme(String vreme) {
        this.vreme = vreme;
    }

    public String getListaProizvoda() {
        return listaProizvoda;
    }

    public void setListaProizvoda(String listaProizvoda) {
        this.listaProizvoda = listaProizvoda;
    }

    public int getKupac() {
        return kupac;
    }

    public void setKupac(int kupac) {
        this.kupac = kupac;
    }

    @Override
    public String toString() {
        return "model.Kupovina[ id=" + id + " ]";
    }

}
