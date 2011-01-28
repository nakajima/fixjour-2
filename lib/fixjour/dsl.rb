module Fixjour
  class DSL
    def initialize(block)
      instance_eval(&block)
    end

    def define(model, &block)
      Builder.new(model, block).define
    end
  end
end
