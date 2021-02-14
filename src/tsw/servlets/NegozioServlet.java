package tsw.servlets;

import tsw.model.Categoria;
import tsw.model.CategoriaDAO;
import tsw.model.Prodotto;
import tsw.model.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Negozio")
public class NegozioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProdottoDAO prodottoDAO = new ProdottoDAO();

    @Override
    public void init() throws ServletException {
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        List<Categoria> categorie = categoriaDAO.doRetrieveAll();
        getServletContext().setAttribute("categorie", categorie);
        super.init();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Prodotto> prodotti = prodottoDAO.doRetrieveAll(0, 10);
        request.setAttribute("prodotti", prodotti);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/Negozio.jsp");
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
