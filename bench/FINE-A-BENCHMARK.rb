# BENCHMARK BECAUSE BRANDON IS A BIG BABY
#
#   $ bundle install
#   $ bundle exec ruby FINE-A-BENCHMARK.rb
require "rubygems"
require "fixjour"
require "factory_girl"
require "acts_as_fu"

build_model :users do
  string :name
end

build_model :articles do
  string :title
  integer :user_id
  belongs_to :user
end

Factory.define :user do |user|
  user.sequence(:name) { |i| "User #{i}" }
end

Factory.define :article do |article|
  article.sequence(:title) { |i| "Article #{i}" }
  article.association :user
end

Fixjour do
  define User do |user|
    user.name = "User #{counter(:user)}"
  end
  
  define Article do |article|
    article.title = "Article #{counter(:article)}"
    article.user = new_user
  end
end

include Fixjour

puts "=" * 80
puts "Benching new records"
def bench_new(n)
  puts "-" * 80
  puts "Trying #{n} iterations"
  
  fixjour = Benchmark.realtime {
    n.times { new_article ; new_user }
  }

  puts "Fixjour 2:    #{fixjour}"

  factory_girl = Benchmark.realtime {
    n.times { Factory.build(:article) ; Factory.build(:user) }
  }

  puts "Factory Girl: #{factory_girl}"
end

bench_new 100
bench_new 1000
bench_new 5000

def bench_create(n)
  puts "-" * 80
  puts "Trying #{n} iterations"
  
  fixjour = Benchmark.realtime {
    n.times { create_article ; create_user }
  }

  puts "Fixjour 2:    #{fixjour}"

  factory_girl = Benchmark.realtime {
    n.times { Factory(:article) ; Factory(:user) }
  }

  puts "Factory Girl: #{factory_girl}"
end

puts "=" * 80
puts "Benching create records"
bench_create 100
bench_create 1000
bench_create 5000
