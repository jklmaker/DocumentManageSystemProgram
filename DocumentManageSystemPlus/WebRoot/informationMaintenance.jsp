<%@page import="util.dbHelper"%>
<%@page import="entity.user"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'informationMaintenance.jsp' starting page</title>
    
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
  	<%
  		dbHelper db = new dbHelper();
  		List<user> list = db.listUser();
  		int amount = list.size();
  		String str = "";
  	 %>
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
		<h2 align="center"><font color="#FF9900">信息维护</font></h2>
	</div>
	<div class="content-right">
		<table border="1px" cellpadding="0px" cellspacing="0px"> 
    	<tr>
    		<td>用户属性</td>
    		<td>名字</td>
    		<td>性别</td>
    		<td>出生日期</td>
    		<td>家庭住址</td>
    		<td>联系方式</td>
    		<td>推荐人(选填)</td>
    		<td>行业分会</td>
    		<td>专委会</td>
    	</tr>
    	<%
    		while(amount>=0) {
    			amount--;
    			if(amount>=0) {
    				user temp = list.get(amount);
    				out.print("<tr>");
    				
    				out.print("<td>");
    				out.print(temp.getUserType());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getName());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getSex());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getBirthday());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getAddress());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getTelephone());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getInviter());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getIndustryBranch());
    				out.print("</td>");
    				
    				out.print("<td>");
    				out.print(temp.getSpecialCommittee());
    				out.print("</td>");
    				
    				out.print("</tr>");
    			}
    		}
    	 %>
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
