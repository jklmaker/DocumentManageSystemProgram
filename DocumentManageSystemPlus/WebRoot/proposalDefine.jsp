<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

  </head>
  
  <body>
   	<h1>提案编制</h1>
   	<hr>
   	<jsp:useBean  id="user" class="entity.user" scope="session"/>
    <p>用户名：<jsp:getProperty name="user" property="name"/></p>
    <hr>
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
    				<input type="radio" name="readInfo"><font size="2">我已阅读<a><font color="red">提案建议要求</font></a></font></input>
    			</td>
    			<td>
    				<input type="button" value="打印" />
    			</td>
    			<td>
    				<input type="button" value="保存" />
    			</td>
    			<td>
    				<input type="submit" value="提交" />
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
