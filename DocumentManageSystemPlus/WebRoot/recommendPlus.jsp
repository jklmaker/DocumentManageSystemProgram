<%@page import="util.dbHelper"%>
<%@page import="entity.user"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String recommendedPerson = "";
	request.setCharacterEncoding("utf-8");//防止中文乱码
	recommendedPerson = request.getParameter("recommendedPerson");
	user u = new dbHelper().showQueryInfo(recommendedPerson);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recommendPlus.jsp' starting page</title>
    
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
		<div class="header-main" style="height: 1000px">
			<h2>能力规范文稿管理系统</h2>
		</div>
	</div>
	<div class="content-left" style="height: 1000px">
		<h2 align="center"><font color="#FF9900">填写推荐信息</font></h2>
	</div>
	<div class="content-right" style="height: 1000px">
		<p>请您再次确认被推荐人的具体信息</p>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<tr>
	    		<td colspan="2"><h3>被推荐人的具体信息</h3></td>
	    	</tr>
	    	<tr>
	    		<td>姓名</td>
	    		<td><%=u.getName() %></td>
	    	</tr>
	    	<tr>
	    		<td>性别</td>
	    		<td><%=u.getSex() %></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期</td>
	    		<td><%=u.getBirthday() %></td>
	    	</tr>
	    	<tr>
	    		<td>家庭住址</td>
	    		<td><%=u.getAddress() %></td>
	    	</tr>
	    	<tr>
	    		<td>联系方式</td>
	    		<td><%=u.getTelephone() %></td>
	    	</tr>
	    	<tr>
	    		<td>行业分会</td>
	    		<td><%=u.getIndustryBranch() %></td>
	    	</tr>
	    	<tr>
	    		<td>专委会</td>
	    		<td><%=u.getSpecialCommittee() %></td>
	    	</tr>
	    </table>
	    <hr>
	    <p>请输入您对<strong><font color="red"><%=recommendedPerson %></font></strong>的推荐理由</p>
	    <form action="servlet/addRecommendInfo">
	    	<input type="hidden" name="recommendedPerson" id="recommendedPerson" readonly="readonly" value=<%=recommendedPerson %> />
		    <textarea name="recommendReason" rows="20" cols="75"></textarea><br>
		    <input type="submit" value="提交" class="mybtn" />
		    <input type="button" value="取消" class="mybtn" />
	    </form>
	</div>
  

    
  </body>
</html>
