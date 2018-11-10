
class Train  
  attr_accessor :route, :forward
  attr_reader : :speed_current, :carriage_count, :station_current
 
  def initialize(type, carriage_count)
    @type = type
    @carriage_count = carriage_count
    @speed_current = 0          
    @station_current   
    @route
    @forward = true
  end

  def speed_up(speed)
    @speed_current += speed
  end   

  def speed_down(speed)
    @speed_current -= speed
    @speed_current > 0 ? @speed_current : 0
  end

  def carriage_add
    @carriage_count += 1 if @speed_current == 0       
  end

  def carriage_delete
    @carriage_count -= 1 if @speed_current == 0
    @carriage_count > 0 ? @carriage_count : 0    
  end
 
  def train_forward  
    if @station_current.nil?
      @station_current = 0
    elsif @station_current == @route.size - 1    

    else
        @station_current += 1
      end
    end
  end

  def train_backward  
    if @station_current.nil?
      @station_current = @route.size - 1 
    elsif @station_current == 0      

    else 
      @station_current -=1      
    end
  end

  def train_move
    if @forward 
      train_forward
    else
      train_backward
    end
  end

  def station_now
    @stations[@station_current]
  end

  def station_before
    if @forward 
      return @station_current - 1 >= 0 ? station_current - 1 : @station_current
    else
      return @station_current + 1 <= @stations.size - 1 ? station_current + 1 : @station_current
    end
  end

  def station_next
    if @forward 
      return @station_current + 1 <= @stations.size - 1 ? station_current + 1 : @station_current
    else
      return @station_current - 1 >= 0 ? station_current - 1 : @station_current
    end
  end 
  
end
