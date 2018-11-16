class Controller

  def initialize
    #@passenger_trains = []
    #@cargo_trains = []
    #@cargo_trains = []
    @trains = []
    #@passenger_carriages = []
    #@cargo_carriages = []
    @carriages = []
    @stations = []
    @routes = []
  end

  def find_station_by_name(station_name)
    @stations.each do [station]
      return station if station.name == station_name
    end
  end

  def find_station_by_number(station_number)
    @stations[station_number.to_i - 1]
  end

  def find_route_by_name(first_station_name, last_station_name)
    first_station = find_station_by_name(first_station_name)
    last_station = find_station_by_name(last_station_name)

    if !first_station.nil? && !last_station.nil?
      @routes.each do [route]
        return route if route.stations.first.name == first_station_name && route.stations.last.name == last_station_name
      end
    end
  end

  def find_route_by_number(number)
    @routes[number.to_i - 1]
  end

  def find_train(train_number, type)
    puts @trains
    trains = @trains.select {|train| train.class == type}

    puts trains
    trains.each do |train|
      return train if train.number == train_number
    end
  end

  def find_carriage(carriage_number, type)
    carriages = @carriages.select {|carriage| carriage.class == type}

    carriages.each do |carriage|
      return carriage if carriage.number == carriage_number
    end
  end

  def find_train_carriage_by_number(train, carriage_number)
    train.carriages.each do |carriage|
      return carriage if carriage.number == carriage_number
    end
  end

  def show_stations
    puts "+++ Список станций: "
    @stations.each_with_index do |station, index|
      puts "#{index+1}: #{station.name}"
    end
    puts "---"
  end

  def show_routes
    puts "+++ Список маршрутов: "
    @routes.each_with_index do |route, index|
      puts "#{index+1}: #{route.stations.first.name} - #{route.stations.last.name}"
    end
    puts "---"
  end

  def show_trains(type)
    if type == PassengerTrain.class
      puts "+++ Список пассажирских поездов: "
    elsif type == CargoTrain.class
      puts "+++ Список грузовых поездов: "
    end

    trains = @trains.select {|train| train.class == type}

    trains.each do |train|
      puts "#{train.number}"
    end
    puts "---"
  end

  def show_carriages(type)
    if type == PassengerTrain.class
      puts "+++ Список пассажирских вагонов: "
    elsif type == CargoTrain.class
      puts "+++ Список грузовых вагонов: "
    end

    carriages = @carriages.select {|carriage| carriage.class == type}

    carriages.each do |carriage|
      puts "#{carriage.number}"
    end
    puts "---"
  end

  def show_train_carriages(train)
    puts "+++ Список вагонов поезда #{train.number}: "
    train.carriages.each do |carriage|
      puts "#{carriage.number}"
    end
    puts "---"
  end

  def create_station
    puts "Введите наименование станции"
    station_name = gets.chomp
    if station_name.length > 0
      station = RailwayStation.new(station_name)
      @stations.push(station)
      puts "Станция #{station_name} была создана"
    else
      puts "Наименование станции не может быть пустым. Станция не была создана"
    end
  end

  def create_train
    puts "Введите номер поезда"
    train_number = gets.to_i

    puts "Нажмите 1 - для создания пассажирского поезда, 2 - грузового"
    type_number = gets.chomp

    train = nil
    if type_number == "1"
      train = PassengerTrain.new(train_number)
      @trains.push(train)
      #puts @trains
    elsif type_number == "2"
      train = CargoTrain.new(train_number)
      @trains.push(train)
    else
      puts "Вы не нажали ни 1 ни 2, поезд не был создан"
    end

    if !train.nil?
      print type_number == "1" ? "Пассажирский " : "Грузовой "
      puts "поезд номер #{train_number} был создан"
    end
  end

  def manage_route
    puts "Нажмите 1 - для создания маршрута, 2 - для добавления станции в маршрут, 3 - для удаления станции из маршрута"
    choice_route = gets.chomp
    case choice_route
    when "1"
      show_stations

      puts "Введите номер начальной станции"
      first_station_number = gets.chomp
      first_station = find_station_by_number(first_station_number)

      puts "Введите номер конечной станции"
      last_station_number = gets.chomp
      last_station = find_station_by_number(last_station_number)

      route = Route.new(first_station, last_station)
      @routes.push(route)
      #puts route.inspect
      puts "Маршрут #{route.stations.first.name} - #{route.stations.last.name} был создан"
    when "2"
      show_routes
      puts "Введите номер маршрута"
      route_number = gets.chomp
      route = find_route_by_number(route_number)

      show_stations

      puts "Введите номер добавляемой станции"
      station_number = gets.chomp
      station = find_station_by_number(station_number)

      route.station_add(station)
      puts "В маршрут #{route.stations.first} - #{route.stations.last} добавлена станция #{station.name}"
    when "3"
      show_routes
      puts "Введите номер маршрута"
      route_number = gets.chomp
      route = find_route_by_number(route_number)

      show_stations

      puts "Введите номер удаляемой станции"
      station_number = gets.chomp
      station = find_station_by_number(station_number)

      route.station_delete(station)
      puts "Из маршрута #{route.stations.first} - #{route.stations.last} удалена станция #{station.name}"
    end
  end

  def set_train_route
    puts @trains
    puts "Введите номер поезда"
    train_number = gets.to_i

    puts "Нажмите 1 - для назначения маршрута пассажирскому поезду, 2 - грузовому"
    type_number = gets.chomp

    train_type = nil
    if type_number == "1"
      train_type = PassengerTrain.class
    elsif type_number == "2"
      train_type = CargoTrain.class
    end

    train = find_train(train_number, train_type)

    if train.nil?
      puts "Поезд с таким номером не найден"
      return
    end

    show_routes
    puts "Введите номер маршрута"
    route_number = gets.chomp
    route = find_route_by_number(route_number)

    if !route.nil?
      #puts route.inspect
      puts train.inspect
      train.set_route(route)
      puts "Поезду #{train_number} установлен маршрут #{route.stations.first} - #{route.stations.last} "
    else
      puts "Нет маршрута с номером #{route_number}"
    end
  end

  def create_carriage
    puts "Введите номер вагона"
    carriage_number = gets.to_i

    puts "Нажмите 1 - для создания пассажирского вагона, 2 - грузового"
    type_number = gets.chomp

    carriage = nil
    if type_number == "1"
      carriage = PassengerCarriage.new(carriage_number)
      @carriages.push(carriage)
    elsif type_number == "2"
      carriage = CargoCarriage.new(carriage_number)
      @carriages.push(carriage)
    else
      puts "Вы не нажали ни 1 ни 2, вагон не был создан"
    end

    if !carriage.nil?
      print type_number == "1" ? "Пассажирский " : "Грузовой "
      puts "вагон номер #{carriage_number} был создан"
    end
  end

  def add_carriage_to_train
    puts "Нажмите 1 - для добавления вагона к пассажирскому поезду, 2 - грузовому"
    type_number = gets.chomp

    train = nil
    if type_number == "1"
      show_trains(PassengerTrain.class)
    elsif type_number == "2"
      show_trains(CargoTrain.class)
    else
      puts "Вы не нажали ни 1 ни 2, добавление невозможно"
      return
    end

    puts "Введите номер поезда"
    train_number = gets.to_i

    if type_number == 1
      train = find_train(train_number, PassengerTrain.class)
    elsif type_number == 2
      train = find_train(train_number, CargoTrain.class)
    end

    return if train.nil?

    if type_number == "1"
      show_carriages(PassengerTrain.class)
    elsif type_number == "2"
      show_carriages(CargoTrain.class)
    else
      puts "Вы не нажали ни 1 ни 2, добавление невозможно"
      return
    end

    carriage = nil
    puts "Введите номер вагона"
    carriage_number = gets.to_i
    if type_number == 1
      carriage = find_carriage(carriage_number, PassengerCarriage.class)
    elsif type_number == 2
      carriage = find_carriage(carriage_number, CargoCarriage.class)
    end

    if !carriage.nil?
      train.carriages.push(carriage)
      puts "Поезду #{train.number} был добавлен вагон #{carriage.number}"
    else
      puts "Поезду #{train.number} не был добавлен вагон #{carriage.number}"
    end
  end

  def remove_carriage_to_train
    puts "Нажмите 1 - для отцепления вагона от пассажирского поезда, 2 - от грузового"
    type_number = gets.chomp

    train = nil
    if type_number == "1"
      show_trains(PassengerTrain.class)
    elsif type_number == "2"
      show_trains(CargoTrain.class)
    else
      puts "Вы не нажали ни 1 ни 2, отцепление вагон невозможно"
      return
    end

    puts "Введите номер поезда"
    train_number = gets.to_i

    if type_number == 1
      train = find_train(train_number, PassengerTrain.class)
    elsif type_number == 2
      train = find_train(train_number, CargoTrain.class)
    end

    return if train.nil?

    show_train_carriages(train)

    carriage = nil
    puts "Введите номер вагона"
    carriage_number = gets.to_i
    carriage = find_train_carriage_by_number(train, carriage_number)
    return if carriage.nil?

    if !carriage.nil?
      train.carriages.delete(carriage)
      puts "От поезда #{train.number} был отцеплен вагон #{carriage.number}"
    else
      puts "От поезда #{train.number} не был отцеплен вагон #{carriage.number}"
    end
  end

  def move_train
    puts "Нажмите 1 - для перемещения пассажирского поезда, 2 - грузового"
    type_number = gets.chomp

    train = nil
    if type_number == "1"
      show_rains(PassengerTrain.class)
    elsif type_number == "2"
      show_trains(CargoTrain.class)
    else
      puts "Вы не нажали ни 1 ни 2, отцепление вагон невозможно"
      return
    end

    puts "Введите номер поезда"
    train_number = gets.to_i

    if type_number == 1
      train = find_train(train_number, PassengerTrain.class)
    elsif type_number == 2
      train = find_train(train_number, CargoTrain.class)
    end

    return if train.nil?

    puts "Нажмите 1 - для перемещения поезда вперед по маршруту, 2 - назад"
    type_number = gets.chomp

    if type_number == "1"
      train.forward
      puts "Поезд был перемещен вперед"
    elsif type_number == "2"
      train.backward
      puts "Поезд был перемещен назад"
    else
      puts "Вы не нажали ни 1 ни 2, перемещения невозможно"
      return
    end

  end

  def show_stations_and_trains
    puts "+++ Список станций: "
    @stations.each_with_index do |station, index|
      puts "#{index+1}: #{station.name}"
      station.trains_at_station
    end
    puts "---"
  end

  public

  def run
    loop do
      puts "1. Cоздать станцию"
      puts "2. Создать поезд"
      puts "3. Создать маршрут или управлять станциями в нем (добавлять, удалять)"
      puts "4. Назначить маршрут поезду"
      puts "5. Создать вагон"
      puts "6. Добавить вагоны к поезду"
      puts "7. Отцепить вагоны от поезда"
      puts "8. Переместить поезд по маршруту"
      puts "9. Просмотреть список станций и список поездов на станции"
      puts "0. Выйти из меню"

      choice = gets.chomp

      case choice
      when "1"
        create_station
      when "2"
        create_train
      when "3"
        manage_route
      when "4"
        set_train_route
      when "5"
        create_carriage
      when "6"
        add_carriage_to_train
      when "7"
        remove_carriage_to_train
      when "8"
        move_train
      when "9"
        show_stations_and_trains
      when "0"
        break
      else
        puts "Вы ввели некорректное число"
      end
    end


  end

end
