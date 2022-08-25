<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!-- For form submission and validations -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<script type="text/javascript" src="/js/app.js"></script>
	<!-- for bootstrap -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/main.css"/>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
	<body>
		<div class="container mt-5">
			<div class="header d-flex justify-content-between">
				<div class="header-left">
					<h1>Welcome, <c:out value="${userName.userName}"/></h1>
					<h5>Books from everyone's shelves</h5>
				</div>
				<div class="header-right d-flex flex-column justify-content-around">
					<a href="/logout">logout</a>
					<a href="/books/new">+ Add a book to my shelf</a>
				</div>
			</div>
			<table class="table table-bordered">
			  <thead class="table-dark">
			    <tr>
			      <th scope="col">account id</th>
			      <th scope="col">id</th>
			      <th scope="col">puuid</th>
			      <th scope="col">name</th>
			      <th scope="col">level</th>
			      
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="book" items="${allBooks}">
			  		<tr>
			  			<td><c:out value="${book.id}"/></td>
			  			<td><a href="/books/${book.id}"><c:out value="${book.bookName}"/></a></td>
		  				<td><c:out value="${book.author}"/></td>
		  				<td><c:out value="${book.user.userName}"/></td>
		  				<td><c:out value="${book.user.userName}"/></td>	 
		  				<td><c:out value="${book.user.userName}"/></td>	 			
		  			</tr>
			  	</c:forEach>
			  </tbody>
			</table>
		</div>
	</body>
</html>