
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Modifica Utente"/>
</jsp:include>
<section>
<h1>${operazione} utente</h1>
<h5>${notifica}</h5>
<c:if test="${param.rimuovi == null}">
    <form action="ModificaRimuovi" method="post">
        <input type="hidden" name="id" value="${utente.id}">
        <label>Username</label>
        <input type="text" name="username" value="${utente.username}" oninput="validaUsername()">
        <label>Nome</label>
        <input type="nome" name="nome" value="${utente.nome}" oninput="validaNome()">
        <label>Email</label>
        <input type="email" name="email" value="${utente.email}" oninput="validaEmail()">
        <input type="submit" name ="modifica" value="Modifica">
    </form>
</c:if>
</section>

<%@include file="footer.html"%>