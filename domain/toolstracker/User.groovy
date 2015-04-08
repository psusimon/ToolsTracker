package toolstracker

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled
	FieldEngineerTeam feTeam
	ToolAdminCenter tac
	

	static transients = ['springSecurityService']

	static constraints = {
		  username(blank: false, unique: true)
		  password(blank: false)
		  feTeam(nullable: true)
		  tac(nullable: true)
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.Role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}

