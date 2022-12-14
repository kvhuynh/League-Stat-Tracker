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
				</div>
				<div class="header-right d-flex flex-column justify-content-around">
					<a href="/logout">logout</a>
					<a href="/books/new">+ Add a book to my shelf</a>
				</div>
			</div>
			<div class="match d-flex">
				<div class="container">
					<c:forEach var="key" items="${blueTeam.keySet()}">
						<p style="color:blue;"><c:out value="${blueTeam.get(key).get('summonerName')}"/></p>
						<p style="color:blue;"><c:out value="${blueTeam.get(key).get('championName')}"/></p>
						 <p style="color:blue;"><c:out value="${blueTeam.get(key).get('kills')}"/>/<c:out value="${blueTeam.get(key).get('deaths')}"/>/<c:out value="${blueTeam.get(key).get('assists')}"/></p>
						 <p style="color:blue;"><c:out value="${blueTeam.get(key).get('individualPosition')}"/></p>
						</c:forEach>
				</div>
	
				<div class="container">
					<c:forEach var="key" items="${redTeam.keySet()}">
						<p style="color:red;"><c:out value="${redTeam.get(key).get('summonerName')}"/></p>
						<p style="color:red;"><c:out value="${redTeam.get(key).get('championName')}"/></p>
						 <p style="color:red;"><c:out value="${redTeam.get(key).get('kills')}"/>/<c:out value="${redTeam.get(key).get('deaths')}"/>/<c:out value="${redTeam.get(key).get('assists')}"/></p>
						<p style="color:red;"><c:out value="${redTeam.get(key).get('individualPosition')}"/></p>
					</c:forEach>
				</div>
			</div>

			<table class="table table-bordered">
			  <thead class="table-dark">
			    <tr>
			      <th scope="col">account id</th>
			      <th scope="col">id</th>
			      <th scope="col">puuid</th>
			     <!--  <th scope="col">name</th> -->
			      <th scope="col">level</th>
			      
			    </tr>
			  </thead>
			  <tbody>
			  	<tr>
			  		<td>accountID: <c:out value="${summonerData.accountId}"/></td>
			  		<td>summonerID: <c:out value="${summonerData.summonerId}"/></td>
			  		<td>puuid: <c:out value="${summonerData.puuid}"/></td>
			  		<td>level: <c:out value="${summonerData.level}"/></td>
			  	</tr>	
			  
			  
			  
			  	<c:forEach var="match" items="${matchHistory}">
			  		<tr>
			  			<td><c:out value="${match}"/></td>		
		  			</tr>
			  	</c:forEach>
			  </tbody>
			</table>
		</div>
	</body>
</html>