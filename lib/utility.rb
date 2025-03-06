# frozen_string_literal: true

require 'pry'

def best_of_stats(stats:, stat1:, stat2:)
  stats.send(stat1) > stats.send(stat2) ? stat1 : stat2
end

def define_instance_var_attr_readers(obj:)
  instance_var_names = obj.instance_variables.map { |var| var.to_s.delete_prefix('@').to_sym }
  instance_var_names.each do |name|
    self.class.send(:define_method, name) { obj.send(name) }
  end
end

def to_nearest_hundred(num:)
  (num / 100.0).round * 100
end

def type_check_arg(arg:, klass:, options: {})
  if options[:between]
    raise TypeError, 'options[:between] must be a Range' unless options[:between].is_a?(Range)
    raise TypeError, "#{arg} must be in range #{options[:between]}" unless options[:between].include?(arg)
  end

  if arg.is_a?(Array)
    return if arg.empty?

    raise TypeError, "#{arg} must be an Array of #{klass.pluralize}" unless arg.all? do |el|
      el.is_a?(klass) || el.new.is_a?(klass)
    end
  else
    raise TypeError, "#{arg} must be a #{klass}" unless arg.is_a?(klass) || arg.new.is_a?(klass)
  end
end
