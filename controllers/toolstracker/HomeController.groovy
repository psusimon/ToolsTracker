package toolstracker

class HomeController {

    def index() { 
		def toolsList = Tool.list();
		def toolsListSE = Tool.findById(1);
		// def toolsListSE = Tool.findByTac();
		render(view: "home", model: [toolsList: toolsList, toolsListSE: toolsListSE])
	}
}
