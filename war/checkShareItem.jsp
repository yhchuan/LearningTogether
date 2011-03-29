<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>jsp for checking current user's shared item</title>
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
  
  if(UserServiceFactory.getUserService().getCurrentUser()==null)
	  response.sendRedirect(UserServiceFactory.getUserService().createLoginURL(request.getRequestURI()));
  MyUser myUser=MyUser.getMyUserByNickName(UserServiceFactory.getUserService().getCurrentUser().getNickname());
  List<ShareItem> items=myUser.getItems();
  %>
</head>

<body>
    <div>
    <%
    for(ShareItem item : items) {
    	%>
    	<div>
    	<p>url: <%=item.getUrl() %> </p>
    	<p>tag: <%=item.getTag() %> </p>
    	<p>short info: <%=item.getShortInfo() %> </p>
    	<p>date: <%=item.getSubmitDate() %> </p>
    	</div>
    	<%
    }
     %>
    </div>
</body>

</html>