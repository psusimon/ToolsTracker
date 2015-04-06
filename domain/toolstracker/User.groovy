package toolstracker

class User {
	
	String username
	Role role
	FieldEngineerTeam feTeam
	ToolAdminCenter tac

    static constraints = {
		username(nullable: false, blank: false)
		feTeam(nullable: true)
		tac(nullable: true)
    }
	
	static hasOne = {
		[role: Role, feTeam: FieldEngineerTeam, tac: ToolAdminCenter]
	}
}
