module Fixjour
  class Builder
    def initialize(model, block)
      @model, @block = model, block
    end

    def define
      model, block = @model, @block
      Fixjour.module_eval do
        klass_name = model.model_name.singular

        define_method("new_" + klass_name) do |*overrides|
          instance = model.new
          block.call(instance)
          (overrides.first || {}).each { |key, val| instance.send("#{key}=", val) }
          instance
        end

        define_method("create_" + klass_name) do |*overrides|
          instance = send("new_#{klass_name}", *overrides)
          instance.save!
          instance
        end
      end
    end
  end
end
