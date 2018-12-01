module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(arg_name, type, arguments = {})
      @validates ||= {}
      @validates[arg_name] = arg_name
      @validates[type] = type
      @validates[arguments] = arguments
    end
  end

  module InstanceMethods
    def validate!
      arg_name = instance_variable_get("@#{self.class.validates[arg_name]}")
      type = instance_variable_get("#{self.class.validates[type]}")
      arguments = instance_variable_get("#{self.class.validates[arguments]}")

      send("valid_#{type}", arg_name, *arguments)
    end

    def valid?
      validate!
    rescue RuntimeError
      false
    end

    protected

    def valid_presence(arg_name)
      raise "it's can't be nil or empty" if !arg_name.nil && !arg_name.empty?
    end

    def valid_format(arg_name, format)
      raise "it's not format needed" if arg_name =~ format
    end

    def valid_type(name, class_type)
      raise "it's not the same class type" if name.class == class_type
    end

  end
end

