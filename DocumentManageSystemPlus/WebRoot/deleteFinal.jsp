<%@page import="util.dbHelper"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteFinal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <%
  	request.setCharacterEncoding("utf-8");
  	Cookie[] cookies = request.getCookies();
  	if(cookies!=null&&cookies.length>0)
      {
           for(Cookie c:cookies)
           {
              if(c.getName().equals("proposalId"))
              {
              	   new dbHelper().delProposal(Integer.valueOf(c.getValue()));
                   c.setMaxAge(0); 			//设置Cookie失效
                   response.addCookie(c); 	//重新保存
              }
           }
      }
   %>
  
  <body>
    <h1>提案已被撤销</h1>
    <hr>
    <a href="proposalQuery.jsp"><input type="button" value="回到提案查询页面"/></a><br>
    <a href="managerHome.jsp"><input type="button" value="回到主页面"/></a><br>
  </body>
</html>
