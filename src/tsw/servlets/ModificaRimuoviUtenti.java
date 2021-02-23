package tsw.servlets;

import tsw.model.Prodotto;
import tsw.model.Utente;
import tsw.model.UtenteDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ModificaRimuovi")
public class ModificaRimuoviUtenti extends HttpServlet {

    private UtenteDAO utenteDAO = new UtenteDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyServletException.checkAdmin(request);

        String idstr = request.getParameter("id");
        if (idstr != null) {
            if (request.getParameter("rimuovi") != null) {
                utenteDAO.doDelete(Integer.parseInt(idstr));
                request.setAttribute("notifica", "Utente rimosso con successo.");

            } else {
                String nome = request.getParameter("nome");
                String username = request.getParameter("username");
                String email = request.getParameter("email");

                if (nome != null && username != null && email != null) {
                    Utente utente = new Utente();
                    utente.setNome(nome);
                    utente.setUsername(username);
                    utente.setEmail(email);

                        utente.setId(Integer.parseInt(idstr));
                        utenteDAO.doUpdate(utente);
                        request.setAttribute("notifica", "Utente modificato con successo.");


                    request.setAttribute("utente", utente);


                }
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/modificautente.jsp");
            requestDispatcher.forward(request, response);


        }
    }
}
