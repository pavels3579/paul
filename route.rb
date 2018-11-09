class Route
  attr_accessor :station_first, :station_last, :stations
  
  def initialize(station_first, station_last)  
    @station_first = station_first
    @station_last = station_last
    @stations = []
  end

  def station_add(station)
    if station.is_working
      @stations.push(station)
    else
       puts "Станция #{station.name} не может принимать поезда и не может быть добавлена в маршрут"
    end
  end

  def station_delete(station)
    @stations.delete(station)
  end

  def station_list
    puts @station_first.name
    @stations.each do |station|
      puts "#{station.name}"
    end
    puts @station_last.name
  end
end
#====================
