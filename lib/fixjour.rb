$LOAD_PATH << File.dirname(__FILE__)

require 'fixjour/dsl'
require 'fixjour/builder'

module Fixjour
  def self.evaluate(&block)
    DSL.new(block)
  end
end

def Fixjour(&block)
  if block_given?
    Fixjour.evaluate(&block)
  else
    ::Fixjour
  end
end