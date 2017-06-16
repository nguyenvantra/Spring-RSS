<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row row-offcanvas row-offcanvas-right articleMain">
	<div class="col-12 col-md-9">
		<div class="col-xs-12 col-sm-8 col-md-8">
			<div class="row row-eq-height">
				<c:choose>
					<c:when test="${empty hotArticles}">
						<p>No Article Home</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${hotArticles}" var="article" varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="col-xs-12 col-sm-12 col-md-12">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-home"
											alt="${article.title}"></a>
										<h3 class="titleArticle">
											<a target="_blank" class="a-article"
												href="${article.linkArticle}">${article.title}</a>
										</h3>
										<p>
											<i class="fa fa-globe"></i><a
												class="rssData a-article sub-article"
												href="${article.linkArticle}">
												${article.rssLink.rss.name}</a> <span class="sub-article"><i
												class="fa fa-clock-o"></i> ${article.ago}</span>
										</p>
										<hr class="main">
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-xs-12 col-sm-6 col-md-6">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-sub-home"
											alt="${article.title}"></a>
										<h4 class="subArticle">
											<a target="_blank" class="a-article"
												href="${article.linkArticle}">${article.title}</a>
										</h4>
										<p>
											<i class="fa fa-globe"></i><a
												class="rssData a-article sub-article"
												href="${article.linkArticle}">
												${article.rssLink.rss.name}</a> <span class="sub-article"><i
												class="fa fa-clock-o"></i> ${article.ago}</span>
										</p>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="col-xs-12 col-sm-4 col-md-4">
			<c:choose>
				<c:when test="${empty articleHome}">
					<p>No Article Hot</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${articleHome}" var="article" varStatus="loop">
						<div class="row col-12 col-md-12">
							<h4 class="subArticle">
								<a target="_blank" class="a-article"
									href="${article.linkArticle}">${article.title}</a>
							</h4>
							<p>
								<i class="fa fa-globe"></i><a
									class="rssData a-article sub-article"
									href="${article.linkArticle}"> ${article.rssLink.rss.name}</a>
								<span class="sub-article"><i class="fa fa-clock-o"></i>
									${article.ago}</span>
							</p>
							<hr>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!--/span-->

	<div class="col-6 col-md-3 hidden-xs hidden-sm">
		<div class="col-12 col-md-12">
			<img alt="quangcao"
				src="<c:url value="/static/app/images/quangcao.png" />"
				id="quangcao">
		</div>
	</div>
</div>
<hr class="main">
<div class=""></div>

<div class="row row-offcanvas row-offcanvas-right row-eq-height">
	<div class="col-xs-12 col-sm-12 col-md-8">
		<div id="load-more-data">
		<c:choose>
			<c:when test="${empty articles}">
				<p>No Article Hot</p>
			</c:when>
			<c:otherwise>
				<c:forEach items="${articles}" var="article" varStatus="loop">
					<div class="col-xs-12 col-sm-12 col-md-12 article-header">
						<div class="col-xs-12 col-sm-4 col-md-4">
							<a target="_blank" href="${article.linkArticle}"><img
								src="${article.linkImage}" class="myimage img-category"
								alt="${article.title}"></a>
						</div>
						<div class="col-xs-12 col-sm-8 col-md-8">
							<h3 class="subArticle">
								<a target="_blank" class="a-article"
									href="${article.linkArticle}">${article.title}</a>
							</h3>

							<h4 class="article-description">${article.subDes}</h4>

							<p>
								<i class="fa fa-globe"></i><a
									class="rssData a-article sub-article"
									href="${article.linkArticle}"> ${article.rssLink.rss.name}</a>
								<span class="sub-article"><i class="fa fa-clock-o"></i>
									${article.ago}</span>
							</p>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-12">
			<button class="btn btn-primary btn-flat" id="load-more-article">
				<img src="<c:url value="/static/app/images/ajax-loader.gif" />"
					id="article-gif"> LOAD MORE ARTICLE
			</button>
		</div>
	</div>

	<div class="col-md-4 hidden-xs hidden-sm">
		<div class="col-12 col-md-12">
			<img alt="quangcao"
				src="<c:url value="/static/app/images/quangcao.png" />"
				id="quangcao">
		</div>
	</div>

</div>
<script>
	$(document).ready(function() {
		var pageArticle = 1;
		var id = "${id}";
		$("#article-gif").hide();

		$("#load-more-article").click(function(e) {
			e.preventDefault();
			pageArticle++;
			loadMoreArticle(id, pageArticle);
		});

		function loadMoreArticle(id, page) {
			$("#article-gif").show();
			$.ajax({
				type : "GET",
				url : "/ChuyenDeWeb/ajax/article/loadmore/" + id + "/" + page,
				success : function(response) {
					$("#article-gif").hide();
					$("#load-more-data").append(response);
				},
				error : function(response) {
					console.log("error:" + response);
				}
			});
		}
	});
</script>
