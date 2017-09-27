<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'authorHome.jsp' starting page</title>
    
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
  		<h2 align="center"><font color="#FF9900">写者主页面</font></h2>
  	</div>
  	<div class="content-right">
  		<a href="proposalQuery.jsp"><input type="button" class="mybtn" value="提案查询" style="width: 180px;"></a><br><br>
  		<a href="proposalDefine.jsp"><input type="button" class="mybtn" value="提案编制" style="width: 180px;"></a><br><br>
  		<a href="informationMaintenance.jsp"><input type="button" class="mybtn" value="信息维护" style="width: 180px;"></a><br><br>
  		<a href="recommendOther.jsp"><input type="button" class="mybtn" value="推荐他人" style="width: 180px;"></a><br><br>
  	</div>
    
    
    
    
  </body>
</html>
