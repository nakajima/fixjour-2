module Fixjour
  module Counter
    def self.get(name)
      @counters ||= Hash.new(0)
      @counters[name] += 1
    end

    def counter(name=nil)
      Fixjour::Counter.get(name)
    end
  end
end
