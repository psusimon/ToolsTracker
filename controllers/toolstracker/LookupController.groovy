package toolstracker

class LookupController {

    def index() { 
		def description
		def lookupNumber
		def region = "Any"
		def status = "All"
		def searchSuccess = false
		def toolsList = Tool.list()
		
		render(view: "lookup", model: [description: description, lookupNumber: lookupNumber, region: region, status: status, searchSuccess: searchSuccess, toolsList: toolsList])
	}
	
	def processFilter(String description, String lookupNumber, String region, String status) {
		def toolsList
		def searchSuccess = true
		
		if (region.equals("Any")) {
			toolsList = Tool.list()
		} else {
			def searchRegion = Region.findByName(region)
			def searchTac = ToolAdminCenter.findByRegion(searchRegion)
			toolsList = Tool.findAllByTac(searchTac)
		}
		
		if (description) {
			toolsList = descriptionSearch(toolsList, description)
		}
		if (lookupNumber) {
			toolsList = lookupNumberSearch(toolsList, lookupNumber)
		}
		if(status.equals("Only Available") || status.equals("Only Unavailable")) {
			toolsList = statusSearch(toolsList, status)
		}
		
		
		render(view: "lookup", model: [description: description, lookupNumber: lookupNumber, region: region, status: status, searchSuccess: searchSuccess, toolsList: toolsList])
	}
	
	def descriptionSearch(ArrayList<Tool> t, String description) {
		ArrayList<Tool> filteredList = new ArrayList<Tool>()
		for (Tool currentTool : t) {
			if (currentTool.description.equalsIgnoreCase(description)) {
				filteredList.add(currentTool)
			}	
		}
		return filteredList
	}
	
	def lookupNumberSearch(ArrayList<Tool> t, String lookupNumber) {
		ArrayList<Tool> filteredList = new ArrayList<Tool>()
		for (Tool currentTool : t) {
			if (currentTool.lookupNumber.equalsIgnoreCase(lookupNumber)) {
				filteredList.add(currentTool)
			}
		}
		return filteredList
	}
	
	def statusSearch(ArrayList<Tool> t, String status) {
		ArrayList<Tool> filteredList = new ArrayList<Tool>()
		if (status.equals("Only Available")) {
			for (Tool currentTool : t) {
				if (currentTool.currentStatus.equalsIgnoreCase("Available")) {
					filteredList.add(currentTool)
				}
			}
		} else {
			for (Tool currentTool : t) {
				if (currentTool.currentStatus.equalsIgnoreCase("In Use") || currentTool.currentStatus.equalsIgnoreCase("Out For Repair")) {
					filteredList.add(currentTool)
				}
			}
		}
		return filteredList
	}
}
