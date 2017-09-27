<%@page import="util.dbHelper"%>
<%@page import="entity.user"%>
<%@page import="dao.apply"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recommendOther.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/Template.css" rel="stylesheet" type="text/css" />
	<link href="css/CustomButton.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  	<jsp:useBean  id="user" class="entity.user" scope="session"/>
	<div class="header">
		<div class="header-tip">
			<p align="right"><font color="#FF9900">欢迎您:<jsp:getProperty name="user" property="name"/><a href="exit.jsp"><input type="button" value="注销" class="mybtn" onclick="return confirm('真的要注销吗')"></a></font></p>
		</div>
		<div class="header-main">
			<h2>能力规范文稿管理系统</h2>
		</div>
	</div>
	<div class="content-left">
		<h2 align="center"><font color="#FF9900">推荐他人</font></h2>
	</div>
	<div class="content-right">
		<p>下面的表格显示了当前<font color="red">需要您推荐的未审核用户</font>，单击<font color="red">"填写推荐信息"</font>按钮即可在下一页填写您对他的推荐理由</p>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<thead>
	    		<tr>
	    			<td>用户名</td>
	    			<td>联系方式</td>
	    			<td>行业分会</td>
	    			<td>专委会</td>
	    			<td>申请理由</td>
	    			<td>备注</td>
	    			<td>按钮</td>
	    		</tr>
	    	</thead>
	    	<tbody>
	    		<%
	    			dbHelper db = new dbHelper();
	    			List<apply> list = db.listApplyByRecommender(user.getName());
	    			for(int i=0;i<list.size();i++) {
	    				String recommendedPerson = list.get(i).getRecommendedPerson();
	    				user u = db.showQueryInfo(recommendedPerson);
	    			
	    				out.print("<tr>");
	    				
	    				//用户名
	    				out.print("<td>");
	    				out.print(list.get(i).getRecommendedPerson());
	    				out.print("</td>");
	    				
	    				//联系方式
	    				out.print("<td>");
	    				out.print(u.getTelephone());
	    				out.print("</td>");
	    				
	    				//行业分会
	    				out.print("<td>");
	    				out.print(u.getIndustryBranch());
	    				out.print("</td>");
	    				
	    				//专委会
	    				out.print("<td>");
	    				out.print(u.getSpecialCommittee());
	    				out.print("</td>");
	    				
	    				//申请理由
	    				out.print("<td>");
	    				out.print(list.get(i).getApplyReason());
	    				out.print("</td>");
	    				
	    				//备注
	    				out.print("<td>");
	    				out.print("该用户希望得到您的推荐");
	    				out.print("</td>");
	    				
	    				//按钮
	    				out.print("<td>");
	    				out.print("<form action='recommendPlus.jsp' method='post'>");
		    			out.print("<input name='recommendedPerson' type='hidden' class='mybtn' readonly='readonly' value='"+recommendedPerson+"' />");
		    			out.print("<input type='submit' value='填写推荐信息'>");
		    			out.print("</form>");
	    				out.print("</td>");
	    				
	    				out.print("</tr>");
	    			}
	    		%>
	    	</tbody>
	    </table>
	    <%
    	user u = (user)request.getSession().getAttribute("user");
		String myURL = "#";
		if(u.getUserType() == 0) {
		myURL = "authorHome.jsp";
		} else if(u.getUserType() == 1) {
		myURL = "managerHome.jsp";
		}
	     %>
	     <hr>
	     <a href=<%=myURL %>><input type="button" value="返回主页面" class="mybtn" style="width: 220px;"></a>
	    
	</div>
  
  
  
  
  
  
  
  
    
  </body>
</html>
