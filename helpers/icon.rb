
def icon(user, size=:normal)
  key = "#{user}_#{size}"
  TmpCache.get(key) || TmpCache.set(key, Icon::get(user, size), 60*60*4)
end
