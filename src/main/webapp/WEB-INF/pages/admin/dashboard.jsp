<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h1>
		Dashboard <small>Data Infomation</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Dashboard</a></li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<!-- Info boxes -->
	<div class="row">
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-aqua">
				<div class="inner">
					<h3>${articleCount}</h3>
					<p>Articles</p>
				</div>
				<div class="icon">
					<i class="icon ion-document-text"></i>
				</div>
				<a href="<c:url value="/admin/article"/>" class="small-box-footer">More
					info <i class="fa fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-green">
				<div class="inner">
					<h3>${categoryCount}</h3>
					<p>Categories</p>
				</div>
				<div class="icon">
					<i class="ion ion-stats-bars"></i>
				</div>
				<a href="<c:url value="/admin/category" />" class="small-box-footer">More
					info <i class="fa fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${rssCount}</h3>
					<p>RSS Manager</p>
				</div>
				<div class="icon">
					<i class="ion ion-pricetags"></i>
				</div>
				<a href="<c:url value="/admin/rss" />" class="small-box-footer">More
					info <i class="fa fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<!-- ./col -->
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-red">
				<div class="inner">
					<h3>${rssLinkCount}</h3>
					<p>RSS Link</p>
				</div>
				<div class="icon">
					<i class="ion ion-link"></i>
				</div>
				<a href="<c:url value="/admin/rsslink" />" class="small-box-footer">More
					info <i class="fa fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		<!-- ./col -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">List hot articles</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<c:choose>
						<c:when test="${empty listArticle}">
							<p>No article</p>
						</c:when>
						<c:otherwise>
							<table id="myTable" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>ID</th>
										<th>Title</th>
										<th>Description</th>
										<th>Image</th>
										<th>RSS-Link</th>
										<th>Created By</th>
										<th>Views</th>
										<th>Hot post</th>
										<th>Show home</th>
										<th>Updated At</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listArticle}" var="article" varStatus="loop">
										<tr>
											<td align="center"><c:out value="${loop.index + 1}" /></td>
											<td>${article.title}</td>
											<td>${article.description}</td>
											<td><img id="articleimg" src="${article.linkImage}"
												alt="article image" width="200" height="100" /></td>
											<td>${article.rssLink.name}</td>
											<td>${article.user.name}</td>
											<td>${article.views}</td>
											<td align="center"><c:choose>
													<c:when test="${article.hotPost}">
														<span class="label bg-red">Hot Post</span>
													</c:when>
													<c:otherwise>
														<span class="label bg-green">Normal</span>
													</c:otherwise>
												</c:choose></td>
											<td align="center"><c:choose>
													<c:when test="${article.showHome}">
														<span class="label bg-red">Show</span>
													</c:when>
													<c:otherwise>
														<span class="label bg-green">Hide</span>
													</c:otherwise>
												</c:choose></td>
											<td>${article.updatedAt}</td>
										</tr>
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