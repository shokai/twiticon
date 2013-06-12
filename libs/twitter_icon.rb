require 'twitter'

Twitter.configure do |c|
  c.consumer_key = ENV['CONSUMER_KEY']
  c.consumer_secret = ENV['CONSUMER_SECRET']
  c.oauth_token = ENV['ACCESS_TOKEN']
  c.oauth_token_secret = ENV['ACCESS_SECRET']
end

class Icon

  def self.sizes
    [:normal, :bigger, :mini, :original]
  end

  attr_reader :url
  def initialize(screen_name_or_url)
    if screen_name_or_url =~ /^https?:\/\//
      @url = screen_name_or_url
    else
      @url = Twitter::user(screen_name_or_url).profile_image_url
    end
  end

  def normal
    @url
  end

  def bigger
    @url.gsub(/_normal\.png$/,"_bigger.png")
  end

  def mini
    @url.gsub(/_normal\.png$/,"_mini.png")
  end

  def original
    @url.gsub(/_normal\.png$/,".png")
  end
end


if $0 == __FILE__
  icon = Icon.new 'shokai'
  puts icon.normal
  puts icon.bigger
  puts icon.mini
  puts icon.original
end
