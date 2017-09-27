<%@page import="util.dbHelper"%>
<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'proposalQuery.jsp' starting page</title>
    
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
	</script>
  </head>
  
  <%
  	request.setCharacterEncoding("utf-8");
  	Cookie[] cookies = request.getCookies();
  	if(cookies!=null&&cookies.length>0)
      {
           for(Cookie c:cookies)
           {
              if(c.getName().equals("proposalId"))
              {
                   c.setMaxAge(0); 			//设置Cookie失效
                   response.addCookie(c); 	//重新保存
              }
           }
      }
   %>
  
  <body>
  	<%
  		dbHelper db = new dbHelper();
  		List<proposal> list = db.listProposal();
  		int amount = list.size();
  		String str = "";
  	 %>
  	 
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
  		<h2 align="center"><font color="#FF9900">提案查询</font></h2>
  	</div>
  	<div class="content-right">
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
    		<td>撤销选项</td>
    		<td>查看详情</td>
    	</tr>
    	<%
    		for(int i=0;i<list.size();i++) {
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
    			//撤销选项
    			out.print("<td>");
    			out.print("<input type='submit' value='撤销' class='mybtn' />");
    			out.print("</td>");
    			
    			out.print("</form>");
    			
    			//查看详情选项
    			out.print("<td>");
    			out.print("<form action='getProposalDetail.jsp' method='post'>");
    			out.print("<input type='hidden' name='getProposalDetail' value='"+String.valueOf(list.get(i).getProposalId())+"'>");
    			out.print("<input type='submit' value='查看详情' class='mybtn' style='width:140px' />");
    			out.print("</form>");
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
