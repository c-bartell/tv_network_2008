require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < Minitest::Test
  def setup
    @nbc = Network.new("NBC")
    @kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    @michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    @knight_rider = Show.new("Knight Rider", "Glen Larson", [@michael_knight, @kitt])
    @leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    @ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    @parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [@leslie_knope, @ron_swanson])
  end

  def test_it_exists
    assert_instance_of Network, @nbc
  end

  def test_it_has_attributes
    assert_equal "NBC", @nbc.name
    assert_equal [], @nbc.shows
  end

  def test_it_can_add_shows
    assert_equal [], @nbc.shows

    @nbc.add_show(@knight_rider)
    expected = [@knight_rider]
    actual = @nbc.shows

    assert_equal expected, actual

    @nbc.add_show(@parks_and_rec)
    expected = [@knight_rider, @parks_and_rec]
    actual = @nbc.shows

    assert_equal expected, actual
  end

  def test_it_can_show_main_characters
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)
    expected = [@kitt]
    actual = @nbc.main_characters

    assert_equal expected, actual
  end

  def test_it_can_show_actors_by_show
    @nbc.add_show(@knight_rider)
    @nbc.add_show(@parks_and_rec)

    expected = {
      @knight_rider => ["David Hasselhoff", "William Daniels"],
      @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
    }

    actual = @nbc.actors_by_show

    assert_equal expected, actual
  end
end
