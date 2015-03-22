require "capybara/cucumber"
require "yaml"

class GenericPage

	def initialize
		$ELEMENTS = YAML::load(File.open('./config/elements.yaml') )
	end

	def scroll_into_view (element_id)
		if Capybara::find_by_id(element_id, :visible => false).value
			Capybara::execute_script('document.getElementById("' + element_id + '").scrollIntoView(true);')
		end
	end

	def select_by_position(pos, list)
		Capybara::find_by_id($ELEMENTS[list]){pos}.click
	end

    def check_id(element_id)
       Capybara::page.assert_selector('#'+$ELEMENTS[element_id])
    end

	def check_not_id(element_id)
		Capybara::page.assert_no_selector('#'+$ELEMENTS[element_id])
	end

	def refresh
		Capybara::execute_script('location.reload(true);')
	end

end
