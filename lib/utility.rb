# frozen_string_literal: true

def best_of_stats(stats:, stat1:, stat2:)
  stats.send(stat1) > stats.send(stat2) ? stat1 : stat2
end
