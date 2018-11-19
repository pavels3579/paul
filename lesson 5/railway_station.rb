class RailwayStation
  include InstanceCounter

  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations.push(self)
    register_instance
  end

  def trains_at_station(type = nil)
    if type.nil?
      return @trains
    else
      @trains.select {|train| train.type == type}
    end
  end

  def train_leaves_station(train)
    @trains.delete(train)
  end

  def train_arrives_station(train)
    @trains.push(train)
  end
end
