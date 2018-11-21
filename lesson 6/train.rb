class Train
  include Company
  include InstanceCounter

  attr_reader :speed_current, :number, :station_current, :route, :carriages

  @@trains = {}

  def self.find(train_number)
    @@trains[train_number.to_sym]
  end

  def initialize(number)
    @number = number

    @speed_current = 0
    @carriages = []
    @route
    @station_current
    @@trains[@number.to_sym] = self
    register_instance
  end

  def speed_up(speed)
    @speed_current += speed
  end

  def speed_down(speed)
    @speed_current -= speed
    @speed_current = @speed_current > 0 ? @speed_current : 0
  end

  def carriage_add(carriage)
    @carriages.push(carriage) if @speed_current == 0
  end

  def carriage_delete(carriage)
     @carriages.delete(carriage) if @speed_current == 0
  end

  def forward
    return if @station_current == @route.stations.size - 1
    if @station_current.nil?
      @station_current = 0
    else
      @station_current += 1
    end
    #puts "@station_current "+@station_current.to_s
    @route.stations[@station_current].train_arrives_station(self)
    @route.stations[@station_current-1].train_leaves_station(self)
  end

  def backward
    return if @station_current == 0
    if @station_current.nil?
      @station_current = @route.stations.size - 1
    else
      @station_current -=1
    end
    @route.stations[@station_current].train_arrives_station(self)
    @route.stations[@station_current+1].train_leaves_station(self)
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
    @station_current + 1 <= @route.stations.size - 1 ? station_current + 1 : @station_current
  end

end
