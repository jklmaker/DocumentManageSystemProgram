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

		request.setCharacterEncoding("utf-8");	//���ñ���
		
		String name = request.getParameter("name");		//���մ�index.jsp���������û���������
		String password = request.getParameter("password");
		
		dbHelper db = new dbHelper();
		
		user u = db.showQueryInfo(name);
		
		if(u==null) {
			//˵���û���������
			loginFail = "The username you input is not existed";
			flag = 1;
		}
		if(u!=null && !u.getPassword().equals(password)) {
			//�û������ڣ����������
			loginFail = "The password you input is invalid";
			flag = 1;
		}
//		if(u!=null && u.getPassword().equals(password) && u.getUserType()==2) {
//			//�û����������ȷ����δ�����
//			loginFail = "The user is not checked";
//			flag = 1;
//		}
		
		if(flag == 0){		//flagΪ0����ʾ����Ҫ�󣬵�¼�ɹ�
			request.getSession().setAttribute("user", u);			
			//��¼�ɹ��������û��������ض�����Ӧ��ҳ��
			if(u.getUserType() == 0) {
				//0Ϊд��
				response.sendRedirect("../authorHome.jsp");
			}else if(u.getUserType() == 1) {
				//1Ϊ����Ա
				response.sendRedirect("../managerHome.jsp");
			}else if(u.getUserType() == 2) {
				//2Ϊδ��˵�д��
				response.sendRedirect("../uncheckedUserHome.jsp");
			}
		}else{				//flagΪ1����ʾ��¼ʧ��
			//��һ����ʾ��½ʧ�ܵ�cookie��ȥ
			Cookie loginFailCookie = new Cookie("loginFail",URLEncoder.encode(loginFail, "utf-8"));
			loginFailCookie.setPath("/");
			loginFailCookie.setMaxAge(864000);
			response.addCookie(loginFailCookie);
			
			System.out.println("servlet��cookie��:"+request.getCookies().length);
			
			//��½ʧ�ܣ��ض��򵽵�¼ҳ��
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
