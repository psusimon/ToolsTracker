<div class="list-group">
<g:if test="${it.lookupNumber}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Tool Model</b></h4>
		<p class="list-group-item-text">${it.lookupNumber}</p>
	</a>
</g:if>
<g:if test="${it.description}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Tool Description</b></h4>
		<p class="list-group-item-text">${it.description}</p>
	</a>
</g:if>
<g:if test="${it.currentStatus}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Current Status</b></h4>
		<p class="list-group-item-text">${it.currentStatus}</p>
	</a>
</g:if>
<g:if test="${it.maintenanceHistory}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Maintenance History</b></h4>
		<p class="list-group-item-text">${it.maintenanceHistory}</p>
	</a>
</g:if>
<g:if test="${it.maintenanceSchedule}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Maintenance Schedule</b></h4>
		<p class="list-group-item-text">${it.maintenanceSchedule?.scheduleFrequency}</p>
	</a>
</g:if>
</div>
<div align="center">
	<g:link controller="reservation" action="index" id="${it.id}">
		<button type="button" class="btn btn-lg btn-success">Reserve Tool</button>
	</g:link>
	<g:link controller="update" action="index" id="${it.id}">
		<button type="button" class="btn btn-lg btn-primary">Update Tool</button>
	</g:link>
</div>