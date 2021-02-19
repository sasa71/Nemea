<%--
  Created by IntelliJ IDEA.
  User: luigi
  Date: 19/02/2021
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Login"/>
</jsp:include>
<section>
    <h1>Login utente</h1>
    <form action="Login" method="post">
        <input type="text" name="username" placeholder="Username"><br>
        <input type="password" name="password" placeholder="Password"><br>
        <input type="submit" value="Login">
    </form>
</section>
<%@include file="footer.html"%>


