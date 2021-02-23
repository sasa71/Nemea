package tsw.servlets;

import com.mysql.cj.Session;
import tsw.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
            Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");

            int idprodotto = Integer.parseInt(request.getParameter("idprodotto"));
            int quantita = Integer.parseInt(request.getParameter("quantita"));
            Utente utente=(Utente)request.getSession().getAttribute("utente");

            if(utente == null){
                throw new MyServletException("utente non loggato");
            }

            Ordine ordine =new Ordine();
            ordine.setIdutente(utente.getId());
            ordine.setIdprodotto(idprodotto);
            ordine.setQuantita(quantita);
            ordineDAO.doSave(ordine);
            carrello.getProdotti().clear();
            if (ordine == null) {
                throw new MyServletException("Ordine non trovato.");
            }
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
