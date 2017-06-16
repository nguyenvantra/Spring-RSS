<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<tiles:importAttribute name="javascripts" />
<tiles:importAttribute name="stylesheets" />

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />

<title><tiles:getAsString name="title" /></title>

<!-- Favicons -->
<link href="<c:url value="/static/app/images/favicon.png" />"
	rel="shortcut icon">

<!-- Load Stylesheets -->
<c:forEach var="css" items="${stylesheets}">
	<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
</c:forEach>

<!-- scripts -->
<c:forEach var="script" items="${javascripts}">
	<script src="<c:url value="${script}"/>"></script>
</c:forEach>
<!-- end scripts -->


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
			<tiles:insertAttribute name="header" />
		</header>
		<!-- Full Width Column -->
		<div class="content-wrapper">
			<div class="container">
				<tiles:insertAttribute name="main" />
			</div>
		</div>

		<footer class="main-footer">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>


	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
</body>
</html>