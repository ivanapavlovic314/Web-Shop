package model;

import java.io.Serializable;

public class Kupac implements Serializable {

    private Integer id;
    private String ime;
    private String prezime;
    private String email;
    private String telefon;
    private String adresa;
    private String grad;
    private String pposeta;

    public Kupac() {
    }

    public Kupac(Integer id) {
        this.id = id;
    }

    public Kupac(Integer id, String ime, String prezime, String email, String telefon, String adresa, String grad, String pposeta) {
        this.id = id;
        this.ime = ime;
        this.prezime = prezime;
        this.email = email;
        this.telefon = telefon;
        this.adresa = adresa;
        this.grad = grad;
        this.pposeta = pposeta;
    }

    public Kupac(String ime, String prezime, String email, String telefon, String adresa, String grad, String pposeta) {
        this.ime = ime;
        this.prezime = prezime;
        this.email = email;
        this.telefon = telefon;
        this.adresa = adresa;
        this.grad = grad;
        this.pposeta = pposeta;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public String getPposeta() {
        return pposeta;
    }

    public void setPposeta(String pposeta) {
        this.pposeta = pposeta;
    }

    @Override
    public String toString() {
        return ime + " " + prezime + ", " + adresa + ", " + grad + ", " + telefon + ", " + email;
    }

}
