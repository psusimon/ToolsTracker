package toolstracker

class LookupController {

    def index() { 
		def toolsList = Tool.list();
		render(view: "lookup", model: [toolsList: toolsList])
	}
}
