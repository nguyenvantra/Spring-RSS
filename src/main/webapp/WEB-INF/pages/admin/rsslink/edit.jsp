<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h4>RSS-Link Manager</h4>
	<ol class="breadcrumb">
		<li><a href="<c:url value="/admin/rsslink" />"><i
				class="fa fa-link"></i> RSS-Link Manager</a></li>
		<li class="active">Edit RSS-Link</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-10 col-md-offset-1">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Sub-Category Information</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<c:url value="/admin/rsslink/update" var="action" />
				<form:form action="${action}" method="POST" accept-charset="UTF-8" modelAttribute="rssLink">
					<form:hidden path="id" />
					<form:hidden path="createdAt" />
					<form:hidden path="updatedAt" />
					<div class="box-body">
						<div class="row">
							<div class="col-xs-6">
								<label>RSS Name</label>
								<form:select class="form-control" path="rss.id" >
   									<form:options items="${rsses}" itemValue="id" itemLabel="name"/>
								</form:select>
							</div>
							
							<div class="col-xs-6">
								<label>Category Name</label>
								<form:select class="form-control" path="category.id" >
   									<form:options items="${categories}" itemValue="id" itemLabel="name"/>
								</form:select>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-6">
								<c:set var="nameError">
									<form:errors path="name" />
								</c:set>
								<div
									class="form-group ${not empty nameError ? 'has-error' :''}">
									<label>RSS-Link Name</label>
									<form:input path="name" type="text" class="form-control"
										placeholder="Enter rss link name" />
									<form:errors path="name" class="control-label" />
								</div>
							</div>
						
							<div class="col-xs-6">
								<c:set var="rssLinkError">
									<form:errors path="linkRSS" />
								</c:set>
								<div
									class="form-group ${not empty rssLinkError ? 'has-error' :''}">
									<label>RSS-Link</label>
									<form:input path="linkRSS" type="text" class="form-control"
										placeholder="Enter rss link" />
									<form:errors path="linkRSS" class="control-label" />
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-edit"></i> Update Sub-Category
						</button>
					</div>
				</form:form>
			</div>
			<!-- /.box -->
		</div>
		<!--/.col -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->