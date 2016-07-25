require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

require './config/environments'



get '/' do
  erb(:index)
end

get '/login/?' do
  erb :login, locals: {title: 'Sign In'}
end

post '/login/?' do
  if user = User.authenticate(params)
    session[:user] = user
    redirect_to_original_request
  else
    flash[:notice] = "You could not be signed in. Please re-enter you email and password"
    redirect '/signin'
  end
end

get '/signup/?' do
  erb :login
end
