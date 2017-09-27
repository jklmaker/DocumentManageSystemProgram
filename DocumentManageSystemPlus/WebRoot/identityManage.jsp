<%@page import="util.dbHelper"%>
<%@page import="entity.user"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:useBean  id="user" class="entity.user" scope="session"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'identityManage.jsp' starting page</title>
    
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
			var nameCollection = "";
			//获取所有的复选框
			var checkOnes = document.getElementsByName("checkOne");
			//对获取的所有复选框进行遍历
			for(var i=0;i<checkOnes.length;i++){
				//如果打勾了，说明要审核这行所表示的用户
				if(checkOnes[i].checked == true) {
					var str = document.getElementById("name"+i).value;
					nameCollection += str+"_";
				}
			}
			if(nameCollection == "") {
				alert("请先选择欲审核的用户");
				return false;
			}else{
				document.getElementById("nameCollection").value = nameCollection;
				alert(nameCollection);
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
  
  <body>
  	<div class="header">
  		<div class="header-tip">
  			<p align="right"><font color="#FF9900">欢迎您:<jsp:getProperty name="user" property="name"/><a href="exit.jsp"><input type="button" value="注销" class="mybtn" onclick="return confirm('真的要注销吗')"></a></font></p>
  		</div>
  		<div class="header-main">
  			<h2>能力规范文稿管理系统</h2>
  		</div>
  	</div>
  	<div class="content-left">
  		<h2 align="center"><font color="#FF9900">身份管理</font></h2>
  	</div>
  	<div class="content-right">
	  	<table>
    	<tr>
    		<td>姓名&nbsp;&nbsp;&nbsp;<input type="text" name="inputName"></td>
    		<td><input type="button" value="查询" class="mybtn"></td>
    	</tr>
	    </table>
	    <table border="1px" cellpadding="0px" cellspacing="0px">
	    	<thead>
		    	<tr>
		    		<th><input type="checkbox" onclick="checkAll()" id="checkAll">全选</th>
		    		<th>编号</th>
		    		<th>姓名</th>
		    		<th>申请信息和推荐表</th>
		    	</tr>
	    	</thead>
	    	<tbody>
	    		<%
	    		dbHelper db = new dbHelper();
	    		List<user> list = db.listUser();
	    		String str = "";
	    		int j = 0;
	    		for(int i=0;i<list.size();i++) {
	    		
	    			if(list.get(i).getUserType() != 2) {
	    				j++;
	    				continue;
	    			}
	    			String rowId = "row"+i;
	    			out.print("<tr id='"+rowId+"'>");
	    			
	    			//checkbox
	    			out.print("<td>");
		    		out.print("<input type='checkbox' name='checkOne' class='mybtn'>");	//复选框的名字都是一样的
	    			out.print("</td>");
	    			
	    			//编号
	    			out.print("<td>");
		    		out.print(i+1);
	    			out.print("</td>");
	    			
	    			//姓名
	    			int k = i-j;
	    			String nameId = "name" + k;
	    			out.print("<td>");
	    			str = list.get(i).getName(); 
		    		out.print(str);
		    		out.print("<input id='"+nameId+"' type='hidden' name='name' class='mybtn' readonly='readonly' value='"+str+"' />");
	    			out.print("</td>");
	    			
	    			//申请信息和推荐表
	    			out.print("<td>");
	    			
	    			out.print("<form action='checkInfo.jsp' method='post'>");
	    			out.print("<input name='checkerName' type='hidden' readonly='readonly' value='"+list.get(i).getName()+"' />");
	    			out.print("<input name='inviterName' type='hidden' readonly='readonly' value='"+list.get(i).getInviter()+"' />");
	    			out.print("<input type='submit' class='mybtn' style='width:220px' value='查看申请信息及推荐表'>");
	    			
	    			out.print("</td>");
	    			
	    			out.print("</form>");
	    			
	    			out.print("</tr>");
	    		}
	    	 %>
	    	</tbody>
	    </table>
	    <form action="servlet/checkOperation" method="post">
	    	<input id="nameCollection" type="hidden" class="mybtn" readonly="readonly" name="nameCollection" />
	    	<input type="submit" value="同意" class="mybtn" onclick="return checkUser()" />
	    </form>
	    <input type="button" class="mybtn" value="拒绝" /><br><br>
	    <a href="managerHome.jsp"><input type="button" class="mybtn" value="返回" /></a>
  	</div>
  </body>
</html>
