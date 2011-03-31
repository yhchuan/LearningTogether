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
  <LINK rel=stylesheet type=text/css href="css/basic.css" />
  <link rel="shortcut icon" href="images/favicon.ico" />
  
  <%
  PersistenceManager pm = PMF.get().getPersistenceManager();
  if(UserServiceFactory.getUserService().getCurrentUser()==null)
	  response.sendRedirect(UserServiceFactory.getUserService().createLoginURL(request.getRequestURI()));
  MyUser myUser=MyUser.getMyUserByNickName(pm,UserServiceFactory.getUserService().getCurrentUser().getNickname());
  List<ShareItem> items=myUser.getItems();
  %>
</head>

<body>
<%@include file="header.jsp" %>
	<div class="main">
	    <div class="sharelist">
	    <%
	    for(ShareItem item : items) {
	    	%>
	    	<div class="item">
	    	<p>地址: <a href='<%=item.getUrl() %>' target="_blank"><%=item.getUrl() %></a></p>
	    	<p>标签: <span class="tag"><%=item.getTag() %></span> </p>
	    	<p>简介: <%=item.getShortInfo() %> </p>
	    	<p>时间: <span class="time"><%=item.getSubmitDate() %></span> </p>
	    	</div>
	    	<%
	    }pm.close();
	     %>
	    </div>
	     <div class="rightside">
	  	<form method="post" action="/PostShareItem">
	  		<p>
	  			<label for="url">地址:</label>
	  			<input type="text" id="url" name="url" style="width:220px" />
	  		</p>
	  		<p>
	  			<label for="tag">标签:</label>
	  			<input type="text" id="tag" name="tag" style="width:220px" />
	  		</p>
	  		<p>
	  			<label for="shortInfo">简介:</label>
	  			</p>
	  			<textarea rows="5" cols="30" id="shortInfo" name="shortInfo">
	  			</textarea>
	  		 <p>
	  			<input type="submit" value="发布"/>
	  		</p>
	  	</form>
			<div id="jiathis_style_32x32">
				<a class="jiathis_button_qzone"></a>
				<a class="jiathis_button_tsina"></a>
				<a class="jiathis_button_tqq"></a>
				<a class="jiathis_button_kaixin001"></a>
				<a class="jiathis_button_renren"></a>
				<a href="http://www.jiathis.com/share/" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
			</div>
			<script type="text/javascript" src="http://v1.jiathis.com/code/jia.js" charset="utf-8"></script>
 		</div>
 		<div style="clear:both"></div>
	 </div>
	 
    <%@include file="footer.jsp" %>
</body>

</html>