$(function() {
	$("#myTable").DataTable();
});

$("#article-gif").hide();

function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			$('#blah').attr('src', e.target.result).width(200).height(100);
		};

		reader.readAsDataURL(input.files[0]);
	}
}

$("#maincate").change(function() {
	var id = $("#maincate").val();
	$('#subcate').find('option').remove();
	
	$.ajax({
		url : "/ChuyenDeWeb/ajax/rsslink/get/" + id,
		type : 'GET',
		success : function(data) {
			// console.log("SUCCESS: ", data);
			$("#subcate").append(data);
		}
	});
});

function showListArticle() {
	var id = $("#subcate").val();
	$("#article-gif").show();
	$.ajax({
		url : "/ChuyenDeWeb/ajax/article/get/" + id,
		type : 'GET',
		beforeSend : function(req) {
			req.setRequestHeader("Accept", "text/html;type=ajax");
		},
		success : function(data) {
			// console.log("SUCCESS: ", data);
			$("#showData").empty();
			$("#showData").html(data);
			$("#article-gif").hide();
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}

$('table tbody tr  td').on('click', function() {
	$("#myModal").modal("show");
	$("#modeltitle").text($(this).closest('tr').children()[1].textContent);
	$("#title").val($(this).closest('tr').children()[1].textContent);
	$("#description").val($(this).closest('tr').children()[2].textContent);
	$("#linkArticle").val($(this).closest('tr').children()[3].textContent);
	$("#linkImage").val($(this).closest('tr').children()[4].textContent);
	$("#rssLinkId").val($(this).closest('tr').children()[6].textContent);
});

function addArticle() {

	var title = $("#title").val();
	var description = $("#description").val();
	var linkArticle = $("#linkArticle").val();
	var linkImage = $("#linkImage").val();
	var rssLinkId = $("#rssLinkId").val();

	$.ajax({
		url : "/ChuyenDeWeb/ajax/article/add",
		type : 'GET',
		contentType : "application/json",
		data : {
			title : title,
			description : description,
			linkArticle : linkArticle,
			linkImage : linkImage,
			rssLinkId : rssLinkId
		},
		dataType : 'json',
		success : function(data) {
			console.log("SUCCESS: ", data.responseText);
		},
		complete : function(r) {
			console.log("COMPLETE: ", r.responseText);
			if (r.responseText == "OK") {
				$("#articlesuccess").hide();
				$("#articlesuccess").fadeIn('slow');
				$('#articlesuccess').delay(2000).fadeOut('slow');
			} else {
				$("#articleerror").hide();
				$("#articleerror").fadeIn('slow');
				$('#articleerror').delay(2000).fadeOut('slow');
			}
		},
		error : function(e) {
			console.log("ERROR: ", e);
		}
	});
}