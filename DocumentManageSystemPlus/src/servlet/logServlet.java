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

		request.setCharacterEncoding("utf-8");	//���ñ���
		
		String name = request.getParameter("name");		//���մ�index.jsp���������û���������
		String password = request.getParameter("password");
		
		dbHelper db = new dbHelper();
		
		System.out.println("===1");
		
		//��¼�ɹ������ҽ������ݿ���������û�����Ϣ������û��������봫�����ͬ
		if(db.showQueryInfo(name)!=null && db.showQueryInfo(name).getPassword().equals(password)) {
			//��ע��ɹ����û���������session��
			user u = db.showQueryInfo(name);
			
			request.getSession().setAttribute("user", u);
			response.sendRedirect("../managerHome.jsp");	//��½�ɹ����ض��򵽹���Ա��ҳ��
		}else{
			response.sendRedirect("../logFail.jsp");	//��½ʧ�ܣ��ض���ע��ʧ����ʾҳ��
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
