package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.dbHelper;

import entity.user;

public class regServlet extends HttpServlet {

	private String regFail1 = "reg fail.some of elements are empty.";
	private String regFail2 = "reg fail.the username you input is already existing in Database.";
	
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

		request.setCharacterEncoding("utf-8");	//设置编码
		
		//接收从regist.jsp传过来的用户信息
		String name = request.getParameter("name");							//名字
		String password = request.getParameter("password");					//密码
		String sex = request.getParameter("sex");							//性别
		String birthday = request.getParameter("birthday");					//出生日期
		String address = request.getParameter("address");					//家庭住址
		String telephone = request.getParameter("telephone");				//联系方式
		String inviter = request.getParameter("inviter");					//推荐人(选填)
		String industryBranch = request.getParameter("industryBranch");		//行业分会
		String specialCommittee = request.getParameter("specialCommittee");	//专委会
		
		user u = new user(name, sex, birthday, address, telephone, industryBranch, specialCommittee, password);
		u.setUserType(1);
		
		if(inviter != null) {
			u.setInviter(inviter);
		}
		
		dbHelper db = new dbHelper();
		if(name==null || name.length()==0 || password==null || password.length()==0 || sex==null || sex.length()==0 || birthday==null || birthday.length()==0 || address==null || address.length()==0 || telephone==null || telephone.length()==0 || industryBranch==null || industryBranch.length()==0 || industryBranch.equals("请选择") || specialCommittee==null || specialCommittee.length()==0 || specialCommittee.equals("请先选择行业分会") || db.showQueryInfo(name) != null) {
			//注册失败(用户已经存在或者输入信息不完善)
			String failInfo = db.showQueryInfo(name)!=null?regFail2:regFail1;
			
			//送一个表示注册失败的cookie回去
			Cookie regFailCookie = new Cookie("regFail",URLEncoder.encode(failInfo, "utf-8"));
			regFailCookie.setPath("/");
			regFailCookie.setMaxAge(864000);
			response.addCookie(regFailCookie);
			
			//注册失败，重定向到注册页面
			response.sendRedirect("../regist.jsp");
			
		}else{
			//跳转至成功页面
			try {
				db.addUser(u);
			} catch (SQLException e) {
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
