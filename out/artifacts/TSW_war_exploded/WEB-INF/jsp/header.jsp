<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<title>Nemea - ${param.pageTitle}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link href="bare.min.css" rel="stylesheet"><!-- non-minified: https://github.com/ericclemmons/bare-css/tree/master/less -->
</head>
<body>
<header>
	<nav>
	<a href="."><img src="img/logo.png" width="60px" height="60px"></a>
			<ul>
				<li><a href=".">Home</a></li>
				<li><a href="Struttura">Struttura</a></li>
				<li><a href="Negozio">Negozio</a></li>
				<li><a href="Carrello">Carrello</a></li>
				<li>
					<c:choose>
						<c:when test="${utente == null}">
							<a>Login</a>
							<menu>
								<menuitem>
									<card>
										<form action="Login" method="post">
											<input type="text" name="username" placeholder="Username"><br>
											<input type="password" name="password" placeholder="Password"><br>
											<input type="submit" value="Login">
										</form>
									</card>
								</menuitem>
								<menuitem><a href="RegistrazioneForm">Registrazione</a></menuitem>
							</menu>
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
</nav>
			</header>

