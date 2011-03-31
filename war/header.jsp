
	<style>
		#content {
			width: 960px;
			margin: 30px auto;
			padding: 10px;
			background: #EEE;	
			border: 1px solid #CCC;
		}

		h1 {
			margin: 0;
		}

		hr {
			border: none;
			height: 1px; line-height: 1px;
			background: #CCC;	
			margin-bottom: 20px;
			padding: 0;
		}

		p {
			margin: 0;	
			padding: 7px 0;
		}
		.menu { 
			height: 45px;
			display: block;
		}
		.menu ul {
			list-style: none;
			padding: 0;
			margin: 0;
		}
		.menu ul li {
			float: left;
			overflow: hidden;
			position: relative;
			text-align: center;
			line-height: 45px;
		}
		.menu ul li a {
			position: relative;
			display: block;
			width: 110px;
			height: 45px;
			font-family: Arial;
			font-size: 11px;
			font-weight: bold;
			letter-spacing: 1px;
			text-transform: uppercase;
			text-decoration: none;
			cursor: pointer;
		}
		.menu ul li a span {
			position: absolute;
			left: 0;
			width: 110px;
		}
		.menu ul li a span.out {
			top: 0px;
		}
		.menu ul li a span.over,
		.menu ul li a span.bg {
			top: -45px;
		}
		#menu {
			background: #EEE;
		}
		#menu ul li a {
			color: #000;
		}
		#menu ul li a span.over {
			color: #FFF;
		}

		#menu ul li span.bg {
			height: 45px;
			background: url('/images/bg_over.gif') center center no-repeat;
		}
		#menu2 {
			background: #000;		
		}
		#menu2 ul li a {
			color: #FFF;
		}
		#menu2 ul li a span.over {
			background: #FFF;
			color: #000;
		}
		#logo {
			width:960px;
			height:140px;
			background: url("/images/head.png");
			margin: auto auto;
			}
	</style>
	<script type="text/javascript" src="js/header.js"></script>
	<script language="javascript">
		$(document).ready(function() {

			/* 	1st example	*/

			/// wrap inner content of each anchor with first layer and append background layer
			$("#menu li a").wrapInner( '<span class="out"></span>' ).append( '<span class="bg"></span>' );

			// loop each anchor and add copy of text content
			$("#menu li a").each(function() {
				$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
			});

			$("#menu li a").hover(function() {
				// this function is fired when the mouse is moved over
				$(".out",	this).stop().animate({'top':	'45px'},	250); // move down - hide
				$(".over",	this).stop().animate({'top':	'0px'},		250); // move down - show
				$(".bg",	this).stop().animate({'top':	'0px'},		120); // move down - show

			}, function() {
				// this function is fired when the mouse is moved off
				$(".out",	this).stop().animate({'top':	'0px'},		250); // move up - show
				$(".over",	this).stop().animate({'top':	'-45px'},	250); // move up - hide
				$(".bg",	this).stop().animate({'top':	'-45px'},	120); // move up - hide
			});
					

			/*	2nd example	*/
			
			$("#menu2 li a").wrapInner( '<span class="out"></span>' );
			
			$("#menu2 li a").each(function() {
				$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
			});

			$("#menu2 li a").hover(function() {
				$(".out",	this).stop().animate({'top':	'45px'},	200); // move down - hide
				$(".over",	this).stop().animate({'top':	'0px'},		200); // move down - show

			}, function() {
				$(".out",	this).stop().animate({'top':	'0px'},		200); // move up - show
				$(".over",	this).stop().animate({'top':	'-45px'},	200); // move up - hide
			});

		});

	</script>
<!-- <script type="text/javascript">
function addWord()
{
	var nickname=document.getElementById("nickname").value;
	nickname = "Find Friend";
}
function deleteWord()
{
	var nickname=document.getElementById("nickname").value;
	nickname = "  ";
}
</script> -->
	
	<div id="logo">
		
	</div>
	<div id="content">
		<div id="menu" class="menu">
			<ul>
				<li><a href="index.jsp">我的主页</a></li>
				<li><a href="checkShareItem.jsp">我的分享</a></li>
				<li><a href="#">我的好友</a></li>
				<li><a href='<%=UserServiceFactory.getUserService().createLogoutURL(UserServiceFactory.getUserService().createLoginURL("/index.jsp")) %>'>logout</a></li>
			</ul>
			<form method="get" action="/search.jsp">
					搜索用户：
		  			<input type="text" id="nickname" name="nickname" />
		  			<input type="submit" value="搜索" />
		  	</form>
	
		</div>	
</div>


