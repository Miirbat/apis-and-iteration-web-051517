
#get_character_movies_from_api

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?


require 'rest-client'
require 'json'
require 'pry'

def individual_character(character)
  character_hash = JSON.parse(RestClient.get('http://www.swapi.co/api/people/'))
  single_character = nil
  while single_character == nil
    character_hash["results"].each do |one_character|
      if one_character["name"] == character
         single_character = one_character
        return single_character
      end
    end
    if character_hash["next"] == nil
      return "No"
    else
      character_hash = JSON.parse(RestClient.get(character_hash["next"]))
    end
  end
end

def get_character_movies_from_api(character)
  character_movies = individual_character(character)["films"]
  movie_list = []
  character_movies.each do |movie|
    movie_list <<  JSON.parse(RestClient.get(movie))
  end
   movie_list
end
def parse_character_movies(films_hash)
  films_hash.each do |film_data|
    film_data.each do |k, y|
      case k
      when "title"
        puts "#{k}: #{y}"
        puts "---------------------------------"
      when "episode_id"
        puts "#{k}: #{y}"
        puts "---------------------------------"
      when "opening_crawl"
        puts "#{k}:"
        puts "#{y.upcase}"
        puts "---------------------------------"
      when "director"
        puts "#{k}: #{y}"
        puts "---------------------------------"
      when "producer"
        puts "#{k}: #{y}"
        puts "---------------------------------"
      when "release_date"
        puts "#{k}: #{y}"
        puts "---------------------------------"
      when "characters"
        puts "#{k}:"
        y.each do |url|
          puts ">> #{JSON.parse(RestClient.get(url))["name"]}"
        end
        puts "---------------------------------"
      when "planets"
        puts "#{k}:"
        y.each do |url|
          puts ">> #{JSON.parse(RestClient.get(url))["name"]}"
        end
        puts "---------------------------------"
      when "starships"
        puts "#{k}:"
        y.each do |url|
          puts ">> #{JSON.parse(RestClient.get(url))["name"]}"
        end
        puts "---------------------------------"
      when "vehicles"
        puts "#{k}:"
        y.each do |url|
          puts ">> #{JSON.parse(RestClient.get(url))["name"]}"
        end
        puts "---------------------------------"
      when "species"
        puts "#{k}:"
        y.each do |url|
          puts ">> #{JSON.parse(RestClient.get(url))["name"]}"
        end
        puts "---------------------------------"
      when "created"
        puts "#{k}: #{y}"
        puts "---------------------------------"
      when "edited"
        puts "#{k}: #{y}"
        puts
      when "url"
        puts "#{k}: #{y}"
        puts "---------------------------------"
      end
    end
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
#
