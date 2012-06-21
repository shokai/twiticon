get /^\/([a-zA-Z0-9_]+)$/ do
  user = params[:captures].shift
  redirect icon user
end

get /^\/([a-zA-Z0-9_]+)\/(#{Icon::sizes.join('|')})$/ do
  user = params[:captures].shift
  size = params[:captures].shift.to_sym
  redirect icon user, size
end
