<%@page import="util.dbHelper"%>
<%@ page import="entity.*" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	user u = (user)request.getSession().getAttribute("user");
	String name = u.getName();
	dbHelper db = new dbHelper();
	managerBasicInfo mbi = db.showManagerBasicQueryInfo(name);
	int adminType = mbi.getAdminType();
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'proposalApproval.jsp' starting page</title>
    
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
	<script type="text/javascript">
	
		var adminType = '<%=adminType%>'
	
		function fun1(){
			if(adminType == 1) {
				return true;
			}else{
				alert("由于您的身份不是专委会管理人员，您不能使用此功能");
				return false;
			}
		}
		
		function fun2(){
			if(adminType == 2) {
				return true;
			}else{
				alert("由于您的身份不是行业分会管理人员，您不能使用此功能");
				return false;
			}
		}
		
		function fun3(){
			if(adminType == 3) {
				return true;
			}else{
				alert("由于您的身份不是研究会管理人员，您不能使用此功能");
				return false;
			}
		}
	</script>

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
  		<h2 align="center"><font color="#FF9900">提案审批页面</font></h2>
  	</div>
  	<div class="content-right">
	  	<table>
	    	<tr>
	    		<td><a href="recommendProposal.jsp" id="a1" onclick="return fun1()"><input type="button" value="推荐(专委会)" class="mybtn" style="width: 200px;" onclick="return fun1()" /></a></td>
	    		<td><a href="recordProposal.jsp" id="a2" onclick="return fun2()"><input type="button" value="备案(行业分会)" class="mybtn" style="width: 200px;" onclick="return fun2()" /></a></td>
	    		<td><a href="buildProposal.jsp" id="a3" onclick="return fun3()"><input type="button" value="立案(研究会)" class="mybtn" style="width: 200px;" onclick="return fun3()" /></a></td>
	    		<td><a href="managerHome.jsp" id="a4" ><input type="button" value="回到管理员主页" class="mybtn" style="width: 200px;" /></a></td>
	    	</tr>
	    </table>
  	</div>
  </body>
</html>
