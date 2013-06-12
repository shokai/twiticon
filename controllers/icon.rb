get %r{^/([a-zA-Z0-9_]+)$} do |user|
  redirect icon user
end

get %r{^/([a-zA-Z0-9_]+)/(#{Icon::sizes.join('|')})$} do |user, size|
  redirect icon(user, size)
end

get %r{^/([a-zA-Z0-9_]+)\.(txt|json)$} do |user, ext|
  case ext
  when 'txt'
    icon user
  when 'json'
    {:user => user, :icon => icon(user), :size => :normal}.to_json
  end
end

get %r{^/([a-zA-Z0-9_]+)/(#{Icon::sizes.join('|')})\.(txt|json)$} do |user, size, ext|
  case ext
  when 'txt'
    icon user, size
  when 'json'
    {:user => user, :icon => icon(user,size), :size => size}.to_json
  end
end
