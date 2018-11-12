class PassengerCarriage < Carriage
  attr_reader :type

  def initialize
    @type = PASSENGER
  end

end
