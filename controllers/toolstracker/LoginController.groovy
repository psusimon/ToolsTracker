package toolstracker

class LoginController {

    def index() { 
		render(view: "login")
	}
	
	def authenticate(String username, String password) {
		User currentUser = User.findByUsername(username)
		if(currentUser) {
			HomeController.index()
		} else {
		render(view: "login")
		}
	} 
}
