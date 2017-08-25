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

  </head>
  
  <body>
  	<%
  		dbHelper db = new dbHelper();
  		List<user> list = db.listUser();
  		int amount = list.size();
  		String str = "";
  	 %>
    <h1>信息维护</h1>
    <hr>
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
  </body>
</html>
