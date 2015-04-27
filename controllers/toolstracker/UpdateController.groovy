package toolstracker

class UpdateController {

	Tool currentTool
	
    def index(int id) { 
		currentTool = Tool.get(id)
		def maintenanceSchedOptions = MaintenanceSchedule.list();
		render(view: "update", model: [currentTool: currentTool, maintenanceSchedule: maintenanceSchedOptions])
	}
	
	def updateTool(String toolName, String lookupNumber, String maintenanceHistory, String maintenanceSchedule) {
		if(maintenanceSchedule) {
			def newMaintenanceSchedule = MaintenanceSchedule.findByScheduleFrequency(maintenanceSchedule)
			currentTool.lookupNumber = lookupNumber
			currentTool.description = toolName
			currentTool.maintenanceHistory = maintenanceHistory
			currentTool.maintenanceSchedule = newMaintenanceSchedule
			currentTool.save(flush: true)
			if(!currentTool.save()) {
				currentTool.errors.each {
					println it
				}
			}
		} else {
			currentTool.lookupNumber = lookupNumber
			currentTool.description = toolName
			currentTool.maintenanceHistory = maintenanceHistory
			currentTool.save(flush: true)
			if(!currentTool.save()) {
				currentTool.errors.each {
					println it
				}
			}
		}
		
		def maintenanceSchedOptions = MaintenanceSchedule.list();
		render(view:"manager", model:[maintenanceSchedule: maintenanceSchedOptions, addSuccess: true])
	}
}
