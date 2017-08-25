<%@page import="util.dbHelper"%>
<%@page import="entity.proposal"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteProposal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script type="text/javascript">

	</script>
  </head>
  
  <body>
  <%--
  request.setCharacterEncoding("utf-8");
      String username="";
      String password = "";
      Cookie[] cookies = request.getCookies();
      if(cookies!=null&&cookies.length>0)
      {
           for(Cookie c:cookies)
           {
              if(c.getName().equals("username"))
              {
                   username = URLDecoder.decode(c.getValue(),"utf-8");
              }
              if(c.getName().equals("password"))
              {
                   password = URLDecoder.decode(c.getValue(),"utf-8");
              }
           }
      }
   --%>
  <%
  	request.setCharacterEncoding("utf-8");
  	int proposalId = -1;
  	proposal p = null;
  	Cookie[] cookies = request.getCookies();
  	if(cookies!=null&&cookies.length>0)
      {
           for(Cookie c:cookies)
           {
              if(c.getName().equals("proposalId"))
              {
                   proposalId = Integer.valueOf(URLDecoder.decode(c.getValue(),"utf-8"));
                   //通过ID查找数据库的propose表，获得propose对象
                   p = new dbHelper().showQueryInfoPlus(proposalId);
              }
           }
      }
   %>
    <h1>提案撤销</h1>
    <p>需要撤销的提案ID为:<%=proposalId %></p>
    <hr>
    <table border="1px" cellpadding="0px" cellspacing="0px">
    	<tr>
    		<td colspan="2"><h4>提案基本信息</h4></td>
    	</tr>
    	<tr>
    		<td>编号</td>
    		<td><%=p.getProposalId() %></td>
    	</tr>
    	<tr>
    		<td>提案名称</td>
    		<td><%=p.getTitle() %></td>
    	</tr>
    	<tr>
    		<td>作者</td>
    		<td><%=p.getAuthor() %></td>
    	</tr>
    	<tr>
    		<td>截止日期</td>
    		<td><%=p.getDeadline() %></td>
    	</tr>
    	<tr>
    		<td>状态</td>
    		<td><%=p.getState() %></td>
    	</tr>
    	<tr>
    		<td>附议数</td>
    		<td><%=p.getAgree() %></td>
    	</tr>
    	<tr>
    		<td>反对数</td>
    		<td><%=p.getDisagree() %></td>
    	</tr>
    </table>
    <hr>
    <h3>确认撤销此提案？(<font color="red">被撤销的提案将无法找回，请慎重考虑</font>)</h3>
    <a href="proposalQuery.jsp"><input type="button" value="我不撤销这个提案,并回到提案查询页面"/></a><br>
    <a href="managerHome.jsp"><input type="button" value="我不撤销这个提案,并回到主页面"/></a><br>
    <a href="deleteFinal.jsp"><input type="button" value="我撤销这个提案"/></a><br>
  </body>
</html>
