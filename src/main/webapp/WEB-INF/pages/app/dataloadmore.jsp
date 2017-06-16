<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<a target="_blank" class="a-article" href="${article.linkArticle}">${article.title}</a>
					</h3>

					<h4 class="article-description">${article.subDes}</h4>

					<p>
						<i class="fa fa-globe"></i><a
							class="rssData a-article sub-article"
							href="${article.linkArticle}"> ${article.rssLink.rss.name}</a> <span
							class="sub-article"><i class="fa fa-clock-o"></i>
							${article.ago}</span>
					</p>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>