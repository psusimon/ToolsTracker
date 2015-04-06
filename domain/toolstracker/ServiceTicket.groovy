package toolstracker

class ServiceTicket {
	
	ClientSite clientSite

    static constraints = {
    }
	
	static hasOne = {
		[clientSite: ClientSite]
	}
}
