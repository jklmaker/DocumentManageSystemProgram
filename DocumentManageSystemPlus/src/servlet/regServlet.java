package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbHelper;

import entity.user;

public class regServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public regServlet() {
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
		
		//���մ�regist.jsp���������û���Ϣ
		String name = request.getParameter("name");							//����
		String password = request.getParameter("password");					//����
		String sex = request.getParameter("sex");							//�Ա�
		String birthday = request.getParameter("birthday");					//��������
		String address = request.getParameter("address");					//��ͥסַ
		String telephone = request.getParameter("telephone");				//��ϵ��ʽ
		String inviter = request.getParameter("inviter");					//�Ƽ���(ѡ��)
		String industryBranch = request.getParameter("industryBranch");		//��ҵ�ֻ�
		String specialCommittee = request.getParameter("specialCommittee");	//רί��
		
		user u = new user(name, sex, birthday, address, telephone, industryBranch, specialCommittee, password);
		u.setUserType(1);
		
		if(inviter != null) {
			u.setInviter(inviter);
		}
		
		dbHelper db = new dbHelper();
		if(name==null || name.length()==0 || password==null || password.length()==0 || sex==null || sex.length()==0 || birthday==null || birthday.length()==0 || address==null || address.length()==0 || telephone==null || telephone.length()==0 || industryBranch==null || industryBranch.length()==0 || specialCommittee==null || specialCommittee.length()==0 ||db.showQueryInfo(name) != null) {
			//ע��ʧ�ܣ����û��Ѵ���
			//��ת��ʧ��ҳ��
			response.sendRedirect("../regFail.jsp");
		}else{
			//��ת���ɹ�ҳ��
			try {
				db.addUser(u);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().setAttribute("user", u);
			response.sendRedirect("../regSuccess.jsp");
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
