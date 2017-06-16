<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<tiles:importAttribute name="stylesheets" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

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
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="../index2.html" class="navbar-brand"><b>Admin</b>TMS</a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		<div class="content-wrapper">
			<div class="container">
				<tiles:insertAttribute name="main" />
			</div>
		</div>
	</div>
</body>
</html>