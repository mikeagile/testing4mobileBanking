require 'net/http'
require 'uri'
require 'json'

module CustomConfig

  attr_reader :browser, :pause, :host, :user, :enviroment

  @browser = ENV['BROWSER'].nil? ? nil : ENV['BROWSER'].downcase.to_sym
  @pause = (ENV['PAUSE'] || 0).to_i

  if ENV['USER'].nil? or ENV['PASS'].nil?
    user_pass = nil
  else
    user_pass = "#{ENV['USER']}:#{ENV['PASS']}@"
  end

  url = ENV['URL'].nil? ? $url : ENV['URL']
  @host = "http://#{user_pass}#{url}"

  enviroment = ENV['ENV'].nil? ? nil : ENV['ENV'].downcase.to_sym

end
