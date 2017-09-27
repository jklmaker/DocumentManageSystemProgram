<%@page import="util.dbHelper"%>
<%@page import="entity.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");//防止中文乱码
	int proposalId = Integer.valueOf(request.getParameter("proposalId"));
	dbHelper db = new dbHelper();
	proposal p = db.showQueryInfoPlus(proposalId);
	
	List<recommendProposal> list = db.listRecommendByRecommendProposalId(proposalId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'buildProposalDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/Template.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
    <jsp:useBean  id="user" class="entity.user" scope="session"/>
    <div class="header">
  		<div class="header-tip">
  			<p align="right"><font color="#FF9900">欢迎您:<jsp:getProperty name="user" property="name"/></font></p>
  		</div>
  		<div class="header-main">
  			<h2>能力规范文稿管理系统</h2>
  		</div>
  	</div>
  	<div class="content-left" style="height: 850px">
  		<h2 align="center"><font color="#FF9900">查看该提案的详细信息以确认是否立案</font></h2>
  	</div>
  	<div class="content-right" style="height: 850px">
	  	<p>提案详细信息</p>
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
	    <p>管理员推荐信息</p>
	    <%
	    	if(list==null || list.size()==0) {
	    		out.print("<font color='red'>该提案未得到任何管理员的推荐,请谨慎</font>");
	    	}else{
	    		out.print("<table border='1px' cellspacing='0px' cellpadding='0px'>");
	    		
	    		out.print("<tr>");
	    		//被推荐的提案ID
	    		out.print("<td>");
	    		out.print("被推荐的提案ID");
	    		out.print("</td>");
	    		//被推荐的提案标题
	    		out.print("<td>");
	    		out.print("被推荐的提案标题");
	    		out.print("</td>");
	    		//推荐人
	    		out.print("<td>");
	    		out.print("推荐人");
	    		out.print("</td>");
	    		//推荐原因
	    		out.print("<td>");
	    		out.print("推荐原因");
	    		out.print("</td>");
	    		//推荐时间
	    		out.print("<td>");
	    		out.print("推荐时间");
	    		out.print("</td>");
	    		
	    		out.print("</tr>");
	    		
	    		for(recommendProposal rp:list) {
	    			out.print("<tr>");
	    			
	    			//被推荐的提案ID
		    		out.print("<td>");
		    		out.print(rp.getRecommendProposalId());
		    		out.print("</td>");
		    		//被推荐的提案标题
		    		out.print("<td>");
		    		out.print(rp.getRecommendProposalTitle());
		    		out.print("</td>");
		    		//推荐人
		    		out.print("<td>");
		    		out.print(rp.getRecommendReviewerName());
		    		out.print("</td>");
		    		//推荐原因
		    		out.print("<td>");
		    		out.print(rp.getRecommendReason());
		    		out.print("</td>");
		    		//推荐时间
		    		out.print("<td>");
		    		out.print(rp.getRecommendTimeStamp());
		    		out.print("</td>");
	    			
	    			out.print("</tr>");
	    		}
	    		
	    		out.print("</table>");
	    	}
	     %>
	     <hr>
	     <p>该提案下的全部评论</p>
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
	     	List<comment> commentList = db.listCommentByCommentProposalId(p.getProposalId());
  			for(int i=0;i<commentList.size();i++) {
  				out.print("<tr>");
  				
  				//评论人
  				out.print("<td>");
  				out.print(commentList.get(i).getCommentReviewerName());
  				out.print("</td>");
  				
  				//身份
  				String name = commentList.get(i).getCommentReviewerName();
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
  				out.print(commentList.get(i).getCommentTimeStamp());
  				out.print("</td>");
  				
  				//评论内容
  				out.print("<td>");
  				out.print(commentList.get(i).getCommentContent());
  				out.print("</td>");
  				
  				//意见
  				String view = "弃权";
  				int commentType = commentList.get(i).getCommentType();
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
  		<p>如果您不愿意将此提案立案,请<a href="buildProposal.jsp">点击此处</a>回到选择立案页面</p>
  		<hr>
  		<p>如果您希望将此提案立案，请填写立案的标题和内容.其中系统已经<strong>默认</strong>为您生成立案的标题.如果您对此标题不满意，可以自行更改</p>
  		<form action="servlet/buildProposalOperation" method="post">
  			<input type="hidden" readonly="readonly" name="buildProposalId" value=<%=p.getProposalId() %>>
  			<table>
  				<tr>
  					<td>立案标题</td>
  					<td>
  						<%String defaultTitle = p.getTitle() + "的立案"; %>
  						<input type="text" name="buildTitle" value=<%=defaultTitle %>>
  					</td>
  				</tr>
  				<tr>
  					<td>立案内容</td>
  					<td>
  						<textarea name="buildContent" rows="10" cols="40"></textarea>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2"><input type="submit" value="上报立案" /></td>
  				</tr>
  			</table>
  		</form>
  	</div>
  </body>
</html>
