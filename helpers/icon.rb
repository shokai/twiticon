
def icon(user, size=:normal)
  key = "icon_#{user}_#{size}"
  Cache.get(key) || Cache.set(key, Icon::get(user, size), 60*60*12)
end
