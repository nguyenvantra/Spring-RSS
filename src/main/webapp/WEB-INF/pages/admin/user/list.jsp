<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Khai báo sử dụng JSTL Core Tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		User Manager <small>Data Infomation</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="<c:url value="/admin/user" />"><i
				class="fa fa-user"></i> User Manager</a></li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<c:if test="${not empty success}">
		<div class="alert alert-success alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">×</button>
			<i class="icon fa fa-check"></i> ${success}
		</div>
	</c:if>

	<c:if test="${not empty error}">
		<div class="alert alert-danger alert-dismissible">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">×</button>
			<i class="icon fa fa-exclamation-triangle"></i> ${error}
		</div>
	</c:if>
	<a href="<c:url value="/admin/user/add" />" class="btn btn-primary">
		<i class="fa fa-plus"></i> Add new user
	</a>
	<p>
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">List of users</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<c:choose>
						<c:when test="${empty users}">
							<p>No users</p>
						</c:when>
						<c:otherwise>
							<table id="myTable" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Email</th>
										<th>Role</th>
										<th>Created At</th>
										<th>Updated At</th>
										<th>Reset-Pass</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${users}" var="user" varStatus="loop">
										<tr>
											<td align="center"><c:out value="${loop.index + 1} " /></td>
											<td>${user.name}</td>
											<td>${user.email}</td>
											<td align="center"><c:choose>
													<c:when test="${user.admin}">
														<span class="label bg-red">Admin</span>
													</c:when>
													<c:otherwise>
														<span class="label bg-green">Member</span>
													</c:otherwise>
												</c:choose>
											</td>
											<td>${user.createdAt}</td>
											<td>${user.updatedAt}</td>
											<td align="center"><a
												href="<c:url value="/admin/user/${user.id}/resetpass" />"
												title="Edit user"> <i class="fa fa-cog"></i>
											</a></td>
											<td align="center"><a
												href="<c:url value="/admin/user/${user.id}/edit" />"
												title="Edit user"> <i class="fa fa-pencil"></i>
											</a></td>
											<td align="center"><a href="#myModal_${user.id}"
												data-toggle="modal"> <i class="fa fa-trash"></i>
											</a></td>
										</tr>
										<div id="myModal_${user.id}" class="modal fade">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title">Confirm Delete</h4>
													</div>

													<div class="modal-body">
														<p>Are you sure you want to delete this user:
															${user.name} ?</p>
													</div>
													<div class="modal-footer">

														<button type="button" class="btn btn-default btn-flat"
															data-dismiss="modal">Close</button>
														<a href="<c:url value="/admin/user/${user.id}/delete" />"
															title="Delete" class="btn btn-primary btn-flat"><i
															class="fa fa-trash-o"></i> Delete</a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
</section>
<!-- /.content -->