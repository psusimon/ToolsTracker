<div class="list-group">
<g:if test="${it.tool}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Tool Model</b></h4>
		<p class="list-group-item-text">${it.tool.lookupNumber}</p>
	</a>
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Tool Description</b></h4>
		<p class="list-group-item-text">${it.tool.description}</p>
	</a>
</g:if>
<g:if test="${it.serviceTicket}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Deployment Region</b></h4>
		<p class="list-group-item-text">${it.serviceTicket.clientSite.region.name}</p>
	</a>
</g:if>
<g:if test="${it.deploymentDate}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Deployment Date</b></h4>
		<p class="list-group-item-text"><g:formatDate format="MM/dd/yyyy" date="${it.deploymentDate}"/></p>
	</a>
</g:if>
<g:if test="${it.duebackDate}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Return Date</b></h4>
		<p class="list-group-item-text"><g:formatDate format="MM/dd/yyyy" date="${it.duebackDate}"/></p>
	</a>
</g:if>
<g:if test="${it.reservationStatus}">
	<a href="#" class="list-group-item">
		<h4 class="list-group-item-heading"><b>Current Status</b></h4>
		<p class="list-group-item-text">${it.reservationStatus}</p>
	</a>
</g:if>
</div>
<div align="center">
	<g:link controller="reservation" action="approve" id="${it.id}">
		<button type="button" class="btn btn-lg btn-success">Approve Request</button>
	</g:link>
	<g:link controller="reservation" action="deny" id="${it.id}">
		<button type="button" class="btn btn-lg btn-danger">Deny Request</button>
	</g:link>
</div>