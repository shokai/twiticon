get /^\/([a-zA-Z0-9_]+)$/ do
  user = params[:captures].shift
  redirect icon user
end

get /^\/([a-zA-Z0-9_]+)\/(#{Icon::sizes.join('|')})$/ do
  user = params[:captures].shift
  size = params[:captures].shift.to_sym
  redirect icon user, size
end

get /^\/([a-zA-Z0-9_]+)\.(txt|json)$/ do
  user = params[:captures].shift
  ext = params[:captures].shift
  case ext
  when 'txt'
    icon user
  when 'json'
    {:user => user, :icon => icon(user), :size => :normal}.to_json
  end
end

get /^\/([a-zA-Z0-9_]+)\/(#{Icon::sizes.join('|')})\.(txt|json)$/ do
  user = params[:captures].shift
  size = params[:captures].shift.to_sym
  ext = params[:captures].shift
  case ext
  when 'txt'
    icon user, size
  when 'json'
    {:user => user, :icon => icon(user,size), :size => size}.to_json
  end
end
