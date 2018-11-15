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

require_relative 'controller'

controller = Controller.new
controller.run
