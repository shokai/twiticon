before '/*' do
  @title = 'Twit Icon'
end

before '/*.json' do
  content_type 'application/json'
end

before '/*.txt' do
  content_type 'text/plain'
end

get '/' do
  haml :index
end

get '/favicon.ico' do
  redirect icon 'shokai', :mini
end

get '/:source.css' do
  scss params[:source].to_sym
end
