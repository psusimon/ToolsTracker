package toolstracker

class MaintenanceSchedule {
	
	String scheduleFrequency

    static constraints = {
		scheduleFrequency(nullable: false, blank: false)
    }
}
