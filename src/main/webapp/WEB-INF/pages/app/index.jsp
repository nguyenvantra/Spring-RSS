<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row row-offcanvas row-offcanvas-right articleMain">
	<div class="col-12 col-md-9">
		<div class="col-xs-12 col-sm-8 col-md-8">
			<div class="row row-eq-height">
				<c:choose>
					<c:when test="${empty listArticleHome}">
						<p>No Article Home</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleHome}" var="article"
							varStatus="loop">
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
				<c:when test="${empty listArticleHotPost}">
					<p>No Article Hot</p>
				</c:when>
				<c:otherwise>
					<c:forEach items="${listArticleHotPost}" var="article"
						varStatus="loop">
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
<div class="row row-offcanvas row-offcanvas-right">
	<!-- Load data Category Xa Hoi -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/1/xa-hoi" />"
					class="btn btn-sm btn-flat bg-custom a-custom">XÃ HỘI</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleXahoi}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleXahoi}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- Load data Category The Gioi -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/2/the-gioi" />"
					class="btn btn-sm btn-flat bg-custom a-custom">THẾ GIỚI</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleThegioi}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleThegioi}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="clearfix visible-sm"></div>

	<!-- Load data Category Van Hoa -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/3/van-hoa" />"
					class="btn btn-sm btn-flat bg-custom a-custom">VĂN HOÁ</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleVanhoa}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleVanhoa}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="clearfix visible-md"></div>
	<div class="clearfix visible-lg"></div>

	<!-- Load data Category Kinh Te -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/4/kinh-te" />"
					class="btn btn-sm btn-flat bg-custom a-custom">KINH TẾ</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleKinhte}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleKinhte}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="clearfix visible-sm"></div>

	<!-- Load data Category Giao Duc -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/5/giao-duc" />"
					class="btn btn-sm btn-flat bg-custom a-custom">GIÁO DỤC</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleGiaoduc}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleGiaoduc}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- Load data Category Phap Luat -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/7/phap-luat" />"
					class="btn btn-sm btn-flat bg-custom a-custom">PHÁP LUẬT</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticlePhapluat}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticlePhapluat}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="clearfix visible-md"></div>
	<div class="clearfix visible-lg"></div>
	<div class="clearfix visible-sm"></div>

	<!-- Load data Category The Thao -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/9/the-thao" />"
					class="btn btn-sm btn-flat bg-custom a-custom">THỂ THAO</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleThethao}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleThethao}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- Load data Category Giai Tri -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/6/giai-tri" />"
					class="btn btn-sm btn-flat bg-custom a-custom">GIẢI TRÍ</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleGiaitri}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleGiaitri}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="clearfix visible-sm"></div>

	<!-- Load data Category Xe Co -->
	<div class="col-xs-12 col-sm-6 col-md-4">
		<div class="main-category">
			<div class="main-title-head">
				<a href="<c:url value="/10/xe-co" />"
					class="btn btn-sm btn-flat bg-custom a-custom">XE CỘ</a>
			</div>
			<div class="main-content">
				<c:choose>
					<c:when test="${empty listArticleXeco}">
						<p>No Article</p>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listArticleXeco}" var="article"
							varStatus="loop">
							<c:choose>
								<c:when test="${loop.first}">
									<div class="content-first">
										<a target="_blank" href="${article.linkArticle}"><img
											src="${article.linkImage}" class="myimage img-category"
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
									<div class="content-normal">
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
										<hr>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
