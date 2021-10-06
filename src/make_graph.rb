require 'rubygems'
require 'gruff'
require_relative './data_reading.rb'

print ("select mode(Pitcher => 0, Batter => 1):")
control = gets.to_i # select mode

graph = Gruff::Net.new   # make new net graph
data = openfile(control)

if(control == 0)    # Pitcher Mode
    graph.title = "Pitchig Stats"
    graph.labels = {
        0 => 'ERA',
        1 => 'K/BB',
        2 => 'WHIP'
    }
elsif(control == 1) # Batter Mode
    graph.title = "Batting Stats"
    graph.labels = {
        0 => 'AVG',
        1 => 'OBP',
        2 => 'SLG',
        3 => 'ISO',
        4 => 'BABIP',
        5 => 'wOBA'
    }
end

graph.line_width = 3
graph.dot_radius = 4
data.each_with_index do |data,i|
    graph.data :"data#{i + 1}", data
end
graph.write('../stats.png')