<%@page import="util.dbHelper"%>
<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
  		dbHelper db = new dbHelper();
  		List<proposal> list = db.listProposal();
  		int amount = list.size();
  		String str = "";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'proposalDefine.jsp' starting page</title>
    
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
  	<div class="content-left" style="height: 800px">
  		<h2 align="center"><font color="#FF9900">提案编制</font></h2>
  	</div>
  	<div class="content-right" style="height: 800px">
	  	<form name="proposalDefineForm" action="servlet/proposalDefineServlet" method="post">
    	<table border="1px" cellpadding="0px" cellspacing="0px">
    		<tr>
    			<td>提案名称</td>
    			<td colspan="3">
    				<input type="text" name="title" />
    			</td>
    		</tr>
    		<tr>
    			<td>提案内容</td>
    			<td colspan="3">
					<textarea name="content" rows="10" cols="40"></textarea>
				</td>
    		</tr>
    		<tr>
    			<td>
    				<input type="radio" name="readInfo"><font size="2" />我已阅读<a><font color="red">提案建议要求</font></a></font>
    			</td>
    			<td>
    				<input type="button" value="打印" class="mybtn" />
    			</td>
    			<td>
    				<input type="button" value="保存" class="mybtn" />
    			</td>
    			<td>
    				<input type="submit" value="提交" class="mybtn" />
    			</td>
    		</tr>
    	</table>
    </form>
    <hr>
    <p>我的历史提案</p>
    <table border="1px" cellpadding="0px" cellspacing="0px">
    	<tr>
    		<!-- 表头 -->
    		<td>编号</td>
    		<td>提案名称</td>
    		<td>作者</td>
    		<td>截止日期</td>
    		<td>状态</td>
    		<td>附议数</td>
    		<td>反对数</td>
    	</tr>
    	<%
    		for(int i=0;i<list.size();i++) {
    			if(!list.get(i).getAuthor().equals(user.getName())) {
    				continue;
    			}
    		
    			out.print("<tr>");
    			
    			out.print("<form action='servlet/delProposalServlet' method='post'>");
    			
    			//编号
    			out.print("<td>");
    			str = String.valueOf(list.get(i).getProposalId()); 
	    		out.print(str);
	    		out.print("<input id='testId' type='hidden' name='testId' readonly='readonly' value='"+str+"' />");
    			out.print("</td>");
    			//提案名称
    			out.print("<td>");
    			str = String.valueOf(list.get(i).getTitle()); 
	    		out.print(str);
    			out.print("</td>");
    			//作者
    			out.print("<td>");
    			str = String.valueOf(list.get(i).getAuthor()); 
	    		out.print(str);
    			out.print("</td>");
    			//截止日期
    			out.print("<td>");
    			str = String.valueOf(list.get(i).getDeadline()); 
	    		out.print(str);
    			out.print("</td>");
    			//状态
    			out.print("<td>");
    			str = String.valueOf(list.get(i).getState()); 
	    		out.print(str);
    			out.print("</td>");
    			//附议数
    			out.print("<td>");
    			str = String.valueOf(list.get(i).getAgree()); 
	    		out.print(str);
    			out.print("</td>");
    			//反对数
    			out.print("<td>");
    			str = String.valueOf(list.get(i).getDisagree()); 
	    		out.print(str);
    			out.print("</td>");
    			
    			out.print("</tr>");
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
