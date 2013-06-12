#!/usr/bin/env ruby
require 'bundler/setup'
require 'twitter'
require 'oauth'

consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'],
                               :site => 'http://api.twitter.com')
request_token = consumer.get_request_token
puts cmd = "open #{request_token.authorize_url}"
system cmd
print 'input PIN Number: '
verifier = STDIN.gets.strip
access_token = request_token.get_access_token(:oauth_verifier => verifier)

puts "-"*5
puts "export ACCESS_TOKEN=#{access_token.token}"
puts "export ACCESS_SECRET=#{access_token.secret}"
puts "-"*5

Twitter.configure do |c|
  c.consumer_key = ENV['CONSUMER_KEY']
  c.consumer_secret = ENV['CONSUMER_SECRET']
  c.oauth_token = access_token.token
  c.oauth_token_secret = access_token.secret
end

user = Twitter::user

puts "you are @#{user.screen_name}"
puts "last tweet is : #{user.status.text}"
