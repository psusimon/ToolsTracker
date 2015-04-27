package toolstracker

class SessionService {

	User currentUser
	
    def setUserById(int id) {
		currentUser = User.findById(id)
	}
	
	def setUserByUsername(String username) {
		currentUser = User.findByUsername(username)
	}
	
	def getCurrentUser() {
		return currentUser
    }
}
