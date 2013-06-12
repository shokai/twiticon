helpers do
  def app_title
    "Twit Icon"
  end

  def app_root
    "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
  end

  def icon(user, size=:normal)
    size = size.to_sym
    halt 400, "invalid size (#{size})" unless Icon.sizes.include? size
    begin
      if url = Cache["icon"].get(user)
        $logger.info "cache hit (@#{user}'s #{size} icon)"
        return Icon.new(url).__send__(size)
      else
        $logger.info "get @#{user}'s #{size} icon"
        icon = Icon.new(user)
        Cache["icon"].set user, icon.url
        return icon.__send__(size)
      end
    rescue Twitter::Error::NotFound => e
      $logger.info e
      halt 404, 'not found'
    rescue => e
      $logger.info e
      halt 500, 'Internal Server Error'
    end
  end
end
