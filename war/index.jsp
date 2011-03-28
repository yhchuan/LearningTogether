<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="my.cloud.projects.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="my.cloud.projects.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <title>My JSP 'MyJsp.jsp' starting page</title>
  <meta http-equiv="pragma" content="no-cache" />
  <meta http-equiv="cache-control" content="no-cache" />
  <meta http-equiv="expires" content="0" />    
  <!--
  <link rel="stylesheet" type="text/css" href="styles.css" />
  <script language="javascript" type="text/javascript"></script>
  -->
  <style rel="stylesheet" type="text/css">
  /*-- CSS code in here --*/
  </style>
  <script language="javascript" type="text/javascript">
  //-- JavaScript code in here .
  </script>
  <%
  String url=request.getParameter("shareurl");
  	if(url==null)
  		url="";
  MyUser myUser=MyUser.getMyUserByNickName(UserServiceFactory.getUserService().getCurrentUser().getNickname());
  if(myUser==null)
	  response.sendRedirect(RegURL);
  %>
</head>
<body>
  <div id="main">
  	<form>
  		<p>
  			<label for="url">URL:</label>
  			<input type="text" id="url" name="url" 
  			value=<%=url %> >
  		</p>
  		<p>
  			<label for="tag">tag:</label>
  			<input type="text" id="tag" name="tag" >
  		</p>
  		<p>
  			<label for="shortInfo">shortInfo:</label>
  			<textarea rows="3" id="shortInfo" name="shortInfo">
  			</textarea>
  		</p>  		
  	</form>
  	
  	<div class="sharelist">
  		<%for(MyUser friend : myUser.getFriends())
  		{
  			for(ShareItem item : friend.getItems())
  			{ %>
  				<div class="item">
  					<p>
  						<a href=<%=item.getUrl() %>><%=item.getShortInfo() %></a>
  					</p>
  					<p>
  						Shared BY <%=friend.getMyNickName() %> At Time:<%=item.getSubmitDate().toString() %>
  					</p>  					
  				</div>
  			<%}
  		}	
  		%>
  	</div>
  </div>
</body>
</html>