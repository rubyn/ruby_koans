def score(dice)
  score = 0
  rolls = [0,0,0,0,0,0,0]
  dice.each { |roll| rolls[roll] += 1 }
  roll = 0
  rolls.each do |numRolled|
    if numRolled == 6
      score += roll * 200
      if roll == 1
        score += 1800
      end
      next
    elsif numRolled >= 3
      score += roll * 100
      numRolled -= 3
      if roll == 1
        score += 900
      end
    end
    if (roll == 1)
      score += numRolled * 100
    elsif (roll == 5)
      score += numRolled * 50
    end
    roll += 1
  end
  score
end