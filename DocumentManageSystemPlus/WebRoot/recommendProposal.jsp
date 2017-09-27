<%@page import="entity.recommendProposal"%>
<%@page import="entity.user"%>
<%@page import="entity.proposal"%>
<%@page import="util.dbHelper"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recommendProposal.jsp' starting page</title>
    
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
		function checkAll(){
			//1.获取编号前面的复选框
			var checkAllEle = document.getElementById("checkAll");
			//2.对编号前面复选框的状态进行判断
			if(checkAllEle.checked==true){
				//3.获取下面所有的复选框
				var checkOnes = document.getElementsByName("checkOne");
				//4.对获取的所有复选框进行遍历
				for(var i=0;i<checkOnes.length;i++){
					//5.拿到每一个复选框，并将其状态置为选中
					checkOnes[i].checked=true;
				}
			}else{
				//6.获取下面所有的复选框
				var checkOnes = document.getElementsByName("checkOne");
				//7.对获取的所有复选框进行遍历
				for(var i=0;i<checkOnes.length;i++){
					//8.拿到每一个复选框，并将其状态置为未选中
					checkOnes[i].checked=false;
				}
			}
		}
		
		function checkUser() {
			var proposalIdCollection = "";
			//获取所有的复选框
			var checkOnes = document.getElementsByName("checkOne");
			//对获取的所有复选框进行遍历
			for(var i=0;i<checkOnes.length;i++){
				//如果打勾了，说明要推荐这行提案
				if(checkOnes[i].checked == true) {
					var str = document.getElementById("name"+i).value;
					proposalIdCollection += str+"_";
				}
			}
			if(proposalIdCollection == "") {
				alert("请先选择欲推荐的提案");
				return false;
			}else{
				document.getElementById("proposalIdCollection").value = proposalIdCollection;
				alert(proposalIdCollection);
				var answer = confirm("是否确认执行?");
				if(answer){
					return true;
				}else{
					return false;
				}
			}
		}
	</script>
  </head>
  <%
  	dbHelper db = new dbHelper();
  	List<proposal> list = db.listProposal();
   %>
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
  	<div class="content-left">
  		<h2 align="center"><font color="#FF9900">推荐(专委会)</font></h2>
  	</div>
  	<div class="content-right">
	  	<!-- 用表格展示当前所有的提案信息 -->
	    <table>
	    	<tr>
	    		<td>姓名&nbsp;&nbsp;&nbsp;<input type="text" name="inputName"></td>
	    		<td><input type="button" value="查询" class="mybtn"></td>
	    	</tr>
	    </table>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<thead>
		    	<tr>
		    		<th><input type="checkbox" onclick="checkAll()" id="checkAll">全选/全不选</th>
		    		<th>提案编号</th>
		    		<th>提案名称</th>
		    		<th>提案人</th>
		    		<th>附议数</th>
		    		<th>反对数</th>
		    		<th>查看详情</th>
		    	</tr>
	    	</thead>
	    	<tbody>
	    		<%!
	    			boolean isExist(int proposalId,List<recommendProposal> ownList) {
	    				for(recommendProposal temp:ownList) {
	    					if(temp.getRecommendProposalId() == proposalId) {
	    						return true;
	    					}
	    				}
	    				return false;
	    			}
	    		 %>
	    		<%
	    		user u = (user)request.getSession().getAttribute("user");
	    		String ownName = u.getName();		//管理员自己的名字
	    		List<recommendProposal> ownList = db.listRecommendProposalByRecommendReviewerName(ownName);
	    		
	    		String str = "";
	    		int j = 0;
	    		for(int i=0;i<list.size();i++) {
	    		
	    			//如果这个提案已经被此管理员推荐，那么就不会将这个提案的信息显示在表格之中
	    			if(isExist(list.get(i).getProposalId(), ownList)) {
	    				j++;
	    				continue;
	    			}
	    			
	    			String rowId = "row"+i;
	    			out.print("<tr id='"+rowId+"'>");
	    			
	    			//checkbox
	    			out.print("<td>");
		    		out.print("<input type='checkbox' name='checkOne'>");	//复选框的名字都是一样的
	    			out.print("</td>");
	    			
	    			//提案编号
	    			int k = i-j;
	    			String proposalHtmlId = "name" + k;
	    			out.print("<td>");
	    			out.print("<input id='"+proposalHtmlId+"' type='hidden' name='name' readonly='readonly' value='"+list.get(i).getProposalId()+"' />");
		    		out.print(list.get(i).getProposalId());
	    			out.print("</td>");
	    			
	    			//提案名称
	    			out.print("<td>");
	    			out.print(list.get(i).getTitle());
	    			out.print("</td>");
	    			
	    			//提案人
	    			out.print("<td>");
	    			out.print(list.get(i).getAuthor());
	    			out.print("</td>");
	    			
	    			//附议数
	    			out.print("<td>");
	    			out.print(list.get(i).getAgree());
	    			out.print("</td>");
	    			
	    			//反对数
	    			out.print("<td>");
	    			out.print(list.get(i).getDisagree());
	    			out.print("</td>");
	    			
	    			//查看详情
	    			out.print("<td>");
	    			out.print("<form action='getProposalDetailAdmin.jsp' method='post'>");
	    			out.print("<input name='getProposalDetail' type='hidden' readonly='readonly' value='"+list.get(i).getProposalId()+"' />");
	    			out.print("<input type='submit' value='查看详情'>");
	    			out.print("</form>");
	    			out.print("</td>");
	    			
	    			out.print("</tr>");
	    		}
	    	 %>
	    	</tbody>
	    </table>
	    <form action="servlet/recommendProposalOperation" method="post">
	    	<input id="proposalIdCollection" type="hidden" readonly="readonly" name="proposalIdCollection" />
	    	<input type="submit" value="推荐" class="mybtn" onclick="return checkUser()" />
	    </form>
	    <hr>
	    <p>我所推荐的提案列表</p>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<thead>
	    		<th>提案编号</th>
		    	<th>提案名称</th>
		    	<th>推荐人</th>
		    	<th>推荐理由</th>
		    	<th>推荐时间</th>
	    	</thead>
	    	<tbody>
	    		<%
	    			for(recommendProposal temp:ownList) {
	    				out.print("<tr>");
	    				//提案编号
		    			out.print("<td>");
		    			out.print(temp.getRecommendProposalId());
		    			out.print("</td>");
		    			
		    			//提案名称
		    			out.print("<td>");
		    			out.print(temp.getRecommendProposalTitle());
		    			out.print("</td>");
		    			
		    			//推荐人
		    			out.print("<td>");
		    			out.print(temp.getRecommendReviewerName());
		    			out.print("</td>");
		    			
		    			//推荐理由
		    			out.print("<td>");
		    			out.print(temp.getRecommendReason());
		    			out.print("</td>");
		    			
		    			//推荐时间
		    			out.print("<td>");
		    			out.print(temp.getRecommendTimeStamp());
		    			out.print("</td>");
		    			
		    			out.print("</tr>");
	    			}
	    		 %>
	    	</tbody>
	    </table>
	    <hr>
	    <a href="managerHome.jsp"><input type="button" value="回到管理员主页" class="mybtn" style="width: 200px;" /></a>
	    <a href="proposalApproval.jsp"><input type="button" value="回到提案审核界面" class="mybtn" style="width: 200px;" /></a>
  	</div>
  
  
  
  
  
  
  
  
  
  
  
  
  

  </body>
</html>
