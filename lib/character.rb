class Character
  def initialize(details)
    @details = details
  end

  def name
    @details[:name]
  end

  def actor
    @details[:actor]
  end

  def salary
    @details[:salary]
  end
end
