<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Category Manager <small>Data Infomation</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="<c:url value="/admin/category" />"><i
				class="fa fa-folder-open-o"></i> Category Manager</a></li>
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
	<a href="<c:url value="/admin/category/add" />" class="btn btn-primary">
		<i class="fa fa-plus"></i> Add new category
	</a>
	<p>
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">List of categories</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<c:choose>
						<c:when test="${empty categories}">
							<p>No categories</p>
						</c:when>
						<c:otherwise>
							<table id="myTable" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Unsigned Name</th>
										<th>Created By</th>
										<th>Created At</th>
										<th>Updated At</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${categories}" var="category" varStatus="loop">
										<tr>
											<td align="center"><c:out value="${loop.index + 1}" /></td>
											<td>${category.name}</td>
											<td>${category.unsignedName}</td>
											<td>${category.user.name}</td>
											<td>${category.createdAt}</td>
											<td>${category.updatedAt}</td>
											<td align="center"><a
												href="<c:url value="/admin/category/${category.id}/edit" />"
												title="Edit Category"> <i class="fa fa-pencil"></i>
											</a></td>
											<td align="center"><a href="#myModal_${category.id}"
												data-toggle="modal"> <i class="fa fa-trash"></i>
											</a></td>
										</tr>
										<div id="myModal_${category.id}" class="modal fade">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title">Confirm Delete</h4>
													</div>

													<div class="modal-body">
														<p>Are you sure you want to delete this category:
															${category.name} ?</p>
													</div>
													<div class="modal-footer">

														<button type="button" class="btn btn-default btn-flat"
															data-dismiss="modal">Close</button>
														<a href="<c:url value="/admin/category/${category.id}/delete" />"
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