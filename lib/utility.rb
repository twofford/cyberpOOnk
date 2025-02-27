# frozen_string_literal: true

def best_of_stats(stats:, stat1:, stat2:)
  stats.send(stat1) > stats.send(stat2) ? stat1 : stat2
end

def define_instance_var_attr_readers(obj:)
  instance_var_names = obj.instance_variables.map { |var| var.to_s.delete_prefix('@').to_sym }
  instance_var_names.each do |name|
    self.class.send(:define_method, name) { obj.send(name) }
  end
end
