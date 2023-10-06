package web;

import java.io.IOException;
import java.io.PrintWriter;
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




@WebServlet("/Review")
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   /**
    * @see HttpServlet#HttpServlet()
    */
   public Review() {
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
		String avis= request.getParameter("avis");
		String name= request.getParameter("name");
		String job = request.getParameter("job");
		String avatar = request.getParameter("avatar");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JEEproject", "root", "");
			PreparedStatement pst = con.prepareStatement("INSERT INTO avis (nom_complet,job,avis,image) VALUES (?,?,?,?)");
			pst.setString(1, name);
			pst.setString(2, job);
			pst.setString(3, avis);
			pst.setString(4, avatar);
			pst.executeUpdate();
		
			response.sendRedirect("yamifood/index.jsp");
			
			pst.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
