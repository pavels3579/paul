class CargoCarriage < Carriage
  attr_reader :number, :volume
  attr_accessor :taken_volume

  def initialize(number, volume)
    @number = number
    @volume = volume
    @taken_volume ||= 0
    validate!
    validate_cargo!
  end

  private

  def validate_cargo!
    raise "Не указано объем" if @volume == 0
  end

end
