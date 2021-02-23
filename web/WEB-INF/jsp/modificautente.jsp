
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Modifica Utente"/>
</jsp:include>
<section>
    <h1>Modifica utente</h1>
    <form name="ModificaRimuovi" action="ModificaRimuovi" method="post">
        <label>Username</label>
        <input type="text" name="username" oninput="validaUsername()">
        <label>Nome</label>
        <input type="nome" name="nome" oninput="validaNome()">
        <label>Email</label>
        <input type="email" name="email" oninput="validaEmail()">
        <input id="aggiorna" type="submit" value="aggiorna">
    </form>
</section>

<%@include file="footer.html"%>