package toolstracker

import toolstracker.SessionService

class HomeController {
	
	User currentUser
	SessionService theSessionService
	
    def index(String currentUsername) { 
		currentUser = User.findByUsername(currentUsername)
		if(!currentUser) {
			currentUser = User.findById(1)
		}
		// store in session
		System.out.println(currentUser.username)
		render(view: "home")
	}
}
