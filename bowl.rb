class Game

  def initialize
    @rolls = []
  end

  def roll(pins_knocked_down)
    @rolls << pins_knocked_down
  end

  def score
    score = 0
    index = 0
    10.times do
      if frame(index) == 10
        score += 10 + @rolls[index+2]
        index += 2
      elsif @rolls[index] == 10
        score += 10 + frame(index+1)
        index += 1
      else score += frame(index)
        index +=2
      end
    end
    score
  end

  def frame index
    @rolls[index] + @rolls[index+1]
  end
end
