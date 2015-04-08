package toolstracker

class ClientSite {
	
	Region region
	
    static constraints = { 
    }
	
	static hasOne = {
		[region: Region]
	}
}
