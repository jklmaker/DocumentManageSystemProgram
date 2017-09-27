package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbHelper;
import entity.build;
import entity.record;
import entity.user;

public class buildProposalOperation extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public buildProposalOperation() {
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
		String buildTitle = request.getParameter("buildTitle");		//��������
		String buildContent = request.getParameter("buildContent");	//��������
		user u = (user)request.getSession().getAttribute("user");
		String buildReviewerName = u.getName();		//ִ�������������û�������(����ǰ����Ա�û����û���)
		int buildProposalId = Integer.valueOf(request.getParameter("buildProposalId"));	//���������᰸ID
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String buildTimeStamp = sdf.format(new Date());		//����ʱ��
		build b = new build(buildProposalId, buildReviewerName, buildTimeStamp, buildTitle, buildContent);
		dbHelper db = new dbHelper();
		db.addBuild(b);
		
		response.sendRedirect("../buildProposal.jsp");
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
