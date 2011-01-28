require 'rubygems'
require 'rspec'
require 'acts_as_fu'
require File.dirname(__FILE__) + "/../lib/fixjour"

build_model :users do
  string :name
  integer :age
  attr_protected :age
end

build_model :articles do
  integer :user_id
  belongs_to :user
end

build_model :comments do
  string :text
  integer :article_id
  belongs_to :article
end

class Article
  Comment = ::Comment
end