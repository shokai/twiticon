
def icon(user, size=:normal)
  key = "icon_#{user}_#{size}"
  begin
    return Cache.get(key) || Cache.set(key, Icon::get(user, size), 60*60*12)
  rescue Twitter::Error::NotFound => e
    STDERR.puts e
    throw :halt, [404, 'not found']
  rescue => e
    STDERR.puts e
    throw :halt, [500, 'Internal Server Error']
  end
end
