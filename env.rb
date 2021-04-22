# require 'watir'
# require 'pry'
# require 'rspec'
#require "browser.rb"
binding.pry
Dir["../pages/**/*.rb"].sort.each { |file| require file }
Dir["../tests/*.rb"].sort.each { |file| require file }
Dir["../support/*.rb"].sort.each { |file| require file }    