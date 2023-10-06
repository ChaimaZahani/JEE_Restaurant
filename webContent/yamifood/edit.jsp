<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JEEproject", "root", "");
Statement stat = conn.createStatement();
%>

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
			<div class="card-header">Modification de menu</div>
			<div class="card-body">
				<form action="" method="post">
					<%
					
						
						String u = request.getParameter("id");
						int num = Integer.parseInt(u);
						String data = " SELECT * FROM menu WHERE id='" + num + "' ";
						ResultSet res = stat.executeQuery(data);
						while (res.next()) {
					%>
					<div hidden class="form-group">
						<label  class="control-label">ID :</label> <input type="text"
							name="id" class="form-control" value='<%=res.getString("id")%>'/>
					</div>
					<div class="form-group">
						<label class="control-label">type :</label>
						<select name="type">
						<option>dinner</option>
						<option>lunch</option>
						<option>drinks</option>
						</select>
					</div>
					<div class="form-group">
						<label class="control-label">meal :</label> <input type="text"
							name="meal" class="form-control" value='<%=res.getString("meal") %>' />
					</div>
					<div class="form-group">
						<label class="control-label">description :</label> <input type="text"
							name="description" class="form-control" value='<%=res.getString("description") %>' />
					</div>
					<div class="form-group">
						<label class="control-label">price :</label> <input
							type="text" name="price" class="form-control" value='<%=res.getString("prix") %>' />
					</div>
					<div class="form-group">
						<label class="control-label">image :</label> <input
							type="file" name="image" class="form-control" value='<%=res.getString("image") %>' />
					</div>
					<%
					session.setAttribute("image", res.getString("image"));
					}
						
					%>
					<div>
						<button type="submit" class="btn btn-primary">Modifier</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<%
String id=request.getParameter("id");
String type=request.getParameter("type");
String meal=request.getParameter("meal");
String description=request.getParameter("description");
String price=request.getParameter("price");
String image=request.getParameter("image");
%>

<%
if(image!=null){
if(image.length()==0){
	image=session.getAttribute("image").toString();
}}
if(id!=null && type!=null && meal!=null && description!=null && price!=null){
	String query= "UPDATE menu set  type=? , meal=? ,description=? ,prix=? ,image=? where id='"+id+"'";
	PreparedStatement stmt=conn.prepareStatement(query);
	stmt.setString(1,type);
	stmt.setString(2,meal);
	stmt.setString(3,description);
	stmt.setString(4,price);
	stmt.setString(5,image);
	stmt.executeUpdate();
	response.sendRedirect("admin.jsp");
	
}

%>
</body>
</html>
