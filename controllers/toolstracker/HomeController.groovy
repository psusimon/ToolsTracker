package toolstracker

class HomeController {

    def index() { 
		def toolsList = Tool.list();
		render(view: "home", model: toolsList)
	}
}
