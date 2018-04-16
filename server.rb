require 'sinatra'
require 'sinatra/reloader'
require 'swapir'

get '/' do
  "hello world"
  erb :index
end