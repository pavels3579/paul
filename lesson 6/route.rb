class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = []
    @stations.push(first_station)
    @stations.push(last_station)
    register_instance
  end

  def station_add(station)
    @stations.insert(@stations.size-1, station)
  end

  def station_delete(station)
    @stations.delete(station) if @stations.first != station && @stations.last != station
  end
end
