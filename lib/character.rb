class Character
  def initialize(details)
    @details = details
  end

  def name
    @details[:name]
  end
end
