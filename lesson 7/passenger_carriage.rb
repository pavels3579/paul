class PassengerCarriage < Carriage
  attr_reader :number, :number_of_seats
  attr_accessor :taken_seats

  def initialize(number, number_of_seats)
    @number = number
    @number_of_seats = number_of_seats
    @taken_seats ||= 0
    validate!
    validate_passenger!
  end

  private

  def validate_passenger!
    raise "Не указано количество мест" if @number_of_seats == 0
  end

end
