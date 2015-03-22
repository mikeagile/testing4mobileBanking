Before do |scenario|
  
end

After do |scenario|
 page.execute_script "localStorage.clear();"
 sleep 2
 browser = Capybara.current_session.driver.browser
 browser.manage.delete_all_cookies
 Capybara.reset_sessions!
 page.execute_script "window.close();"

end

# Function to wait for Ajax.
AfterStep do |scenario|
  Timeout.timeout(Capybara.default_wait_time) do
    begin
      loop until page.evaluate_script('jQuery.active').zero? do
        sleep 1
        print "."
      end
    rescue => e
      true
    end
  end
end
