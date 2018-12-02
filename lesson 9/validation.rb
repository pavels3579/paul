module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(arg_name, type, arguments = {})
      @validates ||= []
      @validates << { arg_name: arg_name, type: type, arguments: arguments }
    end
  end

  module InstanceMethods
    attr_reader :validates

    def validate!
      self.class.validates.each do |validation|
        arg_name = instance_variable_get("@#{validation[:arg_name]}")
        send("valid_#{validation[:type]}", arg_name, *validation[:arguments])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def valid_presence(arg_name)
      raise "it's can't be nil or empty" if arg_name.nil? || arg_name.empty?
    end

    def valid_format(arg_name, format)
      raise "it's not format needed" if arg_name !~ format
    end

    def valid_type(arg_name, class_type)
      raise "it's not the same class type" unless arg_name.class.is_a? class_type
    end

  end
end

