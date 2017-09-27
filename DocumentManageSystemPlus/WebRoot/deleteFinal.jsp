<%@page import="entity.user"%>
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
	<link href="css/Template.css" rel="stylesheet" type="text/css" />
	<link href="css/CustomButton.css" rel="stylesheet" type="text/css" />
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
      
      user u = (user)request.getSession().getAttribute("user");
      String myURL = "#";
      if(u.getUserType() == 0) {
      	myURL = "authorHome.jsp";
      } else if(u.getUserType() == 1) {
      	myURL = "managerHome.jsp";
      }
   %>
  
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
		<h2 align="center"><font color="#FF9900">提案已被撤销</font></h2>
	</div>
	<div class="content-right">
		
		<a href="proposalQuery.jsp"><input type="button" value="回到提案查询页面" class="mybtn" style="width: 300px"/></a><br>
    	<a href=<%=myURL %>><input type="button" value="回到主页面" class="mybtn" style="width: 300px"/></a><br>
	</div>
  	
  
  
  
  

    
  </body>
</html>
