<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="box">
	<div class="box-header">
		<h3 class="box-title">List articles result</h3>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<c:choose>
			<c:when test="${empty articles}">
				<p>No article</p>
			</c:when>
			<c:otherwise>
				<table id="myTable" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Title</th>
							<th>Description</th>
							<th>Link Article</th>
							<th style="display:none;">Link Image</th>
							<th>Image</th>
							<th>RSS</th>
							<!-- <th>Add</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${articles}" var="article" varStatus="loop">
							<tr>
								<td align="center"><c:out value="${loop.index + 1}" /></td>
								<td>${article.title}</td>
								<td>${article.description}</td>
								<td><a target="_blank" href="${article.linkArticle}">${article.linkArticle}</a></td>
								<td style="display:none;"><a target="_blank" href="${article.linkImage}">${article.linkImage}</a></td>
								<td><img id="articleimg" src="${article.linkImage}" alt="article image"
									width="200" height="100" /></td>
								<td>${article.idDummy}</td>
								<%-- <td align="center"><a href="#myModal_${loop.index + 1}"
									data-toggle="modal"> <i class="fa fa-plus"></i>
								</a></td> --%>
							</tr>
							<%-- <div id="myModal_${loop.index + 1}" class="modal fade">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title">Confirm Delete</h4>
										</div>

										<div class="modal-body">
											<p id="demo">${article.title}</p>
										</div>
										<div class="modal-footer">

											<button type="button" class="btn btn-default btn-flat"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary btn-flat"
												data-dismiss="modal" onclick="addArticle()">Add</button>
										</div>
									</div>
								</div>
							</div> --%>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Add Article</h4>
			</div>
			<div class="modal-body">
				<p>Are you sure you want to add this article :<span id="modeltitle"></span> ?</p>
				<p><input type="hidden" class="form-control" id="title" /></p>
				<p><input type="hidden" class="form-control" id="description" /></p>
				<p><input type="hidden" class="form-control" id="linkArticle" /></p>
				<p><input type="hidden" class="form-control" id="linkImage" /></p>
				<p><input type="hidden" class="form-control" id="rssLinkId" /></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-flat" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-flat" onclick="addArticle()" data-dismiss="modal">Save changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="<c:url value='/static/admin/dist/js/custom.js' />"></script>