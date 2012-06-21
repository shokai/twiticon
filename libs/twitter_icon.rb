
class Icon
  def self.get(screen_name, size=:normal)
    raise ArgumentError, "size must be [#{sizes.join(',')}]" unless sizes.include? size
    Twitter::profile_image screen_name, {:size => size}
  end

  def self.sizes
    [:normal, :bigger, :mini, :original]
  end
end


if $0 == __FILE__
  require 'rubygems'
  require 'twitter'
  require File.expand_path '../bootstrap', File.dirname(__FILE__)
  Bootstrap.init
  puts Icon.get 'shokai'
  puts Icon.get 'shokai', :original
end
