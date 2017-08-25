<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
  	request.setCharacterEncoding("utf-8");
  	String regFail = "";
  	Cookie[] cookies = request.getCookies();
  	if(cookies!=null && cookies.length>0) {
      	for(Cookie c:cookies) {
		     if(c.getName().equals("regFail")) {
		     	regFail = URLDecoder.decode(c.getValue(),"utf-8");
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
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</style>  
   <script type="text/javascript" src="js/calendar.js"></script>
   <script type="text/javascript">
   
   		function alertRegFail(){
			var loginFailVar='<%=regFail%>';
			if(loginFailVar != "") {
				alert(loginFailVar);
			}
		}
   
   		function selectOperation() {
   			var val = window.document.getElementById("select1").value;
   			
        	if(val == "请选择") {
        		alert("请选择您所属的行业分会");
        		var sel = window.document.getElementById("select2");
        		sel.options.length = 0;
        		var op1 = window.document.createElement("option");
        		op1.text = "请先选择行业分会";
        		sel.add(op1);
        	}else if(val == "naturalScience") {
        		var sel = window.document.getElementById("select2");
        		sel.options.length = 0;
        		
        		var op1 = window.document.createElement("option");
        		op1.value = "naturalScienceMath";
        		op1.selected = "selected";
        		op1.text = "数学";
        		sel.add(op1);
        		
        		var op2 = window.document.createElement("option");
        		op2.value = "naturalSciencePhysics";
        		op2.text = "物理";
        		sel.add(op2);
        		
        		var op3 = window.document.createElement("option");
        		op3.value = "naturalScienceChemistry";
        		op3.text = "化学";
        		sel.add(op3);
        		
        	}else if(val == "socialScience") {
        		var sel = window.document.getElementById("select2");
        		sel.options.length = 0;
        		
        		var op1 = window.document.createElement("option");
        		op1.value = "socialScienceEconomic";
        		op1.selected = "selected";
        		op1.text = "经济学";
        		sel.add(op1);
        		
        		var op2 = window.document.createElement("option");
        		op2.value = "socialScienceHistory";
        		op2.text = "历史学";
        		sel.add(op2);
        		
        		var op3 = window.document.createElement("option");
        		op3.value = "socialSciencePolitics";
        		op3.text = "政治学";
        		sel.add(op3);
        	}
   		}
   		
   		function isCancel() {
   			var answer = confirm("是否放弃注册");
   			if(answer) {
   				window.location = "index.jsp";
   			}
   		}
   		
   </script>
  </head>
  
  <body onload="alertRegFail()">
    <h1>注册页面</h1>
    <hr>
    <form id="logForm" name="logForm" action="servlet/regServlet" method="post" >
    	<table>
	    	<tr>
	    		<td>姓名</td>
	    		<td><input type="text" name="name" /><font color="red">&nbsp;&nbsp;*</font></td>
	    	</tr>
	    	<tr>
	    		<td>密码</td>
	    		<td><input type="password" name="password" /><font color="red">&nbsp;&nbsp;*</font></td>
	    	</tr>
	    	<tr>
	    		<td>性别</td>
	    		<td>
	    			<input type="radio" name="sex" value="male"/>男
	    			<input type="radio" name="sex" value="female"/>女
	    			<font color="red">&nbsp;&nbsp;*</font>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>出生日期</td>
	    		<!-- 需要用到插件 -->
	    		<td>
			    	  <input name="birthday" type="text" id="control_date" size="10"
                      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" />
                      <font color="red">&nbsp;&nbsp;*</font>
			    </td>
	    	</tr>
	    	<tr>
	    		<td>家庭住址</td>
	    		<td><input type="text" name="address" /><font color="red">&nbsp;&nbsp;*</font></td>
	    	</tr>
	    	<tr>
	    		<td>联系方式</td>
	    		<td><input type="text" name="telephone" /><font color="red">&nbsp;&nbsp;*</font></td>
	    	</tr>
	    	<tr>
	    		<td>推荐人(选填)</td>
	    		<td><input type="text" name="inviter" /></td>
	    	</tr>
	    	<tr>
	    		<td>行业分会</td>
	    		<td>
	    			<select name="industryBranch" id="select1" onchange="selectOperation()">
	    				<option selected="selected">请选择</option>
	    				<option value="naturalScience">自然科学分会</option>
	    				<option value="socialScience">社会科学分会</option>
	    			</select>
	    			<font color="red">&nbsp;&nbsp;*</font>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>专委会</td>
	    		<td>
	    			<select name="specialCommittee" id="select2">
	    				<option selected="selected">请先选择行业分会</option>
	    			</select>
	    			<font color="red">&nbsp;&nbsp;*</font>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<input type="submit" value="提交" />
	    			<input type="button" value="取消" onclick="isCancel()" />
	    			<input type="reset" value="清空" />
	    		</td>
	    	</tr>
    	</table>
    </form>
  </body>
</html>
