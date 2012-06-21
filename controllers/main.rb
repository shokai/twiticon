before '/*.json' do
  content_type 'application/json'
end

get '/' do
  @title = 'Twit Icon'
  haml :index
end
