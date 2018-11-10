
class Train
  attr_reader :speed_current, :number, :carriage_count, :station_current, :route

  def initialize(number, type, carriage_count)
    @number = number
    @type = type
    @carriage_count = carriage_count
    @speed_current = 0
  end

  def speed_up(speed)
    @speed_current += speed
  end

  def speed_down(speed)
    @speed_current -= speed
    @speed_current > 0 ? @speed_current : 0
  end

  def carriage_add
    @carriage_count += 1 if @speed_current == 0
  end

  def carriage_delete
    @carriage_count -= 1 if @speed_current == 0
    @carriage_count > 0 ? @carriage_count : 0
  end

  def forward
    return if @station_current == @route.size - 1
    if @station_current.nil?
      @station_current = 0
    else
      @station_current += 1
    end
  end

  def backward
    return if @station_current == 0
    if @station_current.nil?
      @station_current = @route.size - 1
    else
      @station_current -=1
    end
  end

  def set_route(route)
    @route = route
    @station_current = 0
  end

  def current_station
    @route[@station_current]
  end

  def prev_station
    @station_current - 1 >= 0 ? station_current - 1 : @station_current
  end

  def next_station
    @station_current + 1 <= @route.size - 1 ? station_current + 1 : @station_current
  end

end
