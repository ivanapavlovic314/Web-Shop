package model;

import java.io.Serializable;

public class Proizvod implements Serializable {

    private Integer id;
    private String naziv;
    private double cena;
    private String opis;
    private Integer lager;
    private String kategorija;

    public Proizvod() {
    }

    public Proizvod(Integer id) {
        this.id = id;
    }

    public Proizvod(Integer id, String naziv, double cena, String opis, Integer lager, String kategorija) {
        this.id = id;
        this.naziv = naziv;
        this.lager = lager;
        this.cena = cena;
        this.opis = opis;
        this.kategorija = kategorija;
    }

    public Proizvod(String naziv, double cena, String opis, Integer lager, String kategorija) {
        this.naziv = naziv;
        this.lager = lager;
        this.cena = cena;
        this.opis = opis;
        this.kategorija = kategorija;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public double getCena() {
        return cena;
    }

    public void setCena(double cena) {
        this.cena = cena;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public Integer getLager() {
        return lager;
    }

    public void setLager(Integer lager) {
        this.lager = lager;
    }

    public String getKategorija() {
        return kategorija;
    }

    public void setKategorija(String kategorija) {
        this.kategorija = kategorija;
    }

    @Override
    public String toString() {
        return "model.Proizvod[ id=" + id + " ]";
    }

}
