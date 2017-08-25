<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
  	request.setCharacterEncoding("utf-8");
  	String loginFail = "";
  	Cookie[] cookies = request.getCookies();
  	if(cookies!=null && cookies.length>0) {
      	for(Cookie c:cookies) {
		     if(c.getName().equals("loginFail")) {
		     	loginFail = URLDecoder.decode(c.getValue(),"utf-8");
		     }
		     c.setMaxAge(0);
		     c.setPath("/");
		     response.addCookie(c);
      	}
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function alertLoginFail(){
			var loginFailVar='<%=loginFail%>';
			if(loginFailVar != "") {
				alert(loginFailVar);
			}
		}
	</script>
	
  </head>

  <body onload="alertLoginFail()">
  
  
  
    <form name="logForm" action="servlet/logServlet" method="post" >
    	<table>
	    	<tr>
	    		<td>用户名:<input type="text" name="name" /></td>
	    		<td>密码:<input type="password" name="password" /></td>
	    		<td><input type="submit" value="登录" /></td>
	    	</tr>
    	</table>
    </form>
    <hr>
    <a href="regist.jsp"><input type="button" value="注册" /></a>
  </body>
</html>
