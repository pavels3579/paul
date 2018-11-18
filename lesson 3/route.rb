class Route  
  attr_reader :stations
  
  def initialize      
    @stations = []
  end

  def station_add(station)
    @stations.push(station)    
  end

  def station_delete(station)
    @stations.delete(station)
  end
end
