$LOAD_PATH << File.dirname(__FILE__)

require 'fixjour/counter'
require 'fixjour/builder'
require 'fixjour/dsl'

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