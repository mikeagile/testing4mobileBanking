
Given(/^Access to web$/) do
   visit $url_app
   sleep 1
end

When(/^check global position$/) do
  page=GenericPage.new
  page.check_id('lblAccounts')
  page.check_id('lblCards')
  page.check_id('lblLoans') 
  takepicture('Check global position') 
end

Then(/^select transfer$/) do
  btn=Buttons.new
  btn.press_menu
  takepicture('Press menu') 
  btn.press_option_menu('optTransfer')
  takepicture('Select transfer') 
  btn.press_id('opToPopularAccount')
  takepicture('Select operation to popular account') 

end

Given(/^select source account$/) do
   page=GenericPage.new
   btn=Buttons.new
   btn.press_id('selOrigin')
   takepicture('Press select source account') 
   page.select_by_position(1,'lstOriginAccount')
   takepicture('Select source account') 
end

Given(/^select destination account$/) do
   page=GenericPage.new
   btn=Buttons.new
   btn.press_id('selDestination')
   takepicture('Press select destination account') 
   page.select_by_position(1,'lstDestinationAccount')
   takepicture('Select destination account') 
end

When(/^set amount "(.*?)", comments "(.*?)", phone "(.*?)" and email "(.*?)"$/) do |arg1,arg2,arg3,arg4|
   page=GenericPage.new
   txt=Inputs.new
   txt.set_amount(arg1)
   txt.set_comments(arg2)
   page.scroll_into_view('lblNotifications')
   txt.set_phone(arg3)
   txt.set_mail(arg4)
   takepicture('Set amount and commets') 
end

Then(/^set key operations "(.*?)", check LOPD and press continue$/) do |arg1|
   btn=Buttons.new
   txt=Inputs.new
   txt.set_key_operations(arg1)
   btn.check_LOPD
   btn.press_continue
   takepicture('Press continue') 
end

