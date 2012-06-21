before '/*' do
  @title = 'Twit Icon'
end

before '/*.json' do
  content_type 'application/json'
end

get '/' do
  haml :index
end
