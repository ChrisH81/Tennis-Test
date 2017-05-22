
class TennisGame1

  LOVE = 0
  FIFTEEN = 1
  THIRTY = 2
  FORTY = 3
  SCORES = [LOVE, FIFTEEN, THIRTY, FORTY]

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1points = 0
    @p2points = 0
  end

  def won_point(player_name)
    if player_name == @player1
      @p1points += 1
    else
      @p2points += 1
    end
  end

  def score
    result = ""
    temp_score = 0
    if equal_score?
      result = equal_score
    elsif matchpoint?
      result = score_after_deuce
    else
      result = temp
      # (1..2).each do |i|
      #   if i == 1
      #     temp_score = @p1points
      #   else
      #     result += "-"
      #     temp_score = @p2points
      #   end
      #   result += score_names[temp_score]
      # end
    end
    result
  end

  def temp(score_names)
    SCORES[@p1points] + SCORES[@p2points]
  end

  def score_names(temp)
    {
      LOVE => "Love",
      FIFTEEN => "Fifteen",
      THIRTY => "Thirty",
      FORTY => "Forty"
    }
  end

  def equal_score
    case @p1points
    when LOVE
      "Love-All"
    when FIFTEEN
      "Fifteen-All"
    when THIRTY
      "Thirty-All"
    else
      "Deuce"
    end
  end

  def matchpoint?
    @p1points >= 4 || @p2points >= 4
  end

  def equal_score?
    @p1points == @p2points
  end

  def score_after_deuce
    score_diff = @p1points - @p2points
    if score_diff == 1
      "Advantage " + @player1
    elsif score_diff == -1
      "Advantage " + @player2
    elsif score_diff >= 2
      "Win for " + @player1
    else
      "Win for " + @player2
    end
  end

end

class TennisGame2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @p1points = 0
    @p2points = 0
  end

  def won_point(player_name)
    if player_name == @player1
      p1Score()
    else
      p2Score()
    end
  end

  def score
    result = ""
    if (@p1points == @p2points and @p1points < 3)
      if (@p1points==0)
        result = "Love"
      end
      if (@p1points==1)
        result = "Fifteen"
      end
      if (@p1points==2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1points==@p2points and @p1points>2)
        result = "Deuce"
    end

    p1res = ""
    p2res = ""
    if (@p1points > 0 and @p2points==0)
      if (@p1points==1)
        p1res = "Fifteen"
      end
      if (@p1points==2)
        p1res = "Thirty"
      end
      if (@p1points==3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2points > 0 and @p1points==0)
      if (@p2points==1)
        p2res = "Fifteen"
      end
      if (@p2points==2)
        p2res = "Thirty"
      end
      if (@p2points==3)
        p2res = "Forty"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1points>@p2points and @p1points < 4)
      if (@p1points==2)
        p1res="Thirty"
      end
      if (@p1points==3)
        p1res="Forty"
      end
      if (@p2points==1)
        p2res="Fifteen"
      end
      if (@p2points==2)
        p2res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p2points>@p1points and @p2points < 4)
      if (@p2points==2)
        p2res="Thirty"
      end
      if (@p2points==3)
        p2res="Forty"
      end
      if (@p1points==1)
        p1res="Fifteen"
      end
      if (@p1points==2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p1points > @p2points and @p2points >= 3)
      result = "Advantage " + @player1
    end
    if (@p2points > @p1points and @p1points >= 3)
      result = "Advantage " + @player2
    end
    if (@p1points>=4 and @p2points>=0 and (@p1points-@p2points)>=2)
      result = "Win for " + @player1
    end
    if (@p2points>=4 and @p1points>=0 and (@p2points-@p1points)>=2)
      result = "Win for " + @player2
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @p1points +=1
  end

  def p2Score
    @p2points +=1
  end
end

class TennisGame3
  def initialize(player1, player2)
    @p1N = player1
    @p2N = player2
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end

  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
