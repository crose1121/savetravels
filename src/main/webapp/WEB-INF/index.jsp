<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Travels</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<body>
    <div class="container"> <!-- Beginning of Container -->
        <h1 style="color: blue">Save Travels</h1>
        
        <table class="table table-secondary container">
		<thead>
			<tr>
				<th scope="col">#ID</th>
				<th scope="col">Name</th>
				<th scope="col">Vendor</th>
				<th scope="col">Amount</th>
				<th scope="col">Description</th>
				<th scope="col">Actions: </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="expense" items="${allExpenses}">
				<tr>
					<th scope="row">${expense.id}</th>
					<td><a href="/books/${expense.id}">${expense.expenseName}</a></td>
					<td>${expense.vendor}</td>
					<td>$${expense.amount}</td>
					<td>${expense.description}</td>
					<td>
					<a href="/expense/edit/${expense.id}">Edit</a> || 
					<a href="/expense/delete/${expense.id}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<hr />
        
        
        <h3 style="text-align: center">Add an Expense</h3>
        	<form:form action="/expenses" method="post" modelAttribute="expense" style="width: 50%" class="container">
	<div class="form-group">
	<p>
        <form:label path="expenseName">Name</form:label>
        <br /><form:errors path="expenseName" class="text-danger"/>
        <form:input path="expenseName" class="form-control"/>
    </p>
    <p>
        <form:label path="vendor">Vendor</form:label>
        <br /><form:errors path="vendor" class="text-danger"/>
        <form:input path="vendor" class="form-control"/>
    </p>
    <p>
        <form:label path="amount">Amount</form:label>
        <br /><form:errors path="amount" class="text-danger"/>
        <form:input type="number" path="amount" class="form-control"/>
    </p>
    <p>
        <form:label path="description">Description</form:label>
        <br /><form:errors path="description" class="text-danger"/>     
        <form:textarea path="description" class="form-control"/>
    </p>    
    <input type="submit" value="Submit"/>    
	</div>
	</form:form> 
    </div> <!-- End of Container -->
</body>
</html>