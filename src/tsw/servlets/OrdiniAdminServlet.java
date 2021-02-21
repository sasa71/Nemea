package tsw.servlets;

import tsw.model.Ordine;
import tsw.model.OrdineDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/OrdiniAdmin")
public class OrdiniAdminServlet {
    private static final long serialVersionUID = 1L;
    private final OrdineDAO ordineDAO = new OrdineDAO();


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MyServletException.checkAdmin(request);
        List<Ordine> ordiniadmin = ordineDAO.doRetrieveAll(0,10);
        request.setAttribute("ordiniadmin", ordiniadmin);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/ordini.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}


