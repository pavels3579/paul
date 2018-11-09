
class Train  
  attr_accessor :route, :speed_current, :carriage_count, :station_current
 
  def initialize(type, carriage_count)
    @type = type
    @carriage_count = carriage_count
    @speed_current = 0          
    @station_current   
    @route
  end

  def speed_up(speed)
    @speed_current += speed
  end   

  def speed_down(speed)
    @speed_current -= speed
  end

  def carriage_change(operation)
    if @speed_current == 0
      if operation == "add"
        @carriage_count += 1
      elsif operation == "delete"
        @carriage_count -= 1
      end
    end
  end
 
  def change_station(route)   
    if @station_current.nil?
      @station_current = route.station_first
    elsif @station_current == route.station_last
      #return station_current

    elsif @station_current == route.station_first
      if route.stations.any?
        @station_current = route.stations.first
      else
        @station_current = route.station_last
      end
    else
      if @station_current == route.stations.last
        @station_current = route.station_last
      elsif  route.stations.any?
        @station_current = route[route.index(@station_current) +1]
      end
    end
  end

  def show_stations(route)  
    if @station_current.nil?
      puts "Текущая станция не установлена, показ следующей станции невозможен."
    else
      puts "Текущая станция: #{@station_current.name}"
    end

    if @station_current == route.station_first
      puts "Это начальная станция. Предыдущая станция отсутствует"
      if route.stations.any?        
        puts "Следующая станция: #{route.stations.first.name}"        
      else
        puts "Следующая станция: #{route.station_last.name}"
      end
    elsif @station_current == route.station_last    
      if route.stations.any?  
        puts "Предыдущая станция: #{route.stations.last.name}"
      else
        puts "Предыдущая станция: #{route.stations.first.name}"
      end
      puts "Это конечная станция. Следующая станция отсутствует"
    else
      if @station_current == route.stations.last
        puts "Предыдущая станция: #{route.stations[-2].name}"
        puts "Следующая станция: #{route.station_last.name}"
      elsif @station_current == route.stations.first
        puts "Предыдущая станция: #{route.station_first.name}"
        puts "Следующая станция: #{route.stations[1].name}"
      elsif  route.stations.any?
        @station_current = route[route.index(@station_current) +1]
        puts "Предыдущая станция: #{route[route.index(@station_current) -1].name}"
        puts "Следующая станция: #{route[route.index(@station_current) +1].name}"
      end
    end
  end
end
