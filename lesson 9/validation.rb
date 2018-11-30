module Validation
  def valid?
    validate!
  rescue RuntimeError
    false
  end

  class Validate

    def valid_presence(name)
      !name.nil && !name.empty? || raise "it's can't be nil or empty"
    end

    def valid_format(name,format)
      mane =~ format || raise "it's not format needed"
    end

    def valid_type(name,class_type)
      name.class == class_type || raise "it's not the same class type"
    end

    def validate(name. format = nil, class_type = nil)
      if fopmat.nil? && class_type_nil?
        valid_presence(name)
      elsif !format.nil?
        valid_format(name,format)
      elsif !class_type_nil?
        valid_type(name,class_type)
      end
    end

  end
end
