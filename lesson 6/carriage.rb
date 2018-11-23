class Carriage
  include Company
  include Validation

  #Номе вагона может быть только числом
  NUMBER_CARRIAGE_FORMAT = /^\d+$/

  attr_reader :number

  private

  def validate!
    raise "Номер не соответствует формату" if @number !~ NUMBER_CARRIAGE_FORMAT
  end

  public

  def initialize(number)
    @number = number
    validate!
  end
end
