class Cache
  @@cache =
    Dalli::Client.new(
                      (Conf['MEMCACHIER_SERVERS'] || Conf['MEMCACHE_SERVERS'] || 'localhost:11211') ,
                      {
                        :username => (Conf['MEMCACHIER_USERNAME'] || Conf['MEMCACHE_USERNAME']),
                        :password => (Conf['MEMCACHIER_PASSWORD'] || Conf['MEMCACHE_PASSWORD'])
                      }
                      )
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
