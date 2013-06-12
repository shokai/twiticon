helpers do
  def app_root
    "#{env['rack.url_scheme']}://#{env['HTTP_HOST']}#{env['SCRIPT_NAME']}"
  end

  def icon(user, size=:normal)
    size = size.to_sym
    halt 400, "invalid size (#{size})" unless Icon.sizes.include? size
    begin
      if url = Cache[size].get(user)
        $logger.info "cache hit (@#{user}'s #{size} icon)"
        return url
      else
        $logger.info "get @#{user}'s #{size} icon"
        url = Icon.new(user).__send__(size)
        Cache[size].set user, url
        return url
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
