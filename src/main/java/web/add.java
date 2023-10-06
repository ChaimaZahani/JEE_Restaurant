package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class add
 */
@WebServlet("/add")
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add() {
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
		
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String meal = request.getParameter("meal");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/JEEproject", "root", "");
			PreparedStatement pst = con.prepareStatement("INSERT INTO menu (type,meal,description,prix,image) VALUES (?,?,?,?,?) ");
			pst.setString(1, type);
			pst.setString(2, meal);
			pst.setString(3, description);
			pst.setString(4, price);
			pst.setString(5, image);
			pst.executeUpdate();
			response.sendRedirect("yamifood/admin.jsp");
			pst.close();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
