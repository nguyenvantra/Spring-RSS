<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h4>User Manager</h4>
	<ol class="breadcrumb">
		<li><a href="<c:url value="/admin/user" />"><i
				class="fa fa-user"></i> User Manager</a></li>
		<li class="active">Reset password</li>
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
					<h3 class="box-title">User Information</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<c:url value="/admin/user/save" var="action" />
				<form:form action="${action}" method="POST" modelAttribute="user">
					<div class="box-body">
						<div class="row">
							<div class="col-xs-6">
								<c:set var="passwordHasBindError">
									<form:errors path="password" />
								</c:set>
								<div
									class="form-group ${not empty passwordHasBindError ? 'has-error' :''}">
									<label>New password</label>
									<form:input path="password" type="password"
										class="form-control" placeholder="Enter password" />
									<form:errors path="password" class="control-label" />
								</div>
							</div>
							<div class="col-xs-6">
								<c:set var="repasswordHasBindError">
									<form:errors path="confirmPassword" />
								</c:set>
								<div
									class="form-group ${not empty repasswordHasBindError ? 'has-error' :''}">
									<label>Confirm password</label>
									<form:input path="confirmPassword" type="password"
										class="form-control" placeholder="Enter comfirm-password" />
									<form:errors path="confirmPassword" class="control-label" />
								</div>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-edit"></i> Reset password
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