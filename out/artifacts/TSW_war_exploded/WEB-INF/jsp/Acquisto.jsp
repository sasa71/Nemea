<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Acquisto"/>
</jsp:include>
    <div>
        <center><h1>Acquisto effettuato con successo!</h1></center>
    </div>
<center><div>
    <form method="POST" action=".">
        <input type="submit" value="Torna alla home">
    </form>
    <form method="POST" action="OrdiniUtente">
        <input type="hidden" name="idutente" value="${utente.id}">
        <input type="submit" value="Vedi i tuoi ordini">
    </form>
</div>
</center>

<%@include file="footer.html"%>
