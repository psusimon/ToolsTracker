package toolstracker

class Reservation {
	
	String reservationStatus
	Date deploymentDate
	Date duebackDate
	Tool tool
	ServiceTicket serviceTicket
	User requestor
	User approver

    static constraints = {
		deploymentDate(nullable: false, blank: false)
		duebackDate(nullable: false, blank: false)
    }
	
	static hasOne = {
		[tool: Tool, serviceTicket: ServiceTicket, requestor: User, approver: User]
	}
}
