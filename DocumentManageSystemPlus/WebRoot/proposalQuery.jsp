<%@page import="util.dbHelper"%>
<%@page import="entity.proposal"%>
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

  </head>
  
  <body>
  	<%
  		dbHelper db = new dbHelper();
  		List<proposal> list = db.listProposal();
  		int amount = list.size();
  		String str = "";
  	 %>
    <h1>提案查询</h1>
    <hr>
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
    	</tr>
    	<%
    		amount--;
    	 %>
    	<tr>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getProposalId()); 
    					out.print(str);  					
    				}
    			 %>
    			 
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getTitle();
    					out.print(str);  					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getAuthor();
    					out.print(str); 
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getDeadline();
    					out.print(str); 
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getState());
    					out.print(str);  
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getAgree());
    					out.print(str);  
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getDisagree());
    					out.print(str);  
    				}
    			 %>
    		</td>
    		<td>
    			<input type="button" value="撤销" />
    		</td>
    	</tr>
    	    	<%
    		amount--;
    	 %>
    	<tr>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getProposalId());
    					out.print(str);     					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getTitle();
    					out.print(str);   					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getAuthor();
    					out.print(str); 
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getDeadline();
    					out.print(str); 
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getState());
    					out.print(str);  
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getAgree()); 
    					out.print(str); 
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getDisagree()); 
    					out.print(str); 
    				}
    			 %>
    		</td>
    		<td>
    			<input type="button" value="撤销" />
    		</td>
    	</tr>
    	    	<%
    		amount--;
    	 %>
    	<tr>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getProposalId());   
    					out.print(str); 					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getTitle();   		
    					out.print(str);			
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getAuthor();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getDeadline();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getState()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getAgree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getDisagree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<input type="button" value="撤销" />
    		</td>
    	</tr>
    	    	<%
    		amount--;
    	 %>
    	<tr>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getProposalId());
    					out.print(str);    					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getTitle();   
    					out.print(str);					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getAuthor();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getDeadline();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getState()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getAgree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getDisagree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<input type="button" value="撤销" />
    		</td>
    	</tr>
    	    	<%
    		amount--;
    	 %>
    	<tr>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getProposalId());   
    					out.print(str); 					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getTitle();   			
    					out.print(str);		
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getAuthor();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getDeadline();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getState()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getAgree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getDisagree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<input type="button" value="撤销" />
    		</td>
    	</tr>
    	    	<%
    		amount--;
    	 %>
    	<tr>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getProposalId()); 
    					out.print(str);   					
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getTitle();   				
    					out.print(str);	
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getAuthor();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = list.get(amount).getDeadline();
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getState()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getAgree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<%
    				if(amount>0) {
    					str = String.valueOf(list.get(amount).getDisagree()); 
    					out.print(str);
    				}
    			 %>
    		</td>
    		<td>
    			<input type="button" value="撤销" />
    		</td>
    	</tr>
    </table>
  </body>
</html>
