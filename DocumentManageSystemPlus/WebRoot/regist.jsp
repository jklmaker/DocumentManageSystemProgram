<%@page import="util.dbHelper"%>
<%@page import="entity.*"%>
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
    
    dbHelper db = new dbHelper();
    List<user> list = db.listUserByUserType(0);
    
    
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
   		
   		function isReset() {
   			var answer = confirm("是否重置注册表单");
   			if(answer){
   				return true;
   			}else{
   				return false;
   			}
   		}
   		
   </script>
   
   <style type="text/css">
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
   
   	.header{
   		background-color: #FFFFCC;
   		height: 120px;
   	}
   	
   	.content-left{
   		background-color: #FFCC99;
   		float: left;
   		width: 15%;
   		height: 400px;
   	}
   	
   	.content-right{
   		background-color: #FFFF66;
   		float: right;
   		width: 85%;
   		height: 400px;
   	}
   	
   	.tableContent{
   		margin-top:40px;
   		background-color: #FFCC99;
   	}
   </style>
  </head>
  
  <body onload="alertRegFail()">
  	<div class="header" align="center">
  		<div style="padding-top: 35px;">
  			<font size="6" color="#FF9966"><strong>欢迎注册文档管理系统</strong></font>
  		</div>
  	</div>
  	<div class="content-left">
  		<h2 align="center"><font color="#FF9900">注册页面</font></h2>
  	</div>
  	<div class="content-right">
  		<form id="logForm" name="logForm" action="servlet/regServlet" method="post" >
	    	<table class="tableContent" border="1px" cellpadding="0px" cellspacing="0px" align="center" width="500px" height="300px">
		    	<tr>
		    		<td>姓名</td>
		    		<td><input type="text" name="name" class="myText" placeholder="请输入姓名" style="width: 65%" /><font color="red">&nbsp;&nbsp;*</font></td>
		    	</tr>
		    	<tr>
		    		<td>密码</td>
		    		<td><input type="password" name="password" class="myText" placeholder="请输入密码" style="width: 65%" /><font color="red">&nbsp;&nbsp;*</font></td>
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
				    	  <input name="birthday" type="text" id="control_date" size="10" placeholder="请点击此处以激活插件"
	                      maxlength="10" class="myText" style="width: 65%" onclick="new Calendar().show(this);" readonly="readonly" />
	                      <font color="red">&nbsp;&nbsp;*</font>
				    </td>
		    	</tr>
		    	<tr>
		    		<td>家庭住址</td>
		    		<td><input type="text" class="myText" style="width: 65%" name="address" placeholder="请输入家庭地址" /><font color="red">&nbsp;&nbsp;*</font></td>
		    	</tr>
		    	<tr>
		    		<td>联系方式</td>
		    		<td><input type="text" class="myText" style="width: 65%" name="telephone" placeholder="请输入联系方式" /><font color="red">&nbsp;&nbsp;*</font></td>
		    	</tr>
		    	<tr>
		    		<td>推荐人(选填)</td>
		    		<td>
		    			<select name="inviter">
		    				<option selected="selected">请选择</option>
		    				<%
		    					for(user u:list){
		    						out.print("<option>"+u.getName()+"</option>");
		    					}
		    				 %>
		    			</select>
		    		</td>
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
		    		<td colspan="2" align="center">
		    			<input type="submit" class="mybtn" value="提交" />
		    			<input type="button" class="mybtn" value="取消" onclick="isCancel()" />
		    			<input type="reset" class="mybtn" value="清空" onclick="return isReset()" />
		    		</td>
		    	</tr>
	    	</table>
	    </form>
  	</div>
    
  </body>
</html>
