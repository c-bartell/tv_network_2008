class Show
  attr_reader :name, :creator

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end
end
