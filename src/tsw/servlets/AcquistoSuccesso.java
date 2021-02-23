package tsw.servlets;

import tsw.model.Carrello;
import tsw.model.Utente;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Acquisto")
public class AcquistoSuccesso extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");

        if (request.getSession().getAttribute("utente") == null) {
            throw new MyServletException("Utente non loggato");
        }

        String prodid = request.getParameter("prodId");
        carrello.remove(Integer.parseInt(prodid));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/Acquisto.jsp");
        requestDispatcher.forward(request, response);

    }
}
