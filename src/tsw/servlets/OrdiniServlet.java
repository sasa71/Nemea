package tsw.servlets;

import com.mysql.cj.Session;
import tsw.model.Ordine;
import tsw.model.OrdineDAO;
import tsw.model.Prodotto;
import tsw.model.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/Ordine")
public class OrdiniServlet extends HttpServlet{
        private static final long serialVersionUID = 1L;
        private final OrdineDAO ordineDAO = new OrdineDAO();

        /**
         * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
         *      response)
         */
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            int idprodotto = Integer.parseInt(request.getParameter("idprodotto"));
            int quantita = Integer.parseInt(request.getParameter("quantita"));
            int idutente = Integer.parseInt(request.getParameter("idutente"));
            Ordine ordine =new Ordine();
            ordineDAO.doSave(ordine);
            if (ordine == null) {
                throw new MyServletException("Ordine non trovato.");
            }
            request.setAttribute("prodotto",ordine);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/jsp/Acquisto.jsp");
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
