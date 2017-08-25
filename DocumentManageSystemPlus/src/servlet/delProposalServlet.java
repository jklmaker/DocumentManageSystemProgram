package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class delProposalServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public delProposalServlet() {
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
		String testId = request.getParameter("testId");							//����
		
		if(testId!=null && testId.length()>0) {
			//�ѱ�����������ʾ���᰸������Ϣ������cookie��
			String proposalId = URLEncoder.encode(request.getParameter("testId"), "utf-8");
			Cookie proposalIdCookie = new Cookie("proposalId",proposalId);
			proposalIdCookie.setPath("/");
			
			proposalIdCookie.setMaxAge(864000);
			response.addCookie(proposalIdCookie);
			
			Cookie[] cookies = request.getCookies();
			for(Cookie c:cookies) {
				if(c.getName().equals("proposalTitle"))
	            {
	                c.setMaxAge(0); 			//����CookieʧЧ
	                response.addCookie(c); 		//���±��档    
	            }
			}
			
			//ҳ���ض���
			response.sendRedirect("../deleteProposal.jsp");
		} else {
			Cookie[] cookies = request.getCookies();
			if(cookies!=null && cookies.length>0) {
				for(Cookie c:cookies) {
					if(c!=null && c.getName().equals("proposalId")) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
			response.sendRedirect("../proposalQuery.jsp");
			
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
