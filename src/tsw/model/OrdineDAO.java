package tsw.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdineDAO {

    public List<Ordine> doRetrieveAll(int offset, int limit) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con
                    .prepareStatement("SELECT id,idprodotto,idutente,quantita  FROM ordine LIMIT ?, ?");
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            ArrayList<Ordine> ordini = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ordine p = new Ordine();
                p.setId(rs.getInt(1));
                p.setIdprodotto(rs.getInt(2));
                p.setIdutente(rs.getInt(3));
                p.setQuantita(rs.getInt(4));
                ordini.add(p);
            }
            return ordini;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Ordine doRetrieveById(int id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con
                    .prepareStatement("SELECT id,idprodotto,idutente,quantita FROM ordine WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Ordine p = new Ordine();
                p.setId(rs.getInt(1));
                p.setIdprodotto(rs.getInt(2));
                p.setIdutente(rs.getInt(3));
                p.setQuantita(rs.getInt(4));
                return p;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Ordine> doRetrieveByUtente(int utente){

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con
                    .prepareStatement("SELECT id,idprodotto,idutente,quantita FROM ordine WHERE utente=?");
            ps.setInt(1, utente);
            ArrayList<Ordine> ordini = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ordine p = new Ordine();
                p.setId(rs.getInt(1));
                p.setIdprodotto(rs.getInt(2));
                p.setIdutente(rs.getInt(3));
                p.setQuantita(rs.getInt(4));
                ordini.add(p);
            }
            return ordini;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doSave(Ordine ordine) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO ordine (idprodotto,idutente,quantita) VALUES(?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, ordine.getIdprodotto());
            ps.setInt(2, ordine.getIdutente());
            ps.setInt(3, ordine.getQuantita());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            ordine.setId(rs.getInt(1));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doUpdate(Ordine ordine) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE ordine SET idprodotto=?, idutente=?, quantita=? WHERE id=?");
            ps.setInt(1, ordine.getIdprodotto());
            ps.setInt(2, ordine.getIdutente());
            ps.setInt(3, ordine.getQuantita());
            ps.setInt(4, ordine.getId());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("UPDATE error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doDelete(int id) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM ordine WHERE id=?");
            ps.setInt(1, id);
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("DELETE error.");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
