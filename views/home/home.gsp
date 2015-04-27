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

<title>ToolsTracker: Home</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/navbar-fixed-top.css" rel="stylesheet">

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
					<li class="active"><g:link controller="home" action="index">Home</g:link></li>
					<li><g:link controller="lookup" action="index">Tool Lookup</g:link></li>
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
		<div class="jumbotron">
        <h1>GE ToolsTracker</h1>
      </div>
		<!-- Main component for a primary marketing message or call to action -->
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">My Active Tools</h3>
			</div>
			<div class="panel-body">
			<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>Tool</th>
							<th>Site</th>
							<th>Due Back Date</th>
						</tr>
					</thead>
					<tbody>
						<g:each status="i" in="${activeList}" var="request">
							<tr>
								<td>${i+1}</td>
								<td>${request.tool.description}</td>
								<td>${request.serviceTicket.clientSite.region.name}</td>
								<td><g:formatDate format="MM/dd/yyyy" date="${request.duebackDate}"/></td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title">My Pending Requests</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>Tool</th>
							<th>TAC</th>
							<th>Status</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each status="i" in="${requestsList}" var="request">
							<tr>
								<td>${i+1}</td>
								<td>${request.tool.description}</td>
								<td>${request.tool.tac.region.name}</td>
								<td>${request.reservationStatus}</td>
								<td><button type="submit" class="btn btn-sm btn-primary details-button"
				data-toggle="modal" data-target="#myModal${i}">Details
			</button></td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
		<g:each var="request" in="${requestsList}" status="i">
			<div class="modal fade" id="myModal${i}" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">×</button>
							<h4 class="modal-title" id="myModalLabel">Request Details</h4>
						</div>
						<div class="modal-body">
							<div class="tab-content">
								<div id="sectionA" class="tab-pane fade in active">
									<g:render template="requestDetailTemplate" bean="${request}" />
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
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
