<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h4>Category Manager</h4>
	<ol class="breadcrumb">
		<li><a href="<c:url value="/admin/category" />"><i
				class="fa fa-folder-open-o"></i> Category Manager</a></li>
		<li class="active">Edit category</li>
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
					<h3 class="box-title">Category Information</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<c:url value="/admin/category/update" var="action" />
				<form:form action="${action}" method="POST" commandName="category" modelAttribute="category">
					<form:hidden path="id" />
					<form:hidden path="unsignedName" />
					<form:hidden path="createdAt" />
					<form:hidden path="updatedAt" />
					<div class="box-body">
						<div class="row">
							<div class="col-xs-6">
								<c:set var="nameError">
									<form:errors path="name" />
								</c:set>
								<div
									class="form-group ${not empty nameError ? 'has-error' :''}">
									<label>Name</label>
									<form:input path="name" type="text" class="form-control"
										placeholder="Enter name" />
									<form:errors path="name" class="control-label" />
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-edit"></i> Update category
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