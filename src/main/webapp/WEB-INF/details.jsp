<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Expense Details</title>
</head>
<body>
	<div class="container">
	
	<h1 style="color: blue">Expense Details</h1>
	<table class="table table-secondary container">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Vendor</th>
				<th scope="col">Amount</th>
				<th scope="col">Description</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td>${expense.expenseName}</td>
					<td>${expense.vendor}</td>
					<td>$${expense.amount}</td>
					<td>${expense.description}</td>
					<td>
					<a href="/expenses/edit/${expense.id}">Edit</a> || 
					<a href="/expenses/delete/${expense.id}">Delete</a> ||
					<a href="/expenses">Home</a>
					</td>
				</tr>
		</tbody>
	</table>
	

	</div>
</body>
</html>