<%@page import="dao.apply"%>
<%@page import="util.dbHelper"%>
<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String checkerName = "";
	String inviterName = "";
	request.setCharacterEncoding("utf-8");//防止中文乱码
	
	checkerName = request.getParameter("checkerName");
	inviterName = request.getParameter("inviterName");
	
	dbHelper db = new dbHelper();
	user checker = db.showQueryInfo(checkerName);		//申请人的user对象
	user inviter = db.showQueryInfo(inviterName);		//推荐人的user对象
	apply a = db.showApplyQueryInfo(checkerName);		//获得apply对象
	if(checker == null){
		checker = new user();
	}
	if(inviter == null) {
		inviter = new user();
	}
	if(a == null) {
		a = new apply();
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkInfo.jsp' starting page</title>
    
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
  	<div class="content-left" style="height: 850px">
  		<h2 align="center"><font color="#FF9900">入会申请及会员推荐审核</font></h2>
  	</div>
  	<div class="content-right" style="height: 850px">
	  	<h3>入会申请表</h3>
	    <p>申请人:<%=checkerName %></p>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<tr>
	    		<td colspan="2"><h3>入会申请表</h3></td>
	    	</tr>
	    	<tr>
	    		<td>姓名</td>
	    		<td><%=checker.getName() %></td>
	    	</tr>
	    	<tr>
	    		<td>性别</td>
	    		<td><%=checker.getSex() %></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期</td>
	    		<td><%=checker.getBirthday() %></td>
	    	</tr>
	    	<tr>
	    		<td>家庭住址</td>
	    		<td><%=checker.getAddress() %></td>
	    	</tr>
	    	<tr>
	    		<td>联系方式</td>
	    		<td><%=checker.getTelephone() %></td>
	    	</tr>
	    	<tr>
	    		<td>行业分会</td>
	    		<td><%=checker.getIndustryBranch() %></td>
	    	</tr>
	    	<tr>
	    		<td>专委会</td>
	    		<td><%=checker.getSpecialCommittee() %></td>
	    	</tr>
	    	<tr>
	    		<td>推荐人</td>
	    		<td><%=a.getRecommender() %></td>
	    	</tr>
	    	<tr>
	    		<td>申请内容</td>
	    		<td><%=a.getApplyReason() %></td>
	    	</tr>
	    </table>
	    <hr>
	    <h3>会员推荐表</h3>
	    <p>推荐人:<%=inviterName %></p>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<tr>
	    		<td colspan="2"><h3>会员推荐表</h3></td>
	    	</tr>
	    	<tr>
	    		<td>姓名</td>
	    		<td><%=inviter.getName() %></td>
	    	</tr>
	    	<tr>
	    		<td>性别</td>
	    		<td><%=inviter.getSex() %></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期</td>
	    		<td><%=inviter.getBirthday() %></td>
	    	</tr>
	    	<tr>
	    		<td>家庭住址</td>
	    		<td><%=inviter.getAddress() %></td>
	    	</tr>
	    	<tr>
	    		<td>联系方式</td>
	    		<td><%=inviter.getTelephone() %></td>
	    	</tr>
	    	<tr>
	    		<td>行业分会</td>
	    		<td><%=inviter.getIndustryBranch() %></td>
	    	</tr>
	    	<tr>
	    		<td>专委会</td>
	    		<td><%=inviter.getSpecialCommittee() %></td>
	    	</tr>
	    	<tr>
	    		<td>推荐原因</td>
	    		<td><%=a.getRecommendReason() %></td>
	    	</tr>
	    </table>
	    <form action="servlet/verifyUser" method="post">
	    	<input type="hidden" name="checkerName" id="checkerName" readonly="readonly" value=<%=checkerName %> />
	    	<input type="submit" class="mybtn" value="同意" />
	    	<input type="button" class="mybtn" value="拒绝" />
	    	<a href="managerHome.jsp"><input type="button" class="mybtn" value="返回" /></a>
	    </form>
  	</div>
  
  
  
  
  
  
  

    
  </body>
</html>
