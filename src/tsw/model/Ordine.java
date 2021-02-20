package tsw.model;

import java.util.Objects;

public class Ordine {
    private int id;
    private int idutente;
    private int idprodotto;
    private int quantita;

    public Ordine(int idutente, int idprodotto, int quantita) {
        this.idutente = idutente;
        this.idprodotto = idprodotto;
        this.quantita = quantita;
    }
    public Ordine(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdutente() {
        return idutente;
    }

    public void setIdutente(int idutente) {
        this.idutente = idutente;
    }

    public int getIdprodotto() {
        return idprodotto;
    }

    public void setIdprodotto(int idprodotto) {
        this.idprodotto = idprodotto;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ordine ordine = (Ordine) o;
        return id == ordine.id && idutente == ordine.idutente && idprodotto == ordine.idprodotto && quantita == ordine.quantita;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, idutente, idprodotto, quantita);
    }

    @Override
    public String toString() {
        return "Ordine{" +
                "id=" + id +
                ", idutente=" + idutente +
                ", idprodotto=" + idprodotto +
                ", quantita=" + quantita +
                '}';
    }
}
