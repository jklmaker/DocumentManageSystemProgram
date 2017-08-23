<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</style>  
   <script type="text/javascript" src="js/calendar.js"></script>
  </head>
  
  <body>
    <h1>注册页面</h1>
    <hr>
    <form name="logForm" action="servlet/regServlet" method="post" >
    	<table>
	    	<tr>
	    		<td>姓名</td>
	    		<td><input type="text" name="name" /></td>
	    	</tr>
	    	<tr>
	    		<td>密码</td>
	    		<td><input type="password" name="password" /></td>
	    	</tr>
	    	<tr>
	    		<td>性别</td>
	    		<td><input type="text" name="sex" /></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期</td>
	    		<!-- 需要用到插件 -->
	    		<td>
			    	  <input name="birthday" type="text" id="control_date" size="10"
                      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" />
			    </td>
	    	</tr>
	    	<tr>
	    		<td>家庭住址</td>
	    		<td><input type="text" name="address" /></td>
	    	</tr>
	    	<tr>
	    		<td>联系方式</td>
	    		<td><input type="text" name="telephone" /></td>
	    	</tr>
	    	<tr>
	    		<td>推荐人</td>
	    		<td><input type="text" name="inviter" /></td>
	    	</tr>
	    	<tr>
	    		<td>行业分会</td>
	    		<td><input type="text" name="industryBranch" /></td>
	    	</tr>
	    	<tr>
	    		<td>专委会</td>
	    		<td><input type="text" name="specialCommittee" /></td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<input type="submit" value="提交" />
	    			<a href="index.jsp"><input type="button" value="取消" /></a>
	    			<input type="reset" value="清空" />
	    		</td>
	    	</tr>
    	</table>
    </form>
  </body>
</html>
