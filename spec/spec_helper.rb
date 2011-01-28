require 'rubygems'
require 'rspec'
require 'acts_as_fu'
require File.dirname(__FILE__) + "/../lib/fixjour"

build_model :users do
  string :name
  integer :age
  attr_protected :age
end
