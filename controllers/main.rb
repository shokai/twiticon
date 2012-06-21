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
