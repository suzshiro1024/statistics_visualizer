class BattingStats
    def initialize(tpa,ab,h,wb,tb,hr,rbi,bb,ibb,hbp,so,sb,cs,sh,sf,dp)
        @tpa = tpa  # Total Place Appearance
        @ab = ab    # At Bat
        @h = h      # Hit
        @wb = wb    # Two-Base Hit
        @tb = tb    # Three-Base Hit
        @hr = hr    # Home Run
        @rbi = rbi  # Run Batted In
        @bb = bb    # Base on Balls
        @ibb = ibb  # Intentional Base on Balls
        @hbp = hbp  # Hit by Pitch
        @so = so    # Strikeout
        @sb = sb    # Stolen Bases
        @cs = cs    # Caught Stealing
        @sh = sh    # Sacrifice Hit
        @sf = sf    # Sacrifice Fly
        @dp = dp    # Double Play
    end

    #Calculate single
    def single_hit
        single = @h - @wb - @tb - @hr
        single
    end

    # Calculate AVG
    def average        
        avg = @h.to_f / @ab.to_f
    end

    # Calculate OBP
    def on_base_percentage
        obp = (@h.to_f + @bb.to_f + @hbp.to_f) / (@ab.to_f + @bb.to_f + @hbp.to_f + @sf.to_f)
    end

    # Calculate TB
    def total_bases
        tb = single_hit + 2*@wb + 3*@tb + 4*@hr
    end

    # Calculate SLG
    def slugging
        slg = total_bases.to_f / @ab.to_f
    end

    # Calcukate IsoP
    def isolated_power
        isop = slugging - average
    end

    # Calculate OPS
    def ops
        ops = slugging + on_base_percentage
    end

    #Calculate BABIP
    def babip
        babip = (@h.to_f - @hr.to_f)/(@ab.to_f - @so.to_f - @hr.to_f + @sf.to_f)
    end

    # Calculate wOBA
    def woba
        woba = (0.72*(@bb - @ibb) + 0.75*@hbp + 0.9*single_hit + 1.24*@wb + 1.56*@tb + 1.95*@hr)/@tpa
    end

    # Calculate NOI
    def noi
        noi = (on_base_percentage + slugging/3)*1000
        noi.round(0).to_s
    end

    # Calculate RC27
    def rc27
        valA = @h + @bb + @hbp - @cs - @dp
        valB = total_bases + 0.26*(@bb + @hbp) + 0.53*@sh + 0.64*@sb - 0.03*@so
        valC = @ab + @bb + @hbp + @sh 
        rc = ((2.4*valC + valA)*(3*valC + valB)/(9*valC)) - 0.9*valC
        rc27 = rc/(@ab - @h + @cs + @sh + @dp)*27
        rc27.round(3).to_s
    end

    # Calculate XR27
    def xr27
        xr = 0.50*single_hit + 0.72*@wb + 1.04*@tb + 1.44*@hr + 0.34*(@bb + @hbp - @ibb) + 0.25*@ibb + 0.18*@sb -0.32*@cs - 0.09*(@ab - @h - @so) - 0.098*@so - 0.37*@dp + 0.37*@sf + 0.04*@sh
        xr27 = xr/(@ab - @h + @cs + @sh + @dp)*27
        xr27.round(3).to_s
    end
end