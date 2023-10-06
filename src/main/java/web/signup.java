package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   /**
    * @see HttpServlet#HttpServlet()
    */
   public signup() {
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
		String user= request.getParameter("txt");
		String email = request.getParameter("email");
		String pass = request.getParameter("pswd");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JEEproject", "root", "");
			PreparedStatement pst = con.prepareStatement("INSERT INTO users (nom,email,password) VALUES (?,?,?)");
			pst.setString(1, user);
			pst.setString(2, email);
			pst.setString(3, pass);
			pst.executeUpdate();
			
				String erreur="sign up done sussesfully";
				session.setAttribute("erreur", erreur);
				response.sendRedirect("yamifood/auth2.jsp");
			pst.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	
	}

}
