require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'


class ShowTest < Minitest::Test
  def setup
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
  end

  def test_it_exists
    assert_instance_of Show, @knight_rider
  end

  def test_it_has_a_name
    assert_equal "Knight Rider", @knight_rider.name
  end

  def test_it_has_a_creator
    assert_equal "Glen Larson", @knight_rider.creator
  end

  def test_it_has_characters
    expected = [@michael_knight, @kitt]
    actual = @knight_rider.characters

    assert_equal expected, actual
  end

  def test_it_can_calculate_total_salary
    assert_equal 2_600_000, @knight_rider.total_salary
  end

  def test_it_can_show_highest_paid_actor
    assert_equal "David Hasselhoff", @knight_rider.highest_paid_actor
  end

  def test_it_can_show_actors_names
    expected = ["David Hasselhoff", "William Daniels"]
    actual = @knight_rider.actors

    assert_equal expected, actual
end
