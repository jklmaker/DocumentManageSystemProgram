<%@page import="entity.user"%>
<%@page import="entity.comment"%>
<%@page import="entity.proposal"%>
<%@page import="util.dbHelper"%>
<%@page import="java.net.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");//防止中文乱码
	int proposalId;
	proposal p = new proposal();
	dbHelper db = new dbHelper();
	if(request.getParameter("getProposalDetail")!=null && request.getParameter("getProposalDetail").length()>0) {
		proposalId = Integer.valueOf(request.getParameter("getProposalDetail"));
		p = db.showQueryInfoPlus(proposalId);
	}else{
		request.setCharacterEncoding("utf-8");
		String commentProposalIdStr = "";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0) {
      	for(Cookie c:cookies) {
		     if(c.getName().equals("proposalNowReviewing")) {
		     	commentProposalIdStr = URLDecoder.decode(c.getValue(),"utf-8");
		     }
		     c.setMaxAge(0);
		     c.setPath("/");
		     response.addCookie(c);
      	}
      	proposalId = Integer.valueOf(commentProposalIdStr);
      	p = db.showQueryInfoPlus(proposalId);
	}
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getProposalDetailAdmin.jsp' starting page</title>
    
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
    <h1>查看提案细节(管理员)</h1>
    <hr>
    <p>提案ID:<%=p.getProposalId() %></p>
    <table border="1px" cellpadding="0px" cellspacing="0px">
    	<tr>
    		<td>提案ID</td>
    		<td><%=p.getProposalId() %></td>
    		<td>提案名称</td>
    		<td><%=p.getTitle() %></td>
    	</tr>
    	<tr>
    		<td>提案作者</td>
    		<td><%=p.getAuthor() %></td>
    		<td>截止日期</td>
    		<td><%=p.getDeadline() %></td>
    	</tr>
    	<tr>
    		<td>附议数</td>
    		<td><%=p.getAgree() %></td>
    		<td>反对数</td>
    		<td><%=p.getDisagree() %></td>
    	</tr>
    	<tr>
    		<td>提案内容</td>
    		<td colspan="3"><%=p.getContent() %></td>
    	</tr>
    </table>
    <hr>
    <p>请在<strong>输入框</strong>中输入您的评论，并点击<strong>下面的单选按钮</strong>表达您的意向</p>
    <form action="servlet/commentProposal" method="post">
    	<input type="hidden" name="commentProposalId" readonly="readonly" value=<%=p.getProposalId() %> />
    	<input type="hidden" name="commentProposalTitle" readonly="readonly" value=<%=p.getTitle() %> />
    	<table border="1px" cellpadding="0px" cellspacing="0px">
    		<tr>
    			<td colspan="4">请输入评论<input type="text" name="commentContent" /></td>
    		</tr>
    		<tr>
    			<td></td>
    			<td><input type="radio" name="commentType" value="agree" />附议</td>
    			<td><input type="radio" name="commentType" value="disagree" />反对</td>
    			<td><input type="submit" value="提交评论" /></td>
    		</tr>
    	</table>
    </form>
    <hr>
    <p>评论区</p>
    <table border="1px" cellpadding="0px" cellspacing="0px">
  	<thead>
  		<tr>
    		<th>评论人</th>
    		<th>身份</th>
    		<th>评论时间</th>
    		<th>评论内容</th>
    		<th>意见</th>
	    </tr>
  	</thead>
  	<tbody>
  		<%
  			List<comment> list = db.listCommentByCommentProposalId(p.getProposalId());
  			for(int i=0;i<list.size();i++) {
  				out.print("<tr>");
  				
  				//评论人
  				out.print("<td>");
  				out.print(list.get(i).getCommentReviewerName());
  				out.print("</td>");
  				
  				//身份
  				String name = list.get(i).getCommentReviewerName();
  				user u = db.showQueryInfo(name);
  				int userType = u.getUserType();
  				String userTypeStr = "管理员";
  				if(userType == 0) {
  					userTypeStr = "写者";
  				}
  				out.print("<td>");
  				out.print(userTypeStr);
  				out.print("</td>");
  				
  				//评论时间
  				out.print("<td>");
  				out.print(list.get(i).getCommentTimeStamp());
  				out.print("</td>");
  				
  				//评论内容
  				out.print("<td>");
  				out.print(list.get(i).getCommentContent());
  				out.print("</td>");
  				
  				//意见
  				String view = "弃权";
  				int commentType = list.get(i).getCommentType();
  				if(commentType==1){
  					view = "附议";
  				}else{
  					view = "反对";
  				}
  				out.print("<td>");
  				out.print(view);
  				out.print("</td>");
  				
  				out.print("</tr>");
  			}
  		 %>
  	</tbody>
  </table>
  <hr>
  <p>请输入您的推荐理由</p>
  <form action="servlet/recommendProposalOperation" method="post">
  	<input id="proposalIdCollection" type="hidden" readonly="readonly" name="proposalIdCollection" value=<%=p.getProposalId() %> />
  	<textarea name="recommendReason" rows="10" cols="40"></textarea>
  	<input type="submit" value="推荐" />
  </form>
  </body>
</html>
