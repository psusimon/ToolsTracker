package toolstracker

class ToolAdminCenter {
	
	User contactUser
	Region region
	String description
	
    static constraints = {
		contactUser(nullable: false, blank: false)
    }
	
	static hasOne = {
		[contactUser: User, region: Region]
	}
}
