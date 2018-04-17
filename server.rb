require 'sinatra'
require 'sinatra/reloader'
require 'swapir'

get '/' do
  erb :index
end

post '/results/' do
  params[:q]
  category = params[:category]
  case category
  when "people"
    @attributes = [
      "height",
      "mass",
      "hair_color",
      "skin_color",
      "eye_color",
      "birth_year",
      "gender",
      "homeworld",
      "films",
      "species",
      "vehicles",
      "starships",
      "created",
      "edited",
      "url"
    ]
    @result = Swapir.search_people(params[:q])
  when "films"
    @attributes = [
      "title",
      "episode_id",
      "director",
      "producer"
    ]
    @result = Swapir.search_films(params[:q])
  when "planets"
    @result = Swapir.search_planets(params[:q])
  when "species"
    @result = Swapir.search_species(params[:q])
  when "starships"
    @attributes = [
      "name",
      "model",
      "manufacturer",
      "cost_in_credits",
      "length",
      "max_atmosphering_speed",
      "crew",
      "passengers",
      "cargo_capacity",
      "consumeables",
      "hyperdrive_rating"
    ]
    @result = Swapir.search_starships(params[:q])
  when "vehicles"
    @result = Swapir.search_vehicles(params[:q])
  end

  puts @result
  erb :results
end
