package toolstracker

class ManagerController {

    def index() { 
		def maintenanceSchedOptions = MaintenanceSchedule.list();
		render(view:"manager", model:[maintenanceSchedule: maintenanceSchedOptions])
	}
	
	def addTool(String toolName, String lookupNumber, String maintenanceHistory, String maintenanceSchedule) {
		def newTac = ToolAdminCenter.findById(1)		
		if(maintenanceSchedule) {
			def newMaintenanceSchedule = MaintenanceSchedule.findByScheduleFrequency(maintenanceSchedule)
			def t = new Tool(lookupNumber: lookupNumber, description: toolName, currentStatus: "Available", maintenanceHistory: maintenanceHistory, tac: newTac, maintenanceSchedule: newMaintenanceSchedule, version: 0)
			t.save(flush: true)
			if(!t.save()) {
				t.errors.each {
					println it
				}
			}
		} else {
		def t = new Tool(lookupNumber: lookupNumber, description: toolName, currentStatus: "Available", maintenanceHistory: maintenanceHistory, tac: newTac, version: 0)
		t.save(flush: true)
		if(!t.save()) {
			t.errors.each {
				println it
			}
		}
		}
		
		def maintenanceSchedOptions = MaintenanceSchedule.list();
		render(view:"manager", model:[maintenanceSchedule: maintenanceSchedOptions, addSuccess: true])	
	}
}
