module InstanceCounter
  #@instances = 0

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :instances

    private

    def plus_counter
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods

    protected

    def register_instance
      self.class.send :plus_counter
    end
  end
end
