package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.proposal;
import entity.recommendProposal;
import entity.user;

import util.dbHelper;

public class recommendProposalOperation extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public recommendProposalOperation() {
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

		request.setCharacterEncoding("utf-8");	//…Ë÷√±‡¬Î
		String proposalIdCollection = request.getParameter("proposalIdCollection");
		String[] recommendProposalIdCollection = proposalIdCollection.split("_");
		dbHelper db = new dbHelper();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(String temp:recommendProposalIdCollection) {
			int recommendProposalId = Integer.valueOf(temp);
			proposal p = db.showQueryInfoPlus(recommendProposalId);
			String recommendProposalTitle = p.getTitle();
			user u = (user) request.getSession().getAttribute("user");
			String recommendReviewerName = u.getName();
			String recommendReason = request.getParameter("recommendReason");
			String recommendTimeStamp = sdf.format(new Date());
			recommendProposal rp = new recommendProposal(recommendProposalId, recommendProposalTitle, recommendReviewerName, recommendReason, recommendTimeStamp);
			db.addRecommendProposal(rp);
			
		}
		response.sendRedirect("../recommendProposal.jsp");
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
