package toolstracker

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Date;

class ReservationController {

	Tool currentTool
	
    def index(int id) { 
		currentTool = Tool.findById(id)
		render(view: "reservation", model: [currentTool: currentTool])
	}
	
	def processReservation(String projectSite, String region, Date newDeploymentDate, Date newReturnDate) {
		def t = ServiceTicket.get(1)
		def requestor = User.get(1)
		def approver = User.get(1)
		def r = new Reservation(reservationStatus: "Pending", deploymentDate: newDeploymentDate, duebackDate: newReturnDate, tool: currentTool, serviceTicket: t, requestor: requestor, approver: approver)
		r.save(flush: true)
		if(!r.save()){
			r.errors.each {
				println it
			}
		}
		
		redirect(controller: "home", action: "index")
	}
	
	def approve(int id) {
		def r = Reservation.get(id)
		r.reservationStatus = "Active"
		r.save(flush: true)
		
		redirect(controller: "home", action: "index")
	}
	
	def deny(int id) {
		def r = Reservation.get(id)
		r.delete(flush: true)
		
		redirect(controller: "home", action: "index")
	}
}
