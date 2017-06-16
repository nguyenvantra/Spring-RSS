<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
	
<tiles:importAttribute name="categories"/>

<header class="main-header">
	<nav class="navbar navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<a href="<c:url value="/home" />" class="navbar-brand"><b>Mi</b>Times</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-collapse">
					<i class="fa fa-bars"></i>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse pull-left" id="navbar-collapse">
				<ul class="nav navbar-nav">
					<c:set var="home" value="${home}"/>
					<li class="${ home == 'home' ? 'active' : '' }"><a href="<c:url value="/home" />"><i class="glyphicon glyphicon-home"></i></a></li>
					<c:set var="name" value="${name}"/>
					<c:forEach items="${categories}" var="category">
						<c:set var="namecate" value="${category.unsignedName}"/>
						<li class="${ name == namecate ? 'active' : '' }"><a href="<c:url value="/${category.id}/${category.unsignedName}" />">${category.name}</a></li>
					</c:forEach>
					 
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
</header>