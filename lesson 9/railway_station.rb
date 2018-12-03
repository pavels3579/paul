class RailwayStation
  include InstanceCounter
  include Validation

  NAME_STATION_FORMAT = /^[a-zа-я0-9]{3,}$/i

  validate :name, :presence
  validate :name, :format, NAME_STATION_FORMAT
  # validate :name, :type, Fixnum

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
    if type
      @trains.select { |train| train.type == type }
    else
      @trains
    end
  end

  def train_leaves_station(train)
    @trains.delete(train)
  end

  def train_arrives_station(train)
    @trains << train
  end

  def stations_trains
    trains.each do |train|
      yield.call(train)
    end
  end
end
