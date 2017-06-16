<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<sec:authentication var="principal" property="principal" />
<c:set var="user" value="${principal.getUser()}" />

<tilesx:useAttribute name="current" />
<tiles:importAttribute name="javascripts" />
<tiles:importAttribute name="stylesheets" />

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport"/>

<title><tiles:getAsString name="title" /></title>

<!-- Favicons -->
<link href="<c:url value="/static/app/images/favicon.png" />"
	rel="shortcut icon">

<!-- Load Stylesheets -->
<c:forEach var="css" items="${stylesheets}">
	<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
</c:forEach>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<tiles:insertAttribute name="header" />
		</header>
		<aside class="main-sidebar">
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="<c:url value="/static/app/images/avatar.png" />" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${user.name}</p>
						<a href=""><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>

				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="treeview ${ current == 'dashboard' ? 'active' : '' }">
						<a href="<c:url value="/admin" />"> <i class="fa fa-dashboard"></i>
							<span>Dashboard</span>
					</a>
					</li>
					<li class="treeview ${ current == 'category' ? 'active' : '' }">
						<a href="<c:url value="/admin/category" />"> <i
							class="fa fa-folder-open-o"></i> <span>Category Manager</span>
						</a>
					</li>
					
					<li class="treeview ${ current == 'rss' ? 'active' : '' }">
						<a href="<c:url value="/admin/rss" />"> <i
							class="fa fa-tags"></i> <span>RSS Manager</span>
						</a>
					</li>
					
					<li class="treeview ${ current == 'rsslink' ? 'active' : '' }">
						<a href="<c:url value="/admin/rsslink" />"> <i
							class="fa fa-link"></i> <span>RSS Link Manager</span>
						</a>
					</li>
					
					<li class="treeview ${ current == 'article' ? 'active' : '' }">
						<a href="<c:url value="/admin/article" />"> <i
							class="fa fa-newspaper-o"></i> <span>Articles Manager</span>
						</a>
					</li>
					
					<li class="treeview ${ current == 'user' ? 'active' : '' }">
						<a
						href="<c:url value="/admin/user" />"> <i class="fa fa-user"></i>
							<span>User Manager</span>
						</a>
					</li>
					
				</ul>
			</section>
		</aside>
		<!-- /.sidebar -->

		<div class="content-wrapper">
			<tiles:insertAttribute name="main" />
		</div>

		<footer class="main-footer">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>

	<!-- scripts -->
	<c:forEach var="script" items="${javascripts}">
		<script src="<c:url value="${script}"/>"></script>
	</c:forEach>
	<!-- end scripts -->
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
</body>
</html>