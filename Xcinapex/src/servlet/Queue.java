package servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Employee;
import Beans.Movie;
import Beans.Customer;
import utils.DBUtils;
import utils.setUpConnection;

@WebServlet("/Queue")
public class Queue extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Queue() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		HttpSession session = request.getSession(true);
		//System.out.println(session.getAttribute("loggedInUser").getClass());
		if (session.getAttribute("loggedInUser")!=null){//make sure someone is logged in to check
			Object usertype = session.getAttribute("loggedInUser");
			if(!(usertype instanceof Customer)) 
			 {
				RequestDispatcher dispatcher = request.getServletContext()
		                .getRequestDispatcher("/WEB-INF/view/404CustOnly.jsp");
		        dispatcher.forward(request, response);
			   return; //necessary to make the redirect happen right now
			 }
		}else if(session.getAttribute("loggedInUser")==null){
			RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/view/404.jsp");
	        dispatcher.forward(request, response);
		   return;
		}
		
		String jdbc_driver= "com.mysql.jdbc.Driver";  
		String url = "jdbc:mysql://localhost:3306/" + setUpConnection.DATABASENAME;
   		String user = setUpConnection.USERNAME;
   		String pass = setUpConnection.PASSWORD;
   		
   		java.sql.Connection conn = null;
	   	
   		List<Movie> allMovies=null;
		String errorString = null;
		try{
			Class.forName(jdbc_driver).newInstance();
			conn = DriverManager.getConnection(url, user, pass);
			Customer cus =(Customer) session.getAttribute("loggedInUser");
			
			String id = cus.getCustId();
			
			System.out.println(cus +" "+ id+" "+cus.getCustId());
			allMovies= DBUtils.getCustomerQueue(conn, id);
			request.setAttribute("errorString", errorString);
		request.setAttribute("MovieList", allMovies);
		RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/view/Queue.jsp");
        dispatcher.forward(request, response);
		}catch (java.lang.NullPointerException e){
			RequestDispatcher dispatcher = request.getServletContext()
	                .getRequestDispatcher("/WEB-INF/view/404.jsp");
	        dispatcher.forward(request, response);
   		}catch (Exception e) {
        // Any error is grounds for rollback
        try { 
          conn.rollback();
          System.out.println("Rolling back..");
          e.printStackTrace();
        }
        catch (SQLException ignored) { } 
      }
		
		
   	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}