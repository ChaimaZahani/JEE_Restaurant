<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<br><br><br><br>
	<div class="container">
		<div class="card">
			<div class="card-header">add table</div>
			<div class="card-body">
				<form action="../add_table" method="post">
					<div hidden class="form-group">
						<label  class="control-label">ID :</label> <input type="text"
							name="id" class="form-control" />
					</div>
					
					<div class="form-group">
						<label class="control-label">num table :</label> <input type="text"
							name="numero" class="form-control"  />
					</div>
					
					
					<div>
						<button type="submit" class="btn btn-primary">Ajouter</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>
