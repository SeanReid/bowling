require 'minitest/autorun'
require 'minitest/pride'
require './bowl'

class BowlTest < Minitest::Test

  def test_0_score
    game=Game.new
    20.times do
      game.roll(0)
    end
    assert_equal 0, game.score
  end

  def test_1_score
    game=Game.new
    20.times do
      game.roll(1)
    end
    assert_equal 20, game.score
  end

  def test_2_score
    game=Game.new
    20.times do
      game.roll(2)
    end
    assert_equal 40, game.score
  end

  def test_spare_frame_one
    game=Game.new
    game.roll(5)
    game.roll(5)
    game.roll(5)
    17.times do
      game.roll(0)
    end
    assert_equal 20, game.score
  end

  def test_spare_2nd_frame
    game=Game.new
    game.roll(0)
    game.roll(0)
    game.roll(5)
    game.roll(5)
    game.roll(5)
    15.times do
      game.roll(0)
    end
    assert_equal 20, game.score
  end

  def test_multiple_spares
    game=Game.new
    21.times do
      game.roll(5)
    end
    assert_equal 150, game.score
  end

  def test_one_strike
    game=Game.new
    game.roll(10)
    game.roll(5)
    game.roll(4)
    17.times do
      game.roll(0)
    end
    assert_equal 28, game.score
  end

  def test_last_frame
    game=Game.new
    18.times do
      game.roll(0)
    end
      game.roll(3)
      game.roll(7)
      game.roll(5)
    assert_equal 15, game.score
  end


  def test_all_strikes
    game=Game.new
    12.times do
      game.roll(10)
    end
    assert_equal 300, game.score
  end

  def test_9_gutter_11_strikes
    game=Game.new
    game.roll(9)
    game.roll(0)
    11.times do
      game.roll(10)
    end
    assert_equal 279, game.score
  end
end
