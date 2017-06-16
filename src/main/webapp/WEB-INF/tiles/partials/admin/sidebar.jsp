<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<sec:authentication var="principal" property="principal" />
<c:set var="user" value="${principal.getUser()}" />

<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">

	<!-- Sidebar user panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img src="<c:url value='/upload/${user.avatar}' />"
				class="img-circle" alt="User Image">
		</div>
		<div class="pull-left info">
			<p>Nguyen Van Tra</p>
			<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
		</div>
	</div>

	<!-- sidebar menu: : style can be found in sidebar.less -->
	<ul class="sidebar-menu">
		<li class="header"> NAVIGATION</li>
		<li class="treeview"><a href="<c:url value="/admin" />"> <i
				class="fa fa-dashboard"></i> <span>Dashboard</span>
		</a></li>
		<li class="treeview"><a href="<c:url value="" />"> <i
				class="fa fa-folder-open-o"></i> <span>Category Manager</span>
		</a></li>
		<li class="treeview"><a href="<c:url value="" />"> <i
				class="fa fa-bookmark-o"></i> <span>Types of News Manager</span>
		</a></li>
		<li class="treeview"><a href="<c:url value="" />"> <i
				class="fa fa-newspaper-o"></i> <span>Articles Manager</span>
		</a></li>
		<li class="treeview"><a href="<c:url value="" />"> <i
				class="fa fa-link"></i> <span>RSS Manager</span>
		</a></li>
		<li class="treeview"><a href="<c:url value="" />"> <i
				class="fa fa-tags"></i> <span>Tag Manager</span>
		</a></li>
		<li class="treeview"><a href="<c:url value="/admin/user" />">
				<i class="fa fa-user"></i> <span>User Manager</span>
		</a></li>
		<li class="treeview"><a href="<c:url value="" />"> <i
				class="fa fa-edit"></i> <span>Comment Manager</span>
		</a></li>
	</ul>
</section>
<!-- /.sidebar -->