class PokemonClI::CLI

    def call
        puts "Welcome to the wonderful world of Pokemon!"
        puts ""
        puts "To see a list of Pokemon, enter 'I wanna be the very best'"
        puts ""
        puts "To exit the world of Pokemon, enter 'All my Pokemon have fainted'"
        API.create_pokemon
        menu
    end

    def menu
        input = gets.strip
        until input == "All my Pokemon have fainted" || input == "I wanna be the very best" do
            puts "Your Pokemon cannot learn this move, try a different one."
            puts ""
            puts "To see a list of Pokemon, enter 'I wanna be the very best'"
            puts ""
            puts "To exit the world of Pokemon, enter 'All my Pokemon have fainted'"
            input = gets.strip
        end
        if input == "I wanna be the very best"
            #API.create_pokemon
            pokemon_list
            menu2
        elsif input == "All my Pokemon have fainted"
            goodbye
        else
            invalid_entry
            menu
        end
    end

    def menu2
        puts "Do you want to see another Pokemon? Yes or No"
        input = gets.strip
        until input == "No" || input == "Yes" do
            puts "Your Pokemon cannot learn this move, would you like to try a different one? Yes or No"
            input = gets.strip
        end
        if input == "Yes"
            pokemon_list
            menu2
        else input == "No"
            goodbye
        end
    end
            

    def pokemon_list
        Pokemon.all.each.with_index(1) do |pokemon, index|
            puts "#{index}. #{pokemon.name}"
        end
        puts ""
        puts ""
        puts ""
        puts "Which Pokemon would you like more details on?"
        input = gets.strip

        pokemon_selection(input)
    end

    def pokemon_selection(pokemon)
        poke = Pokemon.find_by_name(pokemon)
        #binding.pry
        if poke == nil
            invalid_entry
            pokemon_list
        else
            poke.update_pokemon
         puts " Name: #{poke.name}"
         puts " Type:#{poke.type}"
         #menu2
        end
    end

    def goodbye
        puts "Farewell trainer, remember to stock up on potions and revives."
    end

    def invalid_entry
        puts "Your Pokemon cannot learn this move, try a different one."
        #menu
    end

end