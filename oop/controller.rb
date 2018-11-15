class Controller
  protected

  def initialize()
    @passenger_trains = []
    @cargo_trains = []
    @passenger_carriages = []
    @cargo_carriages = []
    @stations = []
    @routes = []
  end

  def find_railway_station(station_name)
    @stations.each do [station]
      return station if station.name == station_name
    end
  end

  def find_route(first_station_name, last_station_name)
    first_station = find_railway_station(first_station_name)
    last_station = find_railway_station(last_station_name)

    if !first_station.nil? && !last_station.nil?
      @routes.each do [route]
        return route if route.stations.first.name == first_station_name && route.stations.last.name == last_station_name
      end
    end
  end

  def find_train(train_number, train_type)
    if train_type.class == PassengerCarriage.class
      @passenger_trains.each do |train|
        return train if train.number == train_number
      end
    elsif train_type.class == CargoTrain.class
      @cargo_trains.each do |train|
        return train if train.number == train_number
      end
    end
  end

  def show_stations
    @stations.each_with_index do |station, index|
      puts "#{index+1}: #{station.name}"
    end
  end

  public

  def run
    loop do
      puts "1. Cоздать станцию"
      puts "2. Создать поезд"
      puts "3. Создать маршрут или управлять станциями в нем (добавлять, удалять)"
      puts "4. Назначить маршрут поезду"
      puts "5. Добавить вагоны к поезду"
      puts "6. Отцепить вагоны от поезда"
      puts "7. Переместить поезд по маршруту"
      puts "8. Просмотреть список станций и список поездов на станции"
      puts "9. Создать вагон"
      puts "0. Выйти из меню"

      choice = gets.chomp

      break if choice == "0"

      case choice
      when "1"
        puts "Введите наименование станции"
        station_name = gets.chomp
        if station_name.length > 0
          railway_station = RailwayStation.new(station_name)
          @stations.push(railway_station)
          puts "Станция #{station_name} была создана"
        else
          puts "Наименование станции не может быть пустым. Станция не была создана"
        end
      when "2"
        puts "Введите номер поезда"
        train_number = gets.to_i

        puts "Нажмите 1 - для создания пассажирского поезда, 2 - для создания грузового"
        type_number = gets.chomp

        train = nil
        if type_number == "1"
          train = PassengerTrain.new(train_number)
          @passenger_trains.push(train)
        elsif type_number == "2"
          train = CargoTrain.new(train_number)
          @cargo_trains.push(train)
        else
          puts "Вы не нажали ни 1 ни 2, поезд не был создан"
        end

        if !train.nil?
          print type_number == "1" ? "Пассажирский " : "Грузовой "
          puts "поезд номер #{train_number} был создан"
        end
      when "3"
        puts "Нажмите 1 - для создания маршрута, 2 - для добавления станции в маршрут, 3 - для удаления станции из маршрута"
        choice_route = gets.chomp
        if choice_route == "1" || choice_route == "2" || choice_route == "3"
          puts "Введите наименование начальной станции"
          first_station_name = gets.chomp

          puts "Введите наименование конечной станции"
          last_station_mame = gets.chomp
        else
          puts puts "Вы не указали что нужно сделать"
          break
        end

        first_station = find_railway_station(first_station_name)
        last_station = find_railway_station(last_station_mame)

        stations_found = true

        if first_station.nil?
          stations_found = false
          puts "Не найдена начальная станция с наименованием #{first_station_name}"
        end

        if last_station.nil?
          stations_found = false
          puts "Не найдена конечная станция с наименованием #{last_station_mame}"
        end

        break if !stations_found

        if choice_route == "2" || choice_route == "3"
          puts "Введите наименование станции"
          station_name = gets.chomp
          station = find_railway_station(station_name)

          if station.nil?
            puts "Не найдена станция с наименованием #{station_name}"
            break
          end
        end

        case choice_route
        when "1"
            route = Route.new(first_station, last_station)
            @routes.push(route)
            puts "Маршрут с начальной станцией #{first_station} и конечной #{last_station} был создан"
        when "2"
          route = find_route(first_station_name, last_station_mame)
          route.station_add(station)
          puts "В маршрут была добавлена станция #{station_name}"
        when "2"
          route = find_route(first_station_name, last_station_mame)
          route.station_add(station)
          puts "В маршрут была добавлена станция #{station_name}"
        when "3"
          route = find_route(first_station_name, last_station_mame)
          if route.stations.include?(station) && route.stations.size > 2
            route.station_delete(station)
            puts "Из маршрута была удалена станция #{station_name}"
          else
            puts "Не удалось удалить из маршрута станцию #{station_name}"
          end
        end

      when "4"
        puts "Введите номер поезда"
        train_number = gets.to_i

        puts "Нажмите 1 - для назначения маршрута пассажирскому поезду, 2 - грузовому"
        type_number = gets.chomp

        puts "Введите наименование начальной станции"
        first_station_name = gets.chomp

        puts "Введите наименование конечной станции"
        last_station_name = gets.chomp

        train_type = nil
        if type_number == "1"
          train_type = PassengerTrain.class
        elsif type_number == "2"
          train_type = CargoTrain.class
        end

        train = find_train(train_number, train_type)

        if train.nil?
          puts "Поезд с таким номером не найден"
          break
        end

        route = find_route(first_station_name, last_station_name)

        if !route.nil?
          train.route = route
        else
          puts "Не удалось найти маршрут с начальной станцией #{first_station} и конечной #{last_station}"
        end
      when "8"
        show_stations

      when "0"
        break
      else
        puts "Вы ввели некорректное число"
      end
    end


  end

end
