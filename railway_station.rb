class RailwayStation
  attr_accessor :is_working, :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @is_working
    @trains =[]   
  end  

  def trains_at_station(type = nil)
    if type.nil?
      puts @trains
    else
      trains_type = {}
      @trains.each do |train|
        if trains_type[train.name.to_sym].nil?
          trains_type[train.name.to_sym] = 1
        else
          trains_type[train.name.to_sym] += 1
        end
      end
    end   

    trains_type.each do |train_type, quantity|
       puts "Тип #{train_type} количество #{quantity}"  
    end    
  end

  def train_leaves_station(train)
    @trains.delete(train)
  end
 
  def train_arrives_station(train)
    @trains.push(train) if @is_working
  end
end

#====================
