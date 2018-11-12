
PASSENGER = 'passenger'
CARGO = 'cargo'

require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'route'
require_relative 'railway_station'

loop do
  puts "Введите 1 если Вы хотите создать станцию"
  puts "Введите 2 если Вы хотите создать поезд"
  puts "Введите 3 если Вы хотите создать маршрут"
  puts "Введите 4 если Вы хотите назначить маршрут поезду"
  puts "Введите 5 если Вы хотите добавить вагоны к поезду"

  puts "Введите 1 если Вы хотите выйти из меню"

  choice = gets.chomp

  break if choice == 0

  case choice
  when "1"
    puts "Введите название станции"
    name = gets.chomp
    if name.length > 0
      railway_station = RailwayStation.new(name)
      puts "Станция #{railway_station} была создана"
    else
      puts "Наименование станции не может быть пустым. Станция не была создана"
    end
  when "2"
    puts "Введите номер поезда"
    number = gets.chomp

    puts "Нажмите 1 если хотите создать пассажирский поезд или любую другую клавишу если - грузовой"
    type = gets.chomp
    if type == 1
      train = PassengerTrain.new(number)
    else
      train = CargoTrain.new(number)
    end

    puts type == 1 ? "Пассажирский " : "Грузовой " + "поезд номер #{number} был создан"
  when "3"
    puts "Введите первую станцию"
    first_station = gets

    puts "Введите вторую станцию"
    first_station = gets

    route = Route.new(first_station, last_station)
    puts "Маршрут с начальной станцией #{first_station} и конечной #{last_station} был создан"
  else
    puts "Вы ввели некорректное число"
  end
end


