class Carriage
  include Company
  include Validation

  # Номе вагона может быть только числом
  NUMBER_CARRIAGE_FORMAT = /^\d+$/.freeze

  attr_reader :number

  def initialize(number)
    @number = number
    validate!
  end

  private

  def validate!
    raise 'Номер не соответствует формату' if @number.to_s !~ NUMBER_CARRIAGE_FORMAT || @number.zero?
  end
end
