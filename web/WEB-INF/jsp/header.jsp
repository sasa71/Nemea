<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
	<title>Nemea - ${param.pageTitle}</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link href="bare.min.css" rel="stylesheet"><!-- non-minified: https://github.com/ericclemmons/bare-css/tree/master/less -->
	<script src="ricerca.js"></script>
</head>
<body>
<nav>
	<label>
		<input type="checkbox">
		<header>
			<a href="."><img src="img/logo.png">NEMEA</a>
		</header>
		<ul>
			<li><a href=".">Home</a></li>
			<li><a href="Struttura">Struttura</a></li>
			<li><a href="Negozio">Negozio</a></li>
			<li><a href="Carrello">Carrello</a></li>
			<li>
				<c:choose>
					<c:when test="${utente == null}">
						<a href="loginForm">Login</a>
					</c:when>
					<c:otherwise>
						<a>${utente.admin ? 'Admin' : 'Account'}</a>
						<menu>
							<c:if test="${utente.admin}">
								<menuitem><a href="AdminCategoria">Aggiungi Categoria</a></menuitem>
								<menuitem><a href="AdminProdotto">Aggiungi Prodotto</a></menuitem>
								<menuitem><a href="AdminUtenti">Utenti</a></menuitem>
								<hr style="margin:0px;">
							</c:if>
								${utente.nome}
							<menuitem><a href="AreaUtente">Profilo</a></menuitem>
							<menuitem>
								<card>
									<form action="Logout">
										<input type="submit" value="Logout">
									</form>
								</card>
							</menuitem>
						</menu>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	</label>
</nav>
