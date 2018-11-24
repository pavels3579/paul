class RailwayStation
  include InstanceCounter
  include Validation

  attr_reader :name, :trains

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
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
    @trains << train
  end

  def stations_trains(&block)
    trains.each do |train|
      block.call(train)
    end
  end

  private

  def validate!
    raise "Название станции не может быть менее 3 символов" if @name.length < 3
  end
end
