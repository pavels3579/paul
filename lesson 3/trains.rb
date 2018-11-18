

class RailwayStation
  def initialize(name)
    @name = name
    @is_working
    @trains_at_station
  end  

  def trains_at_station(type = nil)
    if type.nil?
      puts @trains_at_station
    else
      @rains_at_station.each do |train|
          puts "#{train}" if train.type == type
      end
    end
  end

  def train_leaves_station(train)
    @trains_at_station.delete(train)
  end

end

#====================
class Route
  def initialize(station_first, station_last)  
    @station_first = station_first
    @station_last = station_last 
    @stations
  end

  def station_add(station)
    @stations.push(station)
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
class Train 
  attr_writer :route
  attr_accessor :speed_current, :carriage_count
  
  def initialize(type, carriage_count)
    @type = type
    @carriage_count = carriage_count
    @speed_current          
    @station_current   
    @route
  end

  def speed_up(speed)
    self.speed_current += speed
  end   

  def speed_down(speed)
    self.speed_current -= speed
  end 

  def carriage_change(operation)
    if @speed_current == 0
      if operation = "add"
        @carriage_count += 1
      elsif operation = "delete"
        @carriage_count -= 1
      end
    end
  end
 
  def change_station(station_current, route)   
    if station_current = route.station_first
      if stations.any?
        station_current = route.stations.first
      else
        station_current = route.station_last
      end
    else 
      if station_current = route.stations.last
        station_current = route.station_last
      elsif  tations.any?
        station_current = route[route.index(station_current) +1]
      end
    end
  end

  def show_stations(station_current, route)  
    puts "Текущая станция: #{station_current}"

  end
end
#====================
