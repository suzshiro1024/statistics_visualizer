class PitchingStats
    def initialize(w,l,g,gs,cg,sho,sv,ip,h,r,er,hr,hb,bb,k)
        @w = w      # Win
        @l = l      # Lose
        @g = g      # Game
        @gs = gs    # Game Started
        @cg = cg    # Complete Games
        @sho = sho  # Shutouts
        @sv = sv    # Saves
        @ip = ip    # Inning Pitched
        @h = h      # Hit
        @r = r      # Runs
        @er = er    # Earned Runs
        @hr = hr    # Home Runs
        @hb = hb    # Hits Batsmen
        @bb = bb    # Base on Balls
        @k = k      # Strikeout
    end

    # Transform Inning Pitched
    def inning
        inning = 0
        decimal = @ip - @ip.to_i
        if((decimal*10).to_i == 1)
            inning = @ip.to_i + (1.0/3.0)
        elsif((decimal*10).to_i == 2)
            inning = @ip.to_i + (2.0/3.0)
        elsif((decimal*10).to_i == 0)
            inning = @ip.to_i
        end
        inning
    end
    
    # Calculate ERA
    def earned_run_average
        era = 9*@er.to_f / inning
        era.round(2).to_s
    end

    # Calculate K/BB
    def kbb
        kbb = @k.to_f / @bb.to_f
        kbb.round(2).to_s
    end

    #Calculate WHIP
    def whip
        whip = (@h.to_f + @bb.to_f) / inning
        whip.round(2).to_s
    end
end