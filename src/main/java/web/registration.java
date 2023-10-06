package web;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   /**
    * @see HttpServlet#HttpServlet()
    */
   public registration() {
       super();
       // TODO Auto-generated constructor stub
   }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String name= request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JEEproject", "root", "");
			PreparedStatement pst = con.prepareStatement("SELECT num_table FROM tables WHERE dispo=1");
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String num=rs.getString(1);
				int n=Integer.parseInt(num);
				String data="UPDATE tables SET dispo=0 WHERE num_table=?";
				pst=con.prepareStatement(data);
				pst.setLong(1, n);
				pst.executeUpdate();
				String reservation="table reserver";
				session.setAttribute("reservation", reservation);
				pst = con.prepareStatement("INSERT INTO booking (nom_client,email_client,numero_client,user_id) VALUES (?,?,?,?)");
				pst.setString(1, name);
				pst.setString(2, email);
				pst.setString(3, phone);
				pst.setInt(4, (int) session.getAttribute("user_id"));
				pst.executeUpdate();
				response.sendRedirect("yamifood/reservation.jsp");
				
			}
			else {
				
				String reservation="erreur de reservation";
				session.setAttribute("reservation", reservation);
				response.sendRedirect("yamifood/reservation.jsp");
			}
			rs.close();
			pst.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
