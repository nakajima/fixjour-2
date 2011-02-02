module Fixjour
  class DSL
    include Fixjour
    include Fixjour::Counter
    
    def initialize(block)
      instance_eval(&block)
    end

    def define(model, options={}, &block)
      Builder.new(model, options, &block).define
    end
  end
end
