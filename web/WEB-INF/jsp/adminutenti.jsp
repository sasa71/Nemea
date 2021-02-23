<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
	<jsp:param name="pageTitle" value="Utenti"/>
</jsp:include>
	<section>
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>Username</th>
					<th>Nome</th>
					<th>Email</th>
					<th>Admin</th>
					<th>Azioni</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${utenti}" var="utente">
					<tr>
						<td>${utente.id}</td>
						<td>${utente.username}</td>
						<td>${utente.nome}</td>
						<td>${utente.email}</td>
						<td>${utente.admin ? "Si" : "No"}</td>
						<td>

							<form action="ModificaRimuovi" method="post">
								<input type="hidden" name="id" value="${utente.id}">
								<input type="submit" name ="modifica" value="Modifica">
								<input type="submit" name="rimuovi" value="Rimuovi">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</section>
<%@include file="footer.html"%>
