class Route
  include InstanceCounter

  attr_reader :stations

  private

  def validate!(first_station, last_station)
    raise "Нельзя маршруту назначить пустую станцию" if first_station.nil? || last_station.nil?
  end

  public

  def initialize(first_station, last_station)
    @stations = []
    validate!(first_station, last_station)
    @stations << first_station
    @stations << last_station
    register_instance
  end

  def station_add(station)
    @stations.insert(@stations.size-1, station)
  end

  def station_delete(station)
    @stations.delete(station) if @stations.first != station && @stations.last != station
  end
end
