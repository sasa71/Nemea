package tsw.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tsw.model.Utente;
import tsw.model.UtenteDAO;

/**
 * @author Mattia De Rosa
 *
 */
@WebServlet("/AreaUtente")
public class AreaUtenteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UtenteDAO utenteDAO = new UtenteDAO();

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Utente utente=(Utente)request.getSession().getAttribute("utente");
        int id= utente.getId();
        String username=utente.getUsername();
        String nome=utente.getNome();
        String email=utente.getEmail();
        request.setAttribute("utente",utente);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/areautente.jsp");
        requestDispatcher.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
