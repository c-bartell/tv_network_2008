class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    characters = @shows.map do |show|
      show.characters
    end.flatten

    characters.find_all do |character|
      correct_name = (character.name == character.name.upcase)
      correct_salary = (character.salary > 500_000)

      correct_name && correct_salary
    end
  end
end
