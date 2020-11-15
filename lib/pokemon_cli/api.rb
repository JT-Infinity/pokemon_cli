require_relative './pokemon.rb'
require 'open-uri'

class API

    def self.fetch_pokemon
        
        url = "https://pokeapi.co/api/v2/pokemon"

        uri = URI(url)
        response = Net::HTTP.get(uri)
        pokemon = JSON.parse(response)
    end

    def self.update_pokemon(url)

        url = URI(url)
        response = Net::HTTP.get(url)
        pokemon = JSON.parse(response)
        #pokemon["results"]["properties"]
    end

    def self.create_pokemon
        pokemon = fetch_pokemon
        pokemon["results"].each{|pokemon| Pokemon.new(pokemon["name"], pokemon["url"])}
    end

end