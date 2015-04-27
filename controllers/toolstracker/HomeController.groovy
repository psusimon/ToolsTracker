package toolstracker

class HomeController {
	
	User currentUser
	
    def index(String currentUsername) { 
		def u = User.get(1)
		def requestsList = Reservation.findAllByReservationStatus("Pending")
		def activeList = Reservation.findAllByReservationStatus("Active")
		render(view: "home", model: [requestsList: requestsList, activeList: activeList])
	}
}
