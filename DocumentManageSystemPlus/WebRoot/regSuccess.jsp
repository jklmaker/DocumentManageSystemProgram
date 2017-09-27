<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regSuccess.jsp' starting page</title>
    
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
  	<div class="header">
  		<div class="header-tip">
  			<p align="right"><font color="#FF9900">欢迎注册</font></p>
  		</div>
  		<div class="header-main">
  			<h2>能力规范文稿管理系统</h2>
  		</div>
  	</div>
  	<div class="content-left">
  		<h2 align="center"><font color="#FF9900">用户注册成功</font></h2>
  	</div>
  	<div class="content-right">
	  	<h2>你的信息如下所示</h2>
	    <jsp:useBean  id="user" class="entity.user" scope="session"/>
	    <p>实例用户名：<jsp:getProperty name="user" property="name"/></p>
	    <table>
	    	<tr>
	    		<td>身份</td>
	    		<td>
	    		<%
	          	//	String str = user.getUserType()==0?"写者":"管理员";
	          		String str = "";
	          		if(user.getUserType() == 0) {
	          			str = "写者";
	          		}else if(user.getUserType() == 1) {
	          			str = "管理员";
	          		}else if(user.getUserType() == 2) {
	          			str = "写者(未审核)";
	          		}else{
	          			str = "未知身份";
	          		}
	          	 %>
	          	 <%=str %>
	          	 </td>
	    	</tr>
	    	<tr>
	    		<td>名字</td>
	    		<td><jsp:getProperty name="user" property="name"/></td>
	    	</tr>
	    	<tr>
	    		<td>性别</td>
	    		<td><jsp:getProperty name="user" property="sex"/></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期</td>
	    		<td><jsp:getProperty name="user" property="birthday"/></td>
	    	</tr>
	    	<tr>
	    		<td>家庭住址</td>
	    		<td><jsp:getProperty name="user" property="address"/></td>
	    	</tr>
	    	<tr>
	    		<td>联系方式</td>
	    		<td><jsp:getProperty name="user" property="telephone"/></td>
	    	</tr>
	    	<tr>
	    		<td>推荐人(选填)</td>
	    		<td>
	    			<%
	    				String inviter = user.getInviter();
	    				if(inviter==null || inviter.length()==0) {
	    					inviter = "暂无";
	    				}
	    			 %>
	    			 <%=inviter %>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>行业分会</td>
	    		<td><jsp:getProperty name="user" property="industryBranch"/></td>
	    	</tr>
	    	<tr>
	    		<td>专委会</td>
	    		<td><jsp:getProperty name="user" property="specialCommittee"/></td>
	    	</tr>
	    </table>
	    <hr>
	    <a href="index.jsp"><input type="button" class="mybtn" value="返回登录页面" style="width: 150px" /></a>
  	</div>
  
  
  
  
    
  </body>
</html>
