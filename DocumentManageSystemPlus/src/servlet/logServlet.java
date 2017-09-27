package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbHelper;

import entity.manager;
import entity.user;

public class logServlet extends HttpServlet {

	private String loginFail = "login fail";
	
	/**
	 * Constructor of the object.
	 */
	public logServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int flag=0;

		request.setCharacterEncoding("utf-8");	//设置编码
		
		String name = request.getParameter("name");		//接收从index.jsp传过来的用户名和密码
		String password = request.getParameter("password");
		
		dbHelper db = new dbHelper();
		
		user u = db.showQueryInfo(name);
		
		if(u==null) {
			//说明用户名不存在
			loginFail = "The username you input is not existed";
			flag = 1;
		}
		if(u!=null && !u.getPassword().equals(password)) {
			//用户名存在，密码输错了
			loginFail = "The password you input is invalid";
			flag = 1;
		}
//		if(u!=null && u.getPassword().equals(password) && u.getUserType()==2) {
//			//用户名密码均正确，但未被审核
//			loginFail = "The user is not checked";
//			flag = 1;
//		}
		
		if(flag == 0){		//flag为0，表示符合要求，登录成功
			request.getSession().setAttribute("user", u);			
			//登录成功，根据用户的类型重定向到相应的页面
			if(u.getUserType() == 0) {
				//0为写者
				response.sendRedirect("../authorHome.jsp");
			}else if(u.getUserType() == 1) {
				//1为管理员
				response.sendRedirect("../managerHome.jsp");
			}else if(u.getUserType() == 2) {
				//2为未审核的写者
				response.sendRedirect("../uncheckedUserHome.jsp");
			}
		}else{				//flag为1，表示登录失败
			//送一个表示登陆失败的cookie回去
			Cookie loginFailCookie = new Cookie("loginFail",URLEncoder.encode(loginFail, "utf-8"));
			loginFailCookie.setPath("/");
			loginFailCookie.setMaxAge(864000);
			response.addCookie(loginFailCookie);
			
			System.out.println("servlet的cookie数:"+request.getCookies().length);
			
			//登陆失败，重定向到登录页面
			response.sendRedirect("../index.jsp");			
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
