<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header2.jsp">
    <jsp:param name="pageTitle" value="Ordini"/>
</jsp:include>
<section>
    <h1>Ordini</h1>
</section>


<c:choose>
    <c:when test="${utente == null}">
    </c:when>
    <c:otherwise>
        <a>${utente.admin ? 'Admin' : 'Account'}</a>
        <c:if test="${utente.admin}">
            <section>
            <table>
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Id prodotto</th>
                    <th>Id utente</th>
                    <th>Nome utente</th>
                    <th>Nome prodotto</th>
                    <th>Quantità</th>
                    <th>Prezzo</th>
                    <th>Azioni</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${ordiniadmin}" var="ordiniadmin">
                    <tr>
                        <td>${ordiniadmin.id}</td>
                        <td>${ordiniadmin.idprodotto}</td>
                        <td>${ordiniadmin.idutente}</td>
                        <td>${ordiniadmin.utente.nome}</td>
                        <td>${ordiniadmin.prodotto.nome}</td>
                        <td>${ordiniadmin.quantita}</td>
                        <td>${ordiniadmin.tot}</td>
                        <td>
                            <form action="todo" method="post">
                                <input type="hidden" name="id" value="${ordiniadmin.id}">
                                <input type="submit" value="Modifica">
                                <input type="submit" name="rimuovi" value="Rimuovi">
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
        </c:forEach>
</section>
        </c:if>
        <c:if test="${utente.admin}">
            <section>
            <table>
            <thead>
            <tr>
            <th>Id</th>
            <th>Id prodotto</th>
            <th>Nome prodotto</th>
            <th>Quantità</th>
            <th>Prezzo</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${ordini}" var="ordini">
                <tr>
                    <td>${ordini.id}</td>
                    <td>${ordini.idprodotto}</td>
                    <td>${ordini.prodotto.nome}</td>
                    <td>${ordini.quantita}</td>
                    <td>${ordini.tot}</td>
                </tr>
                </tbody>
                </table>
            </c:forEach>
            </section>


<%@include file="footer.html"%>
