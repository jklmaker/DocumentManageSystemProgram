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

  </head>
  
  <body>
  <!-- 
  	private int userType;		//0为写者，1为管理员
	
	private String name;		//名字
	private String sex;			//性别
	private String birthday;	//出生日期
	private String address;		//家庭住址
	private String telephone;	//联系方式
	private String inviter;		//推荐人(选填)
	private String industryBranch;	//行业分会
	private String specialCommittee;	//专委会
	private String password;	//密码
   -->
    <h1>用户注册成功</h1>
    <hr>
    <h2>你的信息如下所示</h2>
    <jsp:useBean  id="user" class="entity.user" scope="session"/>
    <p>实例用户名：<jsp:getProperty name="user" property="name"/></p>
    <table>
    	<tr>
    		<td>身份</td>
    		<td>
    		<%
          		String str = user.getUserType()==0?"写者":"管理员";
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
    		<td><jsp:getProperty name="user" property="inviter"/></td>
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
    <a href="index.jsp">返回登录页面</a>
  </body>
</html>
