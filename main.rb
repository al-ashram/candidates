# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

## Your test code can go here


loop do
puts "Please choose one of the following commands: find #, all, qualified, or quit"
response = gets.chomp
  if response.match(/\bfind\s\d+\b/) 
    id = response[/\d+/].to_i
    pp find (id)
  elsif response == "all".downcase
    pp @candidates
  elsif response == "qualified"
    pp ordered_by_qualifications(@candidates)
  elsif response == "quit".downcase
    break
  end
end