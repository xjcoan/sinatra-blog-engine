class BlogEngine < Sinatra::Base
  require "rdiscount"


  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    markdown :index
  end

  get '/blog/:post' do
    # TODO get params[:post] and match it to file in views/:post
    'This is where the #{params[:post]} blog will be'
  end

  post '/blog/create' do
    'New posts can be made here!'
  end

  put '/blog/:post/edit' do
    'edit an existing post!'
  end

  delete '/blog/:post/delete' do
    'Delete a post!'
  end

end
