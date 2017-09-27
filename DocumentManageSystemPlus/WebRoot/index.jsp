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
	
	<style type="text/css">
		body{
			margin: 0px;
			padding: 0px;
		}
	
		.mybtn {
	    width:86px;
	    text-align:center;
	    line-height:100%;
	    padding-top:0.5em;
	    padding-right:2em;
	    padding-bottom:0.55em;
	    padding-left:2em;
	    font-family:Arial,sans-serif;
	    font-size:14px;
	    font-style:normal;
	    font-variant:normal;
	    font-weight:normal;
	    text-decoration:none;
	    margin-top:0px;
	    margin-right:2px;
	    margin-bottom:0px;
	    margin-left:2px;
	    vertical-align:text-bottom;
	    display:inline-block;
	    cursor:pointer;
	    zoom:1;
	    outline-width:medium;
	    outline-color:invert;
	    font-size-adjust:none;
	    font-stretch:normal;
	    border-top-left-radius:0.5em;
	    border-top-right-radius:0.5em;
	    border-bottom-left-radius:0.5em;
	    border-bottom-right-radius:0.5em;
	    box-shadow:0px 1px 2px rgba(0,0,0,0.2);
	    text-shadow:0px 1px 1px rgba(0,0,0,0.3);
	    color:#fefee9;
	    border-top-color:#da7c0c;
	    border-right-color:#da7c0c;
	    border-bottom-color:#da7c0c;
	    border-left-color:#da7c0c;
	    border-top-width:1px;
	    border-right-width:1px;
	    border-bottom-width:1px;
	    border-left-width:1px;
	    border-top-style:solid;
	    border-right-style:solid;
	    border-bottom-style:solid;
	    border-left-style:solid;
	    background-image:none;
	    background-attachment:scroll;
	    background-repeat:repeat;
	    background-position-x:0%;
	    background-position-y:0%;
	    background-size:auto;
	    background-origin:padding-box;
	    background-clip:padding-box;
	    background-color:#f78d1d;
	}
	
	.mybtn:hover {
    	background: #f47c20;
	}
	
	ul{width: 260px;margin: 10px auto;}
    ul li{width:260px;height:60px;line-height: 60px;}
    
    .myText{
        border: 1px solid #ccc;
        border-radius: 2px;
        color: #000;
        font-family: 'Open Sans', sans-serif;
        font-size: 1em;
        height: 30px;
        padding: 0 16px;
        transition: background 0.3s ease-in-out;
        width: 100%;
    }
    
    input:focus {
        outline: none;
        border-color: #9ecaed;
        box-shadow: 0 0 10px #9ecaed;
    }
    .content{
    	background-image: url(img/4.jpg);
    	height: 600px;
    	padding-top: 230px;
    }
    .contentTable{
    	background-color: #FFFFCC;
    	
    }
	</style>
  </head>

  <body onload="alertLoginFail()">
  	<div class="content">
	    <form name="logForm" action="servlet/logServlet" method="post" >
	    	<table width="35%" height="400px" border="1px" cellpadding="0px" cellspacing="0px" align="center" class="contentTable">
	    		<tr height="40%">
	    			<td colspan="2" align="center"><strong><font size="6" color="#FF9966">能力规范文稿管理系统</font></strong></td>
	    		</tr>
	    		<tr>
	    			<td align="center">用户名</td>
	    			<td><input type="text" name="name" class="myText" style="width: 65%" placeholder="请输入用户名" /></td>
	    		</tr>
	    		<tr>
	    			<td align="center">密码</td>
	    			<td><input type="password" name="password" class="myText" style="width: 65%" placeholder="请输入密码" /></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="center"><input type="submit" value="登录" class="mybtn" style="width: 75%" align="middle" /></td>
	    		</tr>
	    		<tr>
	    			<td colspan="2" align="center"><a href="regist.jsp"><input type="button" value="注册" class="mybtn" style="width: 75%" align="middle" /></a></td>
	    		</tr>
	    	</table>
	    </form>
    </div>
  </body>
</html>
