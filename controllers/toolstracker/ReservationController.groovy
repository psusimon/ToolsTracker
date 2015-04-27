package toolstracker

class ReservationController {

    def index(int id) { 
		Tool currentTool = Tool.findById(id)
		render(view: "reservation", model: [currentTool: currentTool])
	}
	
	def processReservation() {
		
	}
}
