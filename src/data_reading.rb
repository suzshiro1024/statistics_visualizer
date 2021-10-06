require_relative './batting_stats.rb'
require_relative './pitching_stats.rb'

def openfile (select)
    print("select data file:")
    filename = gets.chomp
    
    i = nil
    array = []
    if(select == 0)
        File.open('../' + filename, "r") do |file|
            file.each_line do |data|
                s = data.split(',')
                i = PitchingStats.new(s[0].to_i,s[1].to_i,s[2].to_i,s[3].to_i,s[4].to_i,s[5].to_i,s[6].to_i,s[7].to_i,s[8].to_i,s[9].to_i,s[10].to_i,s[11].to_i,s[12].to_i,s[13].to_i,s[14].to_i)
                data_array = []
                data_array << i.earned_run_average
                data_array << i.kbb
                data_array << i.whip
                array << data_array
            end
        end
        
    elsif(select == 1)
        File.open('../' + filename, "r") do |file|
            file.each_line do |data|
                s = data.split(',')
                i = BattingStats.new(s[0].to_i,s[1].to_i,s[2].to_i,s[3].to_i,s[4].to_i,s[5].to_i,s[6].to_i,s[7].to_i,s[8].to_i,s[9].to_i,s[10].to_i,s[11].to_i,s[12].to_i,s[13].to_i,s[14].to_i,s[15].to_i)
                data_array = []
                data_array << i.average
                data_array << i.on_base_percentage
                data_array << i.slugging
                data_array << i.isolated_power
                data_array << i.babip
                data_array << i.woba
                array << data_array
            end
        end
    end
    array
end