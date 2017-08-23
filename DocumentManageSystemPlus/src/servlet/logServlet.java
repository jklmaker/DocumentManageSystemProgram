package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbHelper;

import entity.manager;
import entity.user;

public class logServlet extends HttpServlet {

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

		request.setCharacterEncoding("utf-8");	//设置编码
		
		String name = request.getParameter("name");		//接收从index.jsp传过来的用户名和密码
		String password = request.getParameter("password");
		
		dbHelper db = new dbHelper();
		
		System.out.println("===1");
		
		//登录成功：当且仅当数据库中有这个用户的信息且这个用户的密码与传入的相同
		if(db.showQueryInfo(name)!=null && db.showQueryInfo(name).getPassword().equals(password)) {
			//把注册成功的用户名保存在session中
			user u = db.showQueryInfo(name);
			
			request.getSession().setAttribute("user", u);
			response.sendRedirect("../managerHome.jsp");	//登陆成功，重定向到管理员主页面
		}else{
			response.sendRedirect("../logFail.jsp");	//登陆失败，重定向到注册失败提示页面
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
