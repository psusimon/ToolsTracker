package toolstracker

class ToolAdminCenter {
	
	User contactUser
	Region region
	
    static constraints = {
		contactUser(nullable: false, blank: false)
    }
	
	static hasOne = {
		[contactUser: User, region: Region]
	}
}
