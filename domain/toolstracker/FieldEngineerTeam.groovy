package toolstracker

class FieldEngineerTeam {

	User contactUser
	ServiceTicket serviceTicket
	
    static constraints = {
		contactUser(nullable: false, blank: false)
    }
	
	static hasOne = {
		[contactUser: User, serviceTicket: ServiceTicket]
	}
}
