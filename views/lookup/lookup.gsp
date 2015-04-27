<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../images/favicon.ico">

<title>ToolsTracker: Lookup</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/navbar-fixed-top.css" rel="stylesheet">

<link href="../css/lookup.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img class="banner-logo"
					src="../images/banner_logo_50.png"></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><g:link controller="home" action="index">Home</g:link></li>
					<li class="active"><g:link controller="lookup" action="index">Tool Lookup</g:link></li>
					<li><g:link controller="manager" action="index">Tool Manager</g:link></li>
					<li><a href="#">Settings</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Log Out</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<g:if test="${searchSuccess}">
			<div class="alert alert-info" role="alert">
	        	Found <strong>${toolsList.size}</strong> results.
	      	</div>
		</g:if>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Search Options</h3>
				<span class="pull-right clickable"><a href="#">Show/Hide</a></span>
			</div>
			<div class="panel-body">
				<div class="panel-body form-horizontal payment-form">
					<g:form name="filter" action="processFilter">
					<div class="form-group">
						<label for="concept" class="col-sm-3 control-label">Tool
							Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="description"
								name="description" value="${description}">
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-sm-3 control-label">Tool
							Number</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="lookupNumber"
								name="lookupNumber" value="${lookupNumber}">
						</div>
					</div>
					<div class="form-group">
						<label for="region" class="col-sm-3 control-label">Region</label>
						<div class="col-sm-9">
							<g:if test="${region == 'Any'}">
								<select class="form-control" id="region" name="region">
									<option selected="selected">Any</option>
									<option>NE US</option>
									<option>SE US</option>
									<option>W EU</option>
								</select>
							</g:if>
							<g:if test="${region == 'NE US'}">
								<select class="form-control" id="region" name="region">
									<option>Any</option>
									<option selected="selected">NE US</option>
									<option>SE US</option>
									<option>W EU</option>
								</select>
							</g:if>
							<g:if test="${region == 'SE US'}">
								<select class="form-control" id="region" name="region">
									<option>Any</option>
									<option>NE US</option>
									<option selected="selected">SE US</option>
									<option>W EU</option>
								</select>
							</g:if>
							<g:if test="${region == 'W EU'}">
								<select class="form-control" id="region" name="region">
									<option>Any</option>
									<option>NE US</option>
									<option>SE US</option>
									<option selected="selected">W EU</option>
								</select>
							</g:if>
						</div>
					</div>
					<div class="form-group">
						<label for="status" class="col-sm-3 control-label">Status</label>
						<div class="col-sm-9">
							<g:if test="${status == 'All'}">
								<select class="form-control" id="status" name="status">
									<option selected="selected">All</option>
									<option>Only Available</option>
									<option>Only Unavailable</option>
								</select>
							</g:if>
							<g:if test="${status == 'Only Available'}">
								<select class="form-control" id="status" name="status">
									<option>All</option>
									<option selected="selected">Only Available</option>
									<option>Only Unavailable</option>
								</select>
							</g:if>
							<g:if test="${status == 'Only Unavailable'}">
								<select class="form-control" id="status" name="status">
									<option>All</option>
									<option>Only Available</option>
									<option selected="selected">Only Unavailable</option>
								</select>
							</g:if>
						</div>
					</div>
					<!-- <div class="form-group">
						<label for="date" class="col-sm-3 control-label">Date</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="date" name="date">
						</div>
					</div> -->
					<div class="form-group">
						<div class="col-sm-12 text-right">
							<button type="submit" value="Submit" class="btn btn-default preview-add-button">
								Filter
							</button>
						</div>
					</div>
					</g:form>
				</div>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Region</th>
					<th>Model</th>
					<th>Description</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:render template="toolListTemplate" bean="${toolsList}" />
			</tbody>
		</table>

		<!-- Modal  -->

		
		<g:each var="tool" in="${toolsList}" status="i">
			<div class="modal fade" id="myModal${i}" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">×</button>
							<h4 class="modal-title" id="myModalLabel">Tool Details</h4>
						</div>
						<div class="modal-body">
							<div class="tab-content">
								<div id="sectionA" class="tab-pane fade in active">
									<g:render template="toolDetailTemplate" bean="${tool}" />
								</div>
							</div>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
		</g:each>
	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/lookup.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
