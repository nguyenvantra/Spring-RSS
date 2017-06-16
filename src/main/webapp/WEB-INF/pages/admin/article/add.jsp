<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h4>Article Manager</h4>
	<ol class="breadcrumb">
		<li><a href="<c:url value="/admin/article" />"><i
				class="fa fa-tag"></i> Article Manager</a></li>
		<li class="active">Add new article</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Select RSS Link</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<c:url value="/admin/category/save" var="action" />
				<div class="box-body">
					<div class="row">
						<div class="col-xs-4">
							<select class="form-control" id="maincate">
								<option value="" disabled selected>Select Category</option>
								<c:forEach items="${categories}" varStatus="i" var="item">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>

						<div class="col-xs-4">
							<select class="form-control" id="subcate">
								<option value="" disabled selected>======NONE======</option>
							</select>
						</div>

						<div class="col-xs-4">
							<button type="submit" class="btn btn-primary"
								onclick="showListArticle()">
								<img src="<c:url value="/static/app/images/ajax-loader.gif" />"
					id="article-gif"><i class="fa fa-plus"></i> Get article
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!--/.col -->
	</div>
	<!-- /.row -->
	<div id="articlesuccess" class="alert alert-success alert-dismissible" style="display:none;">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<i class="icon fa fa-check"></i> Add article success!
	</div>

	<div id="articleerror" class="alert alert-danger alert-dismissible" style="display:none;">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<i class="icon fa fa-exclamation-triangle"></i> Article is exits database.
	</div>
	<div class="row">
		<div class="col-xs-12" id="showData"></div>
	</div>
</section>
<!-- /.content -->