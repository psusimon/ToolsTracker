<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../images/favicon.ico">

<title>ToolsTracker: Reservation</title>

<!-- Bootstrap core CSS -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../css/navbar-fixed-top.css" rel="stylesheet">

<link href="../../css/lookup.css" rel="stylesheet">

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
					src="../../images/banner_logo_50.png"></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><g:link controller="home" action="index">Home</g:link></li>
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
		<g:if test="${updateSuccess}">
			<div class="alert alert-success" role="alert">
	        	Tool successfully updated.
	      	</div>
		</g:if>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Tool Details</h3>
			</div>
			<div class="panel-body">
				<table class="table">
					<tbody>
						<g:if test="${currentTool.description}">
							<tr>
								<td class="details-header-cell">Tool Name:</td>
								<td class="details-content-cell">
									${currentTool.description}
								</td>
							</tr>
						</g:if>
						<g:if test="${currentTool.lookupNumber}">
							<tr>
								<td class="details-header-cell">Model Number:</td>
								<td class="details-content-cell">
									${currentTool.lookupNumber}
								</td>
							</tr>
						</g:if>
						<g:if test="${currentTool.tac}">
							<tr>
								<td class="details-header-cell">Region:</td>
								<td class="details-content-cell">
									${currentTool.tac.region.name}
								</td>
							</tr>
						</g:if>
						<g:if test="${currentTool.currentStatus}">
							<tr>
								<td class="details-header-cell">Status:</td>
								<td class="details-content-cell">
									${currentTool.currentStatus}
								</td>
							</tr>
						</g:if>
						<g:if test="${currentTool.maintenanceHistory}">
							<tr>
								<td class="details-header-cell">Maintenance History:</td>
								<td class="details-content-cell">
									${currentTool.maintenanceHistory}
								</td>
							</tr>
						</g:if>
						<g:if test="${currentTool.maintenanceSchedule}">
							<tr>
								<td class="details-header-cell">Maintenance Schedule:</td>
								<td class="details-content-cell">
									${currentTool.maintenanceSchedule.scheduleFrequency}
								</td>
							</tr>
						</g:if>
					</tbody>
				</table>
				<g:form name="delete" action="deleteTool">
					<div class="form-group">
						<div class="col-sm-12 text-right">
							<button type="submit" value="Submit"
								class="btn btn-danger">Delete Tool</button>
						</div>
					</div>
				</g:form>
			</div>

		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Update Details</h3>
			</div>
			<div class="panel-body">
				<div class="panel-body form-horizontal payment-form">
					<g:form name="update" action="updateTool">
						<div class="form-group">
							<label for="concept" class="col-sm-3 control-label">Tool
								Name</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="toolName"
									name="toolName" value="${currentTool.description}">
							</div>
						</div>
						<div class="form-group">
							<label for="concept" class="col-sm-3 control-label">Tool
								Number</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="lookupNumber"
									name="lookupNumber" value="${currentTool.lookupNumber}">
							</div>
						</div>
						<div class="form-group">
							<label for="concept" class="col-sm-3 control-label">Maintenance
								History</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="maintenanceHistory"
									name="maintenanceHistory" value="${currentTool.maintenanceHistory}">
							</div>
						</div>
						<div class="form-group">
							<label for="concept" class="col-sm-3 control-label">Maintenance
								Schedule</label>
							<div class="col-sm-9">
								<select class="form-control" id="maintenanceSchedule"
									name="maintenanceSchedule">
									<option selected="selected"></option>
									<g:each var="schedule" in="${maintenanceSchedule}">
										<option>
											${schedule.scheduleFrequency}
										</option>
									</g:each>
								</select>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12 text-right">
								<button type="submit" value="Submit"
									class="btn btn-success">Update</button>
							</div>
						</div>
					</g:form>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../../js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
