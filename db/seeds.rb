# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'ffaker'

def sample_text
  (1..10).map{|i|"<p>#{Faker::HTMLIpsum.fancy_string}</p>"}.join
end

User.new.tap do |u|
  u.email = 'admin@example.com'
  u.password = 'secret'
  u.save!
end

10.times do
  Post.new.tap do |post|
    post.title = Faker::Lorem.sentence
    post.body = sample_text

    rand(5).times do |i|
      post.comments.build.tap{|c| c.body = sample_text }
    end

    post.save!
  end
end

