import toolstracker.Role
import toolstracker.User
import toolstracker.UserRole

class BootStrap {

    def init = { servletContext ->
		def userRole = Role.findByAuthority("ROLE_USER") ?: new Role(authority: "ROLE_USER").save()
		def adminRole = Role.findByAuthority("ROLE_ADMIN") ?: new Role(authority: "ROLE_ADMIN").save()
		
		def user = new User(username: "simon", password: "password", enabled: true)
		println "Creating user " + user.username
		user.save(flush: true)
		
		// UserRole.create(user, adminRole)
    }
	
	def destroy = {
    }
}
