class Train
  attr_reader :speed_current, :number, :station_current, :route

  def initialize(number)
    @number = number >= 0 ? number : 0
    @speed_current = 0
    @carriages = []
    @route
    @station_current
  end

  def speed_up(speed)
    @speed_current += speed
  end

  def speed_down(speed)
    @speed_current -= speed
    @speed_current = @speed_current > 0 ? @speed_current : 0
  end

  def carriage_add(arriage)
    @carriages.push(carriage) if @speed_current == 0
  end

  def carriage_delete(carriage)
     @carriages.delete(carriage) if @speed_current == 0
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
