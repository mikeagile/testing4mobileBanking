require "capybara/cucumber"

class Buttons < GenericPage

	def initialize
		super
	end

	def press_menu
		Capybara::find_by_id($ELEMENTS['btnMenu']).click
	end

	def press_option_menu (element_id) 
		Capybara::find_by_id($ELEMENTS[element_id]).click
	end

	def press_id (element_id) 
		scroll_into_view(element_id)
		sleep 1
		Capybara::find_by_id($ELEMENTS[element_id]).click
	end

	def press_continue
		scroll_into_view ('btnContinue')
		sleep 1
		Capybara::find_by_id($ELEMENTS['btnContinue']).click
	end

    def check_LOPD
    	scroll_into_view ('chkLOPD')
	    sleep 1
        Capybara::find_by_id($ELEMENTS['chkLOPD']).click
    end
end
