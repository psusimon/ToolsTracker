package toolstracker

class Role {

	String description;
	
    static constraints = {
		description(nullable: true, blank: false)
    }
}
