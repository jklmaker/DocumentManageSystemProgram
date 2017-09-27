<%@page import="entity.user"%>
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
    
    <title>My JSP 'applyForJoin.jsp' starting page</title>
    
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
		function checkName(){
			var checkedName = "";
			var checkOnes = document.getElementsByName("radioBox");
			for(var i=0;i<checkOnes.length;i++){
				if(checkOnes[i].checked == true) {
					checkedName = document.getElementById("radio"+i).value;
					break;
				}
			}
			document.getElementById("checkNameConfirm").innerHTML = checkedName;
			document.getElementById("recommender").value = checkedName;
		}
	</script>
  </head>
  
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
  	<div class="content-left" style="height: 1300px">
  		<h2 align="center"><font color="#FF9900">写者(未审核)申请加入界面</font></h2>
  	</div>
  	<div class="content-right" style="height: 1300px">
	  	<p>欢迎您,<jsp:getProperty name="user" property="name"/>!</p>
	    <p>在这里，您可以通过查看已合格用户的基本信息选择或改变推荐人,也可以填写自己的申请理由，提高过审几率</p>
	    <hr>
	    <p>请再次确认您自己的基本信息</p>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<tr>
	    		<td colspan="2"><font size="5">我的基本信息</font></td>
	    	</tr>
	    	<tr>
	    		<td>用户名</td>
	    		<td><%=user.getName() %></td>
	    	</tr>
	    	<tr>
	    		<td>性别</td>
	    		<td><%=user.getSex() %></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期</td>
	    		<td><%=user.getBirthday() %></td>
	    	</tr>
	    	<tr>
	    		<td>住址</td>
	    		<td><%=user.getAddress() %></td>
	    	</tr>
	    	<tr>
	    		<td>联系方式</td>
	    		<td><%=user.getTelephone() %></td>
	    	</tr>
	    	<tr>
	    		<td>行业分会</td>
	    		<td><%=user.getIndustryBranch() %></td>
	    	</tr>
	    	<tr>
	    		<td>专委会</td>
	    		<td><%=user.getSpecialCommittee() %></td>
	    	</tr>
	    	<tr>
	    		<td>推荐人<font color="red">(指在注册时所选择的推荐人)</font></td>
	    		<td>
	    			<%
	    				if(user.getInviter()==null || user.getInviter().length()==0) {
	    					out.print("暂无");
	    				}else{
	    					out.print(user.getInviter());
	    				}
	    			%>
	    		</td>
	    	</tr>
	    </table>
	    <hr>
	    <p>这是当前可选推荐人信息的表格,请仔细考虑后做出选择</p>
	    <p>友情提醒:<font color="red">该项非必填项</font>。但如果您选择了推荐人，将会大大提高您通过审核的几率。在选择推荐人时，请尽可能选择<strong>您所认识的人</strong>或<strong>与您在同一行业(专委会)的人</strong></p>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<thead>
	    		<tr>
		    		<th>单选按钮</th>
		    		<th>用户名</th>
		    		<th>联系方式</th>
		    		<th>行业分会</th>
		    		<th>专委会</th>
		    	</tr>
	    	</thead>
	    	<tbody>
	    		<!-- 以下内容由JSP输出 -->
	    		<%
	    			dbHelper db = new dbHelper();
	    			List<user> list = db.listUserByUserType(0);	//得到了可选推荐人对象的集合
	    			for(int i=0;i<list.size();i++){
	    				out.print("<tr>");
	    				
	    				//单选按钮
	    				out.print("<td>");
	    				out.print("<input type='radio' name='radioBox' id='radio"+i+"' value='"+list.get(i).getName()+"' onclick='checkName()' >");
	    				out.print("</td>");
	    				
	    				//用户名
	    				out.print("<td>");
	    				out.print(list.get(i).getName());
	    				out.print("</td>");
	    				
	    				//联系方式
	    				out.print("<td>");
	    				out.print(list.get(i).getTelephone());
	    				out.print("</td>");
	    				
	    				//行业分会
	    				out.print("<td>");
	    				out.print(list.get(i).getIndustryBranch());
	    				out.print("</td>");
	    				
	    				//专委会
	    				out.print("<td>");
	    				out.print(list.get(i).getSpecialCommittee());
	    				out.print("</td>");
	    				
	    				out.print("</tr>");
	    			}
	    		 %>
	    	</tbody>
	    </table>
	    <p><strong>您所选择的推荐人姓名为:<font color="red"><span id="checkNameConfirm"></span></font></strong></p>
	    <hr>
	    <!-- 填写申请信息的表格 -->
	    <p>请在这里填写您的申请信息</p>
	    <form action="servlet/addApplyInfo" method="post">
		    <input type="hidden" name="recommender" id="recommender" readonly="readonly" />
		    <textarea name="applyReason" rows="20" cols="75"></textarea><br>
		    <input type="submit" value="提交" class="mybtn" onclick="alert('操作成功')" />
		    <a href="uncheckedUserHome.jsp"><input type="button" value="取消" class="mybtn" /></a>
	    </form>
  	</div>
  
  
  
  
  
  
  
  
  
  
    
  </body>
</html>
