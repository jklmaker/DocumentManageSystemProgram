package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbHelper;

import entity.comment;
import entity.user;

public class commentProposal extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public commentProposal() {
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
		
		//接收从getProposalDetail.jsp传过来的用户信息
		String commentContent = request.getParameter("commentContent");
		String commentTypeStr = request.getParameter("commentType");
		int commentType = 0;
		if(commentTypeStr!=null && commentTypeStr.equals("agree")) {
			commentType = 1;
		}else if(commentTypeStr!=null && commentTypeStr.equals("disagree")) {
			commentType = 2;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String commentTimeStamp = sdf.format(new Date());
		String commentProposalIdStr = request.getParameter("commentProposalId");
		int commentProposalId = 0;
		if(commentProposalIdStr != null) {
			commentProposalId = Integer.valueOf(commentProposalIdStr);
		}
		String commentProposalTitle = request.getParameter("commentProposalTitle");
		user u = (user) request.getSession().getAttribute("user");
		String commentReviewerName = u.getName();
		//封装到一个javaBean对象里边
		comment c = new comment(commentProposalId, commentProposalTitle, commentReviewerName, commentContent, commentTimeStamp, commentType);
		dbHelper db = new dbHelper();
		//往comment表中添加信息
		db.addComment(c);
		//往proposal表中更新附议数/反对数
		if(commentType == 1) {
			db.altAgreeNum(commentProposalId);
		}else if(commentType == 2){
			db.altDisagreeNum(commentProposalId);
		}
		
		
		//送一个表示当前正在浏览提案ID的cookie回去
		Cookie proposalNowReviewingCookie = new Cookie("proposalNowReviewing",URLEncoder.encode(commentProposalIdStr, "utf-8"));
		proposalNowReviewingCookie.setPath("/");
		proposalNowReviewingCookie.setMaxAge(864000);
		response.addCookie(proposalNowReviewingCookie);
		
		//重定向到当前页面
		if(u.getUserType() == 0) {
			response.sendRedirect("../getProposalDetail.jsp");
		}else if(u.getUserType() == 1) {
			response.sendRedirect("../getProposalDetailAdmin.jsp");
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
