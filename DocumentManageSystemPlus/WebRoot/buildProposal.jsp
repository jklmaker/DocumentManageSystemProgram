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
    
    <title>My JSP 'buildProposal.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/Template.css" rel="stylesheet" type="text/css" /><link href="css/CustomButton.css" rel="stylesheet" type="text/css" />
  </head>
  
  <%!
  	public boolean isExist(record r,List<build> buildList) {
  		int recordProposalId = r.getRecordProposalId();
  		for(build b:buildList) {
  			if(b.getBuildProposalId() == recordProposalId) {
  				return true;
  			}
  		}
  		return false;
  	}
   %>
   
   <%
  	dbHelper db = new dbHelper();
  	List<proposal> list = db.listProposal();
  	List<record> recordList = db.listRecord();
  	List<build> buildList = db.listBuild();
   %>
  
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
  	<div class="content-left">
  		<h2 align="center"><font color="#FF9900">立案(研究会)</font></h2>
  	</div>
  	<div class="content-right">
	  	<!-- 输出一张表格 -->
	  	<table border="1px" cellpadding="0px" cellspacing="0px">
	  		<thead>
	  			<tr>
	  				<td>提案ID</td>
	  				<td>提案作者</td>
	  				<td>提案标题</td>
	  				<td>是否被推荐</td>
	  				<td>附议数</td>
	  				<td>反对数</td>
	  				<td>查看该提案的详细信息以确认是否立案</td>
	  			</tr>
	  		</thead>
	  		<tbody>
	  			<%
	  				for(int i=0;i<recordList.size();i++) {
	  					record r = recordList.get(i);
	  					proposal p = db.showQueryInfoPlus(r.getRecordProposalId());
	  					if(isExist(r, buildList) == true) {
	  						continue;
	  					}
	  					
	  					out.print("<tr>");
	  					
	  					//提案ID
	  					out.print("<td>");
	  					out.print(p.getProposalId());
	  					out.print("</td>");
	  					
	  					//提案作者
	  					out.print("<td>");
	  					out.print(p.getAuthor());
	  					out.print("</td>");
	  					
	  					//提案标题
	  					out.print("<td>");
	  					out.print(p.getTitle());
	  					out.print("</td>");
	  					
	  					//是否被推荐
	  					List<recommendProposal> recommendList = db.listRecommendByRecommendProposalId(p.getProposalId());
	  					String isRecommend = "否";
	  					if(recommendList!=null && recommendList.size()>0) {
	  						isRecommend = "是";
	  					}
	  					out.print("<td>");
	  					out.print(isRecommend);
	  					out.print("</td>");
	  					
	  					//附议数
	  					out.print("<td>");
	  					out.print(p.getAgree());
	  					out.print("</td>");
	  					
	  					//反对数
	  					out.print("<td>");
	  					out.print(p.getDisagree());
	  					out.print("</td>");		
	  					
	  					//查看该提案的详细信息以确认是否备案(添加按钮)
						out.print("<td>");
						out.print("<form action='buildProposalDetail.jsp' method='post'>");
						out.print("<input type='hidden' readonly='readonly' name='proposalId' value='"+p.getProposalId()+"'>");
						out.print("<input type='submit' value='查看该提案的详细信息以确认是否立案'>");
						out.print("</form>");
						out.print("</td>");
							
	  					out.print("</tr>");
	  				}
	  			 %>
	  		</tbody>
	  	</table>
	  	<hr>
	  	<p><strong>已立案</strong>的提案列表</p>
	  	<table border="1px" cellpadding="0px" cellspacing="0px">
	  		<thead>
	  			<tr>
	  				<th>提案Id</th>
	  				<th>立案标题</th>
	  				<th>立案内容</th>
	  				<th>立案人用户名</th>
	  				<th>立案时间</th>
	  			</tr>
	  		</thead>
	  		<tbody>
	  			<%
	  				for(build b:buildList) {
	  					out.print("<tr>");
	  					
	  					//提案Id
	  					out.print("<td>");
	  					out.print(b.getBuildProposalId());
	  					out.print("</td>");
	  					
	  					//立案标题
	  					out.print("<td>");
	  					out.print(b.getBuildTitle());
	  					out.print("</td>");
	  					
	  					//立案内容
	  					out.print("<td>");
	  					out.print(b.getBuildContent());
	  					out.print("</td>");
	  					
	  					//立案人用户名
	  					out.print("<td>");
	  					out.print(b.getBuildReviewerName());
	  					out.print("</td>");
	  					
	  					//立案时间
	  					out.print("<td>");
	  					out.print(b.getBuildTimeStamp());
	  					out.print("</td>");
	  					
	  					out.print("</tr>");
	  				}
	  			 %>
	  		</tbody>
	  	</table>
  	</div>
  </body>
</html>
