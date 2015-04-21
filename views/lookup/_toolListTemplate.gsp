<g:each status="i" in="${toolsList}" var="tool">
	<tr>
		<td>
			${tool?.tac?.region?.name}
		</td>
		<td>
			${tool.lookupNumber}
		</td>
		<td>
			${tool.description}
		</td>
		<td>
		<g:if test="${tool.currentStatus == 'Available'}">
			<button type="submit" class="btn btn-sm btn-success details-button"
				data-toggle="modal" data-target="#myModal${i}">Details
			</button>
		</g:if>
		<g:else> 
			<button type="submit" class="btn btn-sm btn-danger details-button"
				data-toggle="modal" data-target="#myModal${i}">Details
			</button>
		</g:else>
		</td>
	</tr>
</g:each>