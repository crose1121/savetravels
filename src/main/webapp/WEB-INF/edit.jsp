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
	<div class="container">
		<h1>Edit Expense</h1>
		<form:form action="/expenses/update/${expense.id}" method="post" modelAttribute="expense" style="width: 50%" class="container">
			<input type="hidden" name="_method" value="put">
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
        <form:input type="number" step="0.01" path="amount" class="form-control"/>
    </p>
    <p>
        <form:label path="description">Description</form:label>
        <br /><form:errors path="description" class="text-danger"/>     
        <form:textarea path="description" class="form-control"/>
    </p>    
    <p>
    <input type="submit" value="Submit" class="btn btn-info"/>
    <a href="/expenses" class="btn btn-warning">Home</a>
    <a href="/expenses/delete/${expense.id}" class="btn btn-danger">Delete</a>
    </p>
	</div>
		</form:form>
	</div>
</body>
</html>