require "test_helper"

class CrapsDiceTest < Minitest::Test
  def setup
    srand 420247             # Seeds the RNG...
    @dice = Roll.new
    @easy = @dice.reroll.dup     # [3, 1]
    @hard = @dice.reroll.dup     # [2, 2]
    @seven = @dice.reroll.dup    # [3, 4]
  end

  def test_roll
    assert_instance_of Roll, @dice
  end

  def test_two_dice
    assert @dice.length == 2
  end

  def test_six_sides
    assert @dice.all? { |die| die >= 1 && die <= 6 }
  end

  def test_reroll
    assert @dice.reroll
  end

  def test_hard
    assert @hard.is_hard?
  end

  def test_not_hard
    refute @easy.is_hard?
  end

  def test_seven
    assert @seven.is_seven?
  end

  def test_not_seven
    refute @hard.is_seven?
  end

  def test_symbols_are_loaded
    assert ROLL_NAMES
  end

  def test_names
    assert @easy.name == :easy_four
    assert @hard.name == :hard_four
    assert @seven.name == :seven
  end
end
