require "capybara/cucumber"

class Inputs < GenericPage

	def initialize
		super
	end

	def set_amount (amount)
		Capybara::fill_in $ELEMENTS['txtAmount'], :with => amount
		sleep 1
	end

	def set_comments (comments)
  		Capybara::fill_in $ELEMENTS['txtComments'], :with => comments
  		sleep 1
	end

	def set_phone (phone)
  		Capybara::fill_in $ELEMENTS['txtPhone'], :with => phone
  		sleep 1
	end
	
	def set_mail (mail)
  		Capybara::fill_in $ELEMENTS['txtMail'], :with => mail
  		sleep 1
	end

	def set_key_operations (key)
  		Capybara::fill_in $ELEMENTS['txtKeyOperations'], :with => key
  		sleep 1
	end
end
