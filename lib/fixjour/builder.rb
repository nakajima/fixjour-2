module Fixjour
  class Builder
    def initialize(model, options, &block)
      @model, @options, @block = model, options, block
    end

    def define
      block = @block
      klass = find_class
      klass_name = find_class_name

      Fixjour.module_eval do
        define_method("new_" + klass_name) do |*overrides|
          instance = klass.new
          block.call(instance)
          overrides.first && overrides.first.each do |key, val|
            instance.send("#{key}=", val)
          end
          instance
        end

        define_method("create_" + klass_name) do |*overrides|
          instance = send("new_#{klass_name}", *overrides)
          instance.save!
          instance
        end
      end
    end

    private

    def find_class
      @options[:class] || (@model.is_a?(Symbol) ?
        @model.to_s.classify.constantize :
        @model)
    end

    def find_class_name
      return @model.to_s if @model.is_a?(Symbol) && @options[:class]
      find_class.model_name.singular
    end
  end
end
