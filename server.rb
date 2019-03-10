class BlogEngine < Sinatra::Base
  require 'rdiscount'
  require 'pathname'

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    markdown :index
  end

  get '/blog/:post' do
    path = Pathname.new("views/#{params[:post]}.md")
    if path.exist?
      erb :blog, locals: {title: params[:post], blog: markdown(params[:post].to_sym)}
    else
      "No blog with the name #{params[:post]} was found!"
    end
  end

end
