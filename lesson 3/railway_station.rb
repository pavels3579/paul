class RailwayStation
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name    
    @trains =[]   
  end  

  def trains_at_station(type = nil)
    if type.nil?
      return @trains
    else
      return @trains.select {|train| train.type == type}            
    end    
  end

  def train_leaves_station(train)
    @trains.delete(train)
  end
 
  def train_arrives_station(train)
    @trains.push(train)
  end
end
