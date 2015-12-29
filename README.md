
## Feature

This framework are design for apply BDD (behavior-driven development) in project, and apply it within a framework agile.

## Code Example

* You can see an example of HTML template in /apps. 

* And, can see one use case of transfer. 

Examples:  

	Scenario Outline: transfer
	    Given select source account
	    And select destination account
	    When set amount "<amount>", comments "<comments>", phone "<phone>" and email "<email>"
	    Then set key operations "<key>", check LOPD and press continue
	    
	    Examples: 
	    | amount | comments | phone     | email                                   | key  |
	    | 1500   | rent car | 626962051 | miguel.angel.villar.gutierrez@gmail.com | 1234 |


* You will see the implementation in the folder /html/step_definitios.

Examples:  

	Then(/^set key operations "(.*?)", check LOPD and press continue$/) do |arg1|
	   btn=Buttons.new
	   txt=Inputs.new
	   txt.set_key_operations(arg1)
	   btn.check_LOPD
	   btn.press_continue
	   takepicture('Press continue') 
	end


* The steps consuming methods -page object pattern-, with Capybara API.

Examples:

	def press_continue
		scroll_into_view ('btnContinue')
		Capybara::find_by_id($ELEMENTS['btnContinue']).click
	end

## Motivation

We hope this will serve as code to help accelerate the development of quality software.

## Installation

Run -bundle install- to install the necessary ruby gems for use this framework. You will see the list in the Gemfie file.

## Tests

For run the test, after download the code, run -cucumber- in console mode.

Steps:
* cloned repository
* start a server with the repository, this demo is in the apps folder.
* execute "cucumber" in the command line

See video http://youtu.be/2lNQGTXLekw :)

Examples:

cucumber --tags @transfer

## Contributors

* Miguel Ángel Villar Gutiérrez (miguel.angel.villar.gutierrez@gmail.com).
* Read this post for more information: http://mikeagile.tumblr.com/post/117153244975/

## License

In progress by https://about.me/ma.villar
