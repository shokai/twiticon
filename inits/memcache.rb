class Cache
  @@cache = Dalli::Client.new Conf['MEMCACHE_SERVERS'], {:username => Conf['MEMCACHE_USERNAME'], :password => Conf['MEMCACHE_PASSWORD']}
  def self.cache
    @@cache
  end

  def self.get(key)
    cache.get key
  end

  def self.set(key, value, expire=3600)
    cache.set key, value, expire
    value
  end
end
