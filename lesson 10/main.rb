require_relative 'cards'
require_relative 'gamer'
require_relative 'user'
require_relative 'dealer'
require_relative 'bank'
require_relative 'controller'

controller = Controller.new
controller.run
