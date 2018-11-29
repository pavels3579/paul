module Accessors
  @history ||= []

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
      @history << { |value| }
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    var_name = "@#{attr_name}".to_sym
    define_method(attr_name) { instance_variable_get(var_name) }
    if { |value| value.is_a? attr_class}
      define_method("#{attr_name}=".to_sym) { |value| instance_variable_set(var_name, value) }
    else
      raise "It's not the same type as attr_class"
    end
  end

end

=begin
module MyAttrAccessor

  def my_attr_accessor(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) { |value| instance_variable_set(var_name, value) }
    end
  end
end

class Test
  extend attr_accessor_with_history

  my_attr_accessor :my_attr, :a, :b, :c
end
=end
