<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Content Header (Page header) -->
<section class="content-header">
	<h4>Article Manager</h4>
	<ol class="breadcrumb">
		<li><a href="<c:url value="/admin/article" />"><i
				class="fa fa-newspaper-o"></i> Article Manager</a></li>
		<li class="active">Update article</li>
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
					<h3 class="box-title">Articles Information</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<c:url value="/admin/article/update" var="action" />
				<form:form action="${action}" method="POST" accept-charset="UTF-8"
					modelAttribute="article">
					<form:hidden path="id" />
					<form:hidden path="unsignedTitle" />
					<form:hidden path="hotPost" />
					<form:hidden path="views" />
					<form:hidden path="createdAt" />
					<form:hidden path="updatedAt" />
					<div class="box-body">
						<div class="row">
							<div class="col-xs-6">
								<c:set var="titleError">
									<form:errors path="title" />
								</c:set>
								<div
									class="form-group ${not empty titleError ? 'has-error' :''}">
									<label>Article Title</label>
									<form:input path="title" type="text" class="form-control"
										placeholder="Enter article title" />
									<form:errors path="title" class="control-label" />
								</div>
							</div>
							
							<div class="col-xs-6">
								<div class="form-group">
									<label>Show Home</label> <select name="display"
										class="form-control">
										<option value="hide"
											${article.showHome eq false ? 'selected' : ''}>Hide</option>
										<option value="show"
											${article.showHome eq true ? 'selected' : ''}>Show</option>
									</select>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
									<label>Type Post</label> <select name="type"
										class="form-control">
										<option value="normal"
											${article.hotPost eq false ? 'selected' : ''}>Normal</option>
										<option value="hotpost"
											${article.hotPost eq true ? 'selected' : ''}>Hot
											Post</option>
									</select>
								</div>
							</div>

							<div class="col-xs-6">
								<label>RSS-Link Name</label>
								<form:select class="form-control" path="rssLink.id"
									items="${rssLinkes}" itemValue="id" itemLabel="name" />
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<c:set var="linkImageError">
									<form:errors path="linkImage" />
								</c:set>
								<div
									class="form-group ${not empty linkImageError ? 'has-error' :''}">
									<label>Link Image</label>
									<form:input path="linkImage" type="text" class="form-control"
										placeholder="Enter article link Image" />
									<form:errors path="linkImage" class="control-label" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<c:set var="linkArticleError">
									<form:errors path="linkArticle" />
								</c:set>
								<div
									class="form-group ${not empty linkArticleError ? 'has-error' :''}">
									<label>Article Title</label>
									<form:input path="linkArticle" type="text" class="form-control"
										placeholder="Enter article link Article" />
									<form:errors path="linkArticle" class="control-label" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<c:set var="desError">
									<form:errors path="description" />
								</c:set>
								<div class="form-group ${not empty desError ? 'has-error' :''}">
									<label class="required">Article Description</label>
									<form:textarea class="form-control" path="description"
										id="articledescription" />
									<form:errors path="description" class="control-label" />
								</div>
								<script src="<c:url value="/static/app/ckeditor/ckeditor.js" />"></script>
								<script>
									CKEDITOR.replace('articledescription');
								</script>
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-edit"></i> Update article
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