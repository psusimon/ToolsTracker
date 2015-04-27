package toolstracker

class Tool {

	String lookupNumber
	String description
	String currentStatus
	String maintenanceHistory
	ToolAdminCenter tac
	Reservation currentReservation
	Reservation nextReservation
	MaintenanceSchedule maintenanceSchedule
	
    static constraints = {
		lookupNumber(nullable: true, blank: true)
		description(nullable: true, blank: true)
		currentStatus(nullable: true, blank: true)
		maintenanceHistory(nullable: true, blank: true)
		maintenanceSchedule(nullable: true, blank: true)
		currentReservation(nullable: true, blank: true)
		nextReservation(nullable: true, blank: true)
    }
	
	static hasOne = {
		[tac: ToolAdminCenter, currentReservation: Reservation, nextReservation: Reservation, maintenanceSchedule: MaintenanceSchedule]
	}
	
	static mapping = {
		sort "description"
	}
}
